class PostsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.name = current_user.digest
    #@post.user_id = @current_user.id#仕様変更により使わなくなりました
    if @post.save
      redirect_to root_path
    else
      flash[:notice] = '空欄、または140文字以上の文章は投稿できないよ'
      redirect_to new_post_path
    end
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
    redirect_to root_path unless @post.picture?
  end

  def mypost
    @my_items = Post.where(name: current_user.digest)
  end

  def favorite
    @favorite = Like.where(user_digest: current_user.digest)
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to root_path
    else
      flash.now[:notice] = '空欄、または140文字以上の文章は投稿できないよ'
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path#これないとページ更新されない
  end
end

private

  def post_params
    params.require(:post).permit(:content,:picture,:remove_picture)
  end

  def correct_user
    @post = Post.find(params[:id])
    if !current_user?(@post) && admin.nil?
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end
