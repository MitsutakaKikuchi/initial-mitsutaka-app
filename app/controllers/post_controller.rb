class PostController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user
  before_action :radio_button_check,{only:[:edit,:update,:show]}

  def user
    @user = User.find_by(id: session[:user_id])

  end

  def create
    max = Users2.where(user_id: @current_user.id).maximum(:arrive_id)
    if max == nil
      max =@current_user.id.to_i * 10000 + 1001
    else
      max = Users2.where(user_id: @current_user.id).maximum(:arrive_id) + 1
    end

        @user = Users2.new(
          name: params[:name],
          kana: params[:kana],
          grade: params[:grade], 
          time: params[:time] ,
          color: params[:color],
          user_id: @current_user.id,
          arrive_id: max)

      if @user.save
        flash[:notice] = "児童の登録が完了しました"
        redirect_to("/students")
      else
        @error_message = "空欄があります"
        @user = Users2.all
        @name = params[:name]
        @kana = params[:kana]

        if params[:grade] == "1"
          @hoge1 = true
        elsif params[:grade] == "2"
          @hoge2 = true
        elsif params[:grade] == "3"
          @hoge3 = true
        else
          @hoge = false
        end
  
      if params[:time] == "18時登録"
        @hoge18 = true
      elsif params[:time] == "19時登録"
        @hoge19 = true
      else
          @hoge = false
      end
  
      if params[:color] == "オレンジ"
        @hoge11 = true
      elsif params[:color] == "黄"
        @hoge12 = true
      elsif params[:color] == "赤"
        @hoge13 = true
      elsif params[:color] == "緑"
        @hoge14 = true
      elsif params[:color] == "青"
        @hoge15 = true
      else
        @hoge = false
      end
        render("user/user_top")
      end
  end


  def home_time
    @kids_post = Arrive.new
    @time = Timelist.all
    @user = User.find_by(id: session[:user_id])

  end

  def kidspost
    if Users2.find_by(arrive_id: params[:arrive_id])
      user = Users2.find_by(arrive_id: params[:arrive_id])
      
      if (@current_user.id.to_i == user.user_id.to_i) then
        @kana = user.kana
        @grade = user.grade

        @kids_post = Arrive.new(
          user_id:@current_user.id,
          time:params[:time],
          pick_up: params[:pick_up], 
          arrive_id: params[:arrive_id],
          message:params[:message],
          kana: @kana,
          grade: @grade
          )

        if @kids_post.save
          flash[:notice] = "#{@kana}さんの登録が完了しました"
          @time = params[:time]
          render("post/home_time")

        else
          @error_message = "空欄があります"
          @user_id = params[:user_id]
          @time = params[:time]
          @message = params[:message]
            if params[:pick_up] == "一人帰り"
              @hoge20 = true
            elsif params[:pick_up] == "お迎え"
              @hoge21 = true
            else
              @hoge = false
            end
          render("post/home_time")
        end
      else
        flash[:notice] = "このIDは本アカウントでは無効です"
        redirect_to("/home_time" )
      end
    else
      flash[:notice] = "このIDは登録されていません"
      redirect_to("/home_time" )
    end
  end

  def absence_home_time
    @absence = Arrive.new
  end


  def absence
    if Users2.find_by(arrive_id: params[:arrive_id])
      user = Users2.find_by(arrive_id: params[:arrive_id])
      
      if (@current_user.id.to_i == user.user_id.to_i) then
        @kana = user.kana
        @grade = user.grade

        @absence = Arrive.new(
          user_id: @current_user.id.to_i,
          pick_up: 'おやすみ', 
          arrive_id: params[:arrive_id],
          message: params[:message],
          kana: @kana,
          grade: @grade
          )

        if @absence.save
          flash[:notice] = "#{@kana}さんの登録が完了しました"
          render("post/absence_home_time")
        end

      else
        flash[:notice] = "このIDは本アカウントでは無効です"
        redirect_to("/absence" )
      end
    else
      flash[:notice] = "このIDは登録されていません"
      redirect_to("/absence" )
    end
  end


  def kids_all_delete
    @All_user = Arrive.where(user_id: @current_user.id)
    @All_user.delete_all
    flash[:notice] = "リセットが完了しました"
    redirect_to("/list" )
  end

  def postshow
    #下校時間リスト上での名前選択先
    @postuser = Arrive.find_by(time: params[:time])

  end

  def show
    #登録児童の表示

    if Users2.find_by(arrive_id: params[:id])
      @user = Users2.find_by(arrive_id: params[:id])
      user_id = @user.user_id
      @arrive = Arrive.find_by(arrive_id: params[:id])
      
      if user_id.to_i != @current_user.id.to_i

        flash[:notice] = "このIDは本アカウントでは無効です"
        redirect_to("/students" )
      end
    else
      flash[:notice] = "このIDは本アカウントでは無効です"
      redirect_to("/students" )
    end

  end

  def kids_list
    @all_user = Arrive.all
    @time = Arrive.where(user_id: @current_user.id).where.not(time: nil).select(:time).distinct.order(:arrive_id)
    @absence = Arrive.where(user_id: @current_user.id).where(pick_up: "おやすみ").order(:arrive_id)
  end

  def edit
    @user = Users2.find_by(id: params[:id])
  end

  def update
    @user = Users2.find_by(id: params[:id])
    @user.name = params[:name]
    @user.kana = params[:kana]
    @user.grade = params[:grade]
    @user.time = params[:time]
    @user.color = params[:color]
    if @user.save
      flash[:notice] = "児童の情報を編集しました"
      redirect_to("/students")
    else
      @error_message = "空欄があります"
      @user = Users2.find_by(id: params[:id])    
      render("post/edit")
    end
  end


  def destroy
    @user = Users2.find_by(id: params[:id])
    @user.destroy

    if find_by(arrive_id: @user.arrive_id)
    @arrive = Arrive.find_by(arrive_id: @user.arrive_id)
    @arrive.destroy
    end
    flash[:notice] = "削除が完了しました"
    redirect_to("/students")
  end

  def kids_destroy
    if Arrive.find_by(id: params[:id])
    @arrive = Arrive.find_by(id: params[:id])
    @user = Arrive.find_by(id: params[:id])
    @arrive.destroy
    flash[:notice] = "#{@user.kana}さんの下校情報を削除しました"
    redirect_to("/students")
    elsif Arrive.find_by(arrive_id: params[:id])
      @arrive = Arrive.find_by(arrive_id: params[:id])
      @user = Arrive.find_by(arrive_id: params[:id])
      @arrive.destroy
      flash[:notice] = "#{@user.kana}さんの下校情報を削除しました"
      redirect_to("/students")
    else
      flash[:notice] = "下校時間が登録されていません"
      redirect_to("/students")
    end
  end
end
