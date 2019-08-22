class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include PostsHelper

  def current_user
    session[:user] ||= request.remote_ip
    @current_user ||= User.find_by(name:session[:user])
    if @current_user.nil?
      @current_user = User.create(name:session[:user])
    end
  end

  def admin
    @admin ||= session[:admin]
  end
end
