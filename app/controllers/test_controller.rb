class TestController < ApplicationController
  before_action :current_user
  before_action :admin

  def new
  end

  def create
    @posts = Post.where(user_id: params[:user_id].to_i)
    @message = params[:content]
    @posts.each do |post|
      post.content = @message
      post.update(post_params)
    end
  end


private
  def post_params
    params.require(:post).permit(:content)
  end
end
