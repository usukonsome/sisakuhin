class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper

  def current_user
    if (user_id = session[:user_id])#ここでローカル変数に代入することによって問い合わせ1回で済むので読み込み速度上がる
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.digest == cookies[:digest]
        session[:user_id] = user.id
        @current_user = user
      end
    else @current_user.nil?
      name = request.remote_ip
      user = User.create(name: name)
      session[:user_id] = user.id
      remember(user)
      @current_user = user
    end
  end

  def admin
    @admin ||= session[:admin]
  end
  #session[:user_id] ||= request.remote_ip
end
