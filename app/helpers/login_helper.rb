module LoginHelper

  def admin
    @admin ||= session[:admin]
  end

end
