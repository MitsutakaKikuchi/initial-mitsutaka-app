class HomeController < ApplicationController
  before_action :authenticate_user,{only:[:top]}
  def top
    @user = User.find_by(id: @current_user.id)
  end

  def login
  end
end
