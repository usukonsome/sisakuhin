module UsersHelper

  def current_user
    if (user_id = session[:user_id])#ここでローカル変数に代入することによって問い合わせ1回で済むので読み込み速度上がる
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies[:user_id])
      user = User.find_by(id: user_id)
      if user && user.digest == cookies[:digest]
        session[:user_id] = user.id
        @current_user = user
      end
    else @current_user.nil?
      ip = request.remote_ip
      digest = User.new_token(10)
      user = User.create(ip: ip,digest: digest)
      session[:user_id] = user.id
      remember(user)
      @current_user = user
    end
  end

  def remember(user)
    cookies.permanent[:user_id] = user.id
    cookies.permanent[:digest] = user.digest
  end

  def current_user?(post)
    post.user_digest == current_user.digest
  end

end
