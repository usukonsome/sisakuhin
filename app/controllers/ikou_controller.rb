class IkouController < ApplicationController

  def new
  end

  def index
    redirect_to root_path
  end

  def create
    @user = User.find_by(digest: params[:ikou][:digest])
    #form_forで宛先をシンボルにした場合はparamsにも書いてあげないとデータが迷子になる
    if @user
      current_user.digest = @user.digest
      @current_user.save#これ忘れると更新されない
      cookies.permanent[:digest] = @current_user.digest#重要
      redirect_to ikou_end_path
    else
      flash.now[:notice] = "ユーザーデータが存在しません"
      render 'new'
    end
  end
end
