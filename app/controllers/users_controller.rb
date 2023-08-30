class UsersController < Devise::RegistrationsController
    # before_action :configure_permitted_parameters, if: :devise_controller?
  
    # ...
  
    private
  
    # def configure_permitted_parameters
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :dob, :gender, :avatar])
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :dob, :gender, :avatar])
    # end
  
    def sign_up_params
      params.require(:user).permit(:name, :dob, :gender, :email, :password, :password_confirmation, :avatar)
    end
  end