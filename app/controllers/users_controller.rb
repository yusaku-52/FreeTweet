class UsersController < ApplicationController
  before_action :authenticate_user,{only:[:index,:show,:edit,:update]}
  before_action :forbid_login_user,{only:[:new,:create,:login_form,:login]}
  before_action :ensure_correct_user,{only:[:edit,:update]}

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(name: params[:name], email: params[:email],image_name: "default_user.gif",password: params[:password])

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")

    else
      render("home/top")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end

    if @user.save
      flash[:notice] = "編集が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが違います"
      @email = params[:email]
      @password = params[:password]
      @user = User.new
      render("home/top")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/home/top")
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

  def likes
    @likes = Like.where(user_id: params[:id])
    @user = User.find_by(id: params[:id])
  end
  
  
  
  
  
  
  
  

end
