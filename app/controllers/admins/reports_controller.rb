module Admins
    class ReportsController < ApplicationController
      before_action :authenticate_admin!
      require 'csv'

      def index
        @search = TimeRecord.ransack(params[:q])
        records = @search.result.order(check_in: :desc)
        @all_records =  records.page(params[:page])
        respond_to do |format|
          format.html
          format.csv { send_reports_csv(records) }
        end
      end

      private
        def send_reports_csv(records)
          filename = "出退勤履歴一覧-#{Date.today}.csv"
    
          csv_data = CSV.generate(headers: true) do |csv|
            csv << ['社員名', '出勤時刻', '退勤時刻']
            records.each do |record|
              csv << [record.user.username, record.check_in, record.check_out]
            end
          end
          send_data csv_data, filename: filename, type: :csv
      end
  end
end