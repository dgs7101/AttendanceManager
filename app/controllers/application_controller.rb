class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        # 管理者用のカラムを許可
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
        devise_parameter_sanitizer.permit(:account_update, keys: [:role])
    end

    def after_sign_in_path_for(resource)
        if resource.is_a?(Admin)
            admins_root_path
        else
            root_path 
        end
    end
end