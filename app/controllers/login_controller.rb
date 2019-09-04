class LoginController < ApplicationController

  def new
  end

  def create
    @admin = Admin.find_by(pass: params[:admin][:pass])
    if @admin && @admin.authenticate(params[:admin][:password])
      session[:admin] = @admin.id
      redirect_to root_path
    else
      flash[:notice] = '権限がありません'
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:admin)
    @admin = nil
    redirect_to root_path
  end
end
