class FollowingsController < ApplicationController
  def index
    @following = current_user.followings.all
  end

  def create
    @following = Following.new(user_id: params[:id], follower_id: current_user.id)
    if @following.save
      redirect_to root_path, notice: 'You start to follow'
    else
      redirect_to root_path, alert: 'You can not follow'
    end
  end

  def destroy
    @following = Following.find_by(user_id: params[:id], follower_id: current_user.id)
    if @following
      @following.destroy
      redirect_to users_path, notice: 'Friend has been removed'
    else
      redirect_to users_path, alert: 'You are not allowed to do this'
    end
  end
end
