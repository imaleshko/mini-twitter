class HomeController < ApplicationController
  before_action :require_login

  def index
    user_ids = current_user.followees.pluck(:id) << current_user.id
    @posts = Post.includes(:user).where(user_id: user_ids).order(created_at: :desc)
    @post = Post.new
  end
end
