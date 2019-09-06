class LikesController < ApplicationController
  before_action :walled

  def create
    @post = Post.find(params[:id])
    Like.create(post_id: @post.id,user_digest: current_user.digest,user_ip: @current_user.ip)
  end#user_ipを取り込む理由:複数端末からの多重いいねを察知するため(多分ない)

  def destroy
    @post = Post.find(params[:id])
    Like.where(user_digest: current_user.digest, post_id: @post.id).destroy_all
  end#アカウント移行前後での同一人物によるいいねが稀にかぶる場合があるので重複分も消す
end
