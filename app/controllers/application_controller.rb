class ApplicationController < ActionController::Base
  protect_from_forgery
    before_action :set_current_user
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def authenticate_user
        if @current_user == nil
          flash[:notice] = "ログインが必要です"
          redirect_to("/login")
        end
    end

    def forbid_login_user
        if @current_user
          flash[:notice] = "すでにログインしています"
          redirect_to("")
        end
    end

    def different_login_user

    end

    def radio_button_check
    @user = Users2.find_by(user_id: session[:user_id])
      if @user.grade == "1"
        @hoge1 = true
      elsif @user.grade == "2"
        @hoge2 = true
      elsif @user.grade == "3"
        @hoge3 = true
      else
        @hoge = false
      end
 
      if @user.time == "18時登録"
       @hoge18 = true
      elsif @user.time == "19時登録"
       @hoge19 = true
      else
        @hoge = false
      end
 
     if @user.color == "オレンジ"
       @hoge11 = true
     elsif @user.color == "黄"
       @hoge12 = true
     elsif @user.color == "赤"
       @hoge13 = true
     elsif @user.color == "緑"
       @hoge14 = true
     elsif@user.color == "青"
       @hoge15 = true
     else
        @hoge = false
     end
    end

    def menu_color
      
    end

end
