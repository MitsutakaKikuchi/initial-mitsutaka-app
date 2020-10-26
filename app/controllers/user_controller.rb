class UserController < ApplicationController
before_action :authenticate_user, {only:[:user_top,:logout]}
before_action :forbid_login_user, {only:[:login,:login_form]}

  def login_form
  end

  def login
    @user=User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/top")
    else
      @email = params[:email]
      @error_message = "ログイン情報が一致しませんでした"
      render("/user/login_form")
    end
  end

  def user_top
    @user=User.find_by(id: params[:id])
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
end
