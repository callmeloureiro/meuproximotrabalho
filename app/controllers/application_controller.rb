class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Temporariamente
  if ENV["MAINTENANCE"] == "true"
    before_action :authenticate_user!
    before_action :useradmin?

    def useradmin?
      if current_user && current_user.admin == false
        if request.fullpath != '/falta-pouco'
          redirect_to falta_pouco_url
        end
      end
    end
  end

  if ENV["STAGE"] == "true"
    before_action :authenticate
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == 'Teste-MPT' && password == '7Gk29n>I'
      end
    end
  end

  private
    before_action :configure_devise_params, if: :devise_controller?
    def configure_devise_params
      devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit(:name, :email, :password, :password_confirmation, :type_user)
      end
      devise_parameter_sanitizer.permit(:account_update) do |u|
        u.permit(:name, :email, :password, :password_confirmation)
      end
    end

end
