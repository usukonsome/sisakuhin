module ApplicationHelper

  def admin
    @admin ||= session[:admin]
  end

  def time(time)
    time.strftime("%Y-%m-%d　%H:%M　")#year month day hour minute
  end
end
