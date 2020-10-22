class HomeController < ApplicationController
before_action :forbid_login_user,{only:[:top]}

  def top
    @user = User.new
  end
  
end
