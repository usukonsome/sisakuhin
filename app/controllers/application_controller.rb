class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper
  include LoginHelper

  def walled_user(string)
    @false_ip ||= ENV["FALSE_IP"]
    #空だと毎回環境変数読み込む可能性があるから何か入れとく方が良いのかも。if飛ばすのとどっちが早いのか
    if !@false_ip.nil?
      return true if @false_ip.include?(string)
    end
  end

  def walled
    if walled_user(current_user.name)
      redirect_to root_path
      flash[:notice] = '現在アクセス制限中です'
    end
  end
end
