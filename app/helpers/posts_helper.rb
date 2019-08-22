module PostsHelper
  def current_user?(post)
    post.user_id == @current_user.id
  end
end
