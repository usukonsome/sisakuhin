class HomeController < ApplicationController
  before_action :current_user
  before_action :admin

  def top
    @posts = Post.all
  end
end
