class PostsController < ApplicationController
  include ApplicationHelper#viewでは問題ないけどコントローラーで使いたい場合は記述必須
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :walled, only: [:new,:create,:edit,:update,:destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_digest= current_user.digest
    if @post.save
      redirect_to root_path
    else
      flash[:notice] = '空欄、または140文字以上の文章は投稿できないよ。あと画像のサイズは5MBまでだよ'
      redirect_to new_post_path
    end
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def mypost
    @my_items = current_user.creating
  end

  def favorite
    @favorite = current_user.fav
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path#これないとページ更新されない
  end

  def correct_user
    @post = Post.find(params[:id])
    admin
    if !current_user?(@post) && admin.nil?
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end

private

    def post_params
      params.require(:post).permit(:content,:picture,:remove_picture)
    end
end
