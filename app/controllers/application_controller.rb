class ApplicationController < ActionController::Base
  helper_method :current_user, :sign_in?, :authenticated?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_in?
    current_user != nil
  end
end
