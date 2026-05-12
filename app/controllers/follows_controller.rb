class FollowsController < ApplicationController
  before_action :require_login

  def create
    current_user.follows.create(followee_id: params[:id])
    redirect_back fallback_location: users_path
  end

  def destroy
    follow = current_user.follows.find_by(followee_id: params[:id])
    follow&.destroy

    redirect_back fallback_location: users_path
  end
end
