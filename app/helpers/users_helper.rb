module UsersHelper

  def remember(user)
    #user.remember
    cookies.permanent[:user_id] = user.id
    cookies.permanent[:digest] = user.digest
  end

  def current_user?(post)
    post.name == @current_user.digest
  end
end
