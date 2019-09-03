module UsersHelper

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:digest] = user.digest
  end

  def current_user?(post)
    post.user_id == @current_user.id
  end
end
