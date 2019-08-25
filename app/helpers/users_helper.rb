module UsersHelper

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user?(post)
    post.user_id == @current_user.id
  end
end
