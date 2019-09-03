class IkouController < ApplicationController
  before_action :current_user
  def new
  end

  def index
    redirect_to root_path
  end

  def create
    @user = User.find_by(digest: params[:ikou][:digest])
    #form_forで宛先をシンボルにした場合はparamsにも書いてあげないとデータが迷子になる
    if @user
      @posts = Post.where(name: @user.digest)
      @current_user.digest = @user.digest
      @current_user.save#これ忘れると更新されない
      @posts.each do |post|
        post.name = @current_user.digest
        post.save
      end
    else
      flash.now[:notice] = "ユーザーデータが存在しません"
      render 'new'
    end
  end
#コントローラーでポストの情報に手を加えるのでStrongParameterは使えない.送信されてくる情報のみ
end
