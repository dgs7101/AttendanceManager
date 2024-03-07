module Admins
  class DashboardsController < ApplicationController
    before_action :authenticate_admin!

    def index
      today_records = TimeRecord.where(check_in: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
      
      subquery = today_records.select('MAX(created_at) as latest_created_at, user_id')
                              .group(:user_id)
                              .to_sql
      @time_records = TimeRecord.joins("INNER JOIN (#{subquery}) sub ON time_records.user_id = sub.user_id AND time_records.created_at = sub.latest_created_at")
                                .order(:user_id)
                                
      @user_work_times = today_records.each_with_object({}) do |record, hash|
        user_id = record.user_id
        total_seconds = if record.check_out
                          record.check_out - record.check_in
                        else
                          Time.zone.now - record.check_in
                        end
    
        hash[user_id] ||= 0
        hash[user_id] += total_seconds
      end

    end

    def all_records
      @time_records = TimeRecord.where(check_in: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(:desc)
    end

  end
end
