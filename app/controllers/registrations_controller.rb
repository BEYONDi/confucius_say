class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit( :first_name, :last_name, :email, :password, :password_confirmation )
  end
  
  def sign_up_params
    params.require(:user).permit( :first_name, :last_name, :email, :password, :password_confirmation, :current_password )
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :first_name, :last_name, :email, :password )}
  # end
    # def registration_params
    #   params.require(:user).permit( :email, :first_name, :last_name, :password, :password_confirmation )
    # end
end
