module Admins
    class VacationsController < ApplicationController
      before_action :authenticate_admin!
  
      def index
        # Vacations タブのデータを準備
      end
    end
  end
  