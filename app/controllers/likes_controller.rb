class LikesController < ApplicationController
  before_action :current_user

  def create
    @post = Post.find(params[:id])
    like = Like.find_by(user_digest: @current_user.digest, post_id: @post.id)
    if like == nil
      Like.create(post_id: @post.id,user_digest: @current_user.digest)
    else
      既にいいねしてあるよ
    end
  end

  def destroy
    @post = Post.find(params[:id])
    Like.find_by(user_digest: @current_user.digest, post_id: @post.id).destroy
  end
end
