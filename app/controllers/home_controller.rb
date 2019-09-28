class HomeController < ApplicationController

  def top
    @posts = Post.paginate(page: params[:page],per_page: 10)
  end
end
