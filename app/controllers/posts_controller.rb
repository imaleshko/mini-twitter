class PostsController < ApplicationController
  before_action :require_login

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
