class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    
    # def after_sign_out_path_for(resource)
    #   case resource
    #   when Admin
    #     root_path
    #   when EndUser
    #     root_path
    #   end
    # end

    def after_sign_up_path_for(resource)
        end_users_mypage_path
    end
    
    
    protected
    
    def configure_permitted_parameters
		added_attrs = [ :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number]

		devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
	end
end
