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
      @posts = Post.where(user_id: @user.id)
      @posts.each do |post|
        post.user_id = @current_user.id
        post.save
      end
    else
      flash.now[:notice] = "ユーザーデータが存在しません"
      render 'new'
    end
  end
#コントローラーでポストの情報に手を加えるのでStrongParameterは使えない.送信されてくる情報のみ
end
