module Admins
    class StaffManagementsController < ApplicationController
      before_action :authenticate_admin!
  
      def index
        # StaffMangements タブのデータを準備
      end
    end
  end
  