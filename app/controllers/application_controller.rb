class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    parameters = %i[username name email password password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: parameters)
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[username password])
    devise_parameter_sanitizer.permit(:account_update, keys: parameters)
  end
end
