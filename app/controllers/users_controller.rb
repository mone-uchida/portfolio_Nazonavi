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
      log_in @user
      redirect_to "/home"
    else
      flash[:alert] = '入力内容にエラーがあります'
      render :new
    end
  end

  def show
    @user = User.find_by(params[:id])
    @posts = Post.where(user_id: @user.id).recent
  end

  def login_form
  end

  def login
    user = User.find_by(
      email: params[:email],
      password_digest: params[:password_digest]
    )
    if user
      flash[:notice]='ログインしました'
      log_in user
      redirect_to :home
    else
      flash[:alert]='入力内容にエラーがあります'
      render "login_form"
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.icon = params[:icon]
    @user.profile = params[:profile]

    if @user.save
      flash[:notice] = "プロフィールを編集しました"
      redirect_to edit_user_path(@user)
    else
      flash[:alert] = "変更内容にエラーがあります"
      render :edit
    end
  end

  def destroy
    log_out
    flash[:notice]="ログアウトしました"
    redirect_to "/home"
  end

  def posts_index
   @posts = Post.where(user_id: current_user.id).recent
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest, :icon, :profile)
  end
end
