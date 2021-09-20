class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.icon = 'default_user.jpg'
    @user.profile = '未設定'
    if @user.save
      flash[:notice] = 'アカウントを作成しました'
      redirect_to :home
    else
      flash[:notice] = '入力内容にエラーがあります'
      render :new_user
    end
  end
  
  def login_form
  end

  def login
    @user = User.find_by(
      email: params[:email],
      password_digest: params[:password_digest]
    )
    if @user
      flash[:notice]='ログインしました'
      redirect_to :home
      session[:user_id] = @user.id
    else
      flash[:notice]='入力内容にエラーがあります'
      render "login_form"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password_digest, :icon, :profile)
  end
end
