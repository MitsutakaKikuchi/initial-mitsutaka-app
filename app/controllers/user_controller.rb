class UserController < ApplicationController
before_action :authenticate_user, {only:[:user_top,:logout]}
before_action :forbid_login_user, {only:[:login,:login_form]}

  def sign_up
  end

  def sign_up_user
    @user = User.new(name: params[:name], email:params[:email], password:params[:password])
    if @user.save
      flash[:notice] = "#{@user.name}さんの登録が完了しました"
      session[:user_id] = @user.id
      redirect_to("/top")
    else
      flash[:notice] = "さんの登録が完了しました"
      @name = params[:name]
      @email = params[:email]
      render("sign_up")
    end
  end

    def delete
      @user = User.find_by(id: @current_user.id)
      @user.destroy
      flash[:notice] = "現場登録情報が削除されました"
      redirect_to("/login")
    end

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
    @user = User.find_by(id: params[:id])
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
end
