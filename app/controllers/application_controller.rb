class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        session[:user_id] = user.id
        @current_user = user
      end
    elsif (@current_user == nil)
      name = SecureRandom.urlsafe_base64
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
