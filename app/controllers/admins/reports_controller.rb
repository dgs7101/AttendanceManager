module Admins
    class ReportsController < ApplicationController
      before_action :authenticate_admin!

      def index
        @search = TimeRecord.ransack(params[:q])
        @all_records = @search.result.page(params[:page])
        
      end
    end
  end
  