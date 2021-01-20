class SessionsController < ApplicationController
  def create
    @user = User.find_by_username(params[:username])
    if @user
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to users_path
      flash.notice = 'Logged in!'
    else
      flash.alert = 'Invalid user name'
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:username)
    session.delete(:user_id)
    session[:user_id] = nil
    redirect_to new_session_path
    flash.notice = 'Logged out!'
  end
end
