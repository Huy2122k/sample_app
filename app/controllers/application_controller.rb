class ApplicationController < ActionController::Base
  # include SessionsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  # def hello
  #   render html: 'hello'
  # end
  private
  def current_user?(user)
    user && user == current_user
  end
  # Confirms a logged-in user.
  def logged_in_user
    unless user_signed_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email, :password, :password_confirmation, :remember_me])
  end
end
