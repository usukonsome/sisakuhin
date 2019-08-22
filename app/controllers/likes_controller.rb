class LikesController < ApplicationController
  before_action :current_user

  def create
    @post = Post.find(params[:id])
    @like = @current_user.likes.create(post_id: @post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    Like.find_by(user_id: @current_user.id, post_id: @post.id).destroy
  end
end
