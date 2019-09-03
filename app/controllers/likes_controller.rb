class LikesController < ApplicationController
  before_action :current_user

  def create
    @post = Post.find(params[:id])
    Like.create(post_id: @post.id,user_digest: @current_user.digest)
  end

  def destroy
    @post = Post.find(params[:id])
    Like.find_by(user_digest: @current_user.digest, post_id: @post.id).destroy
  end
end
