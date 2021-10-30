class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
    @event = Event.find_by(id: params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice]="投稿が完了しました"
      redirect_to users_posts_index_path(current_user)
    else
      flash[:notice]="入力内容にエラーがあります"
      render new_post_path
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end    

  def update
    @post = Post.find_by(id: params[:id])
    if @post.user == current_user && @post.update(post_params)
      flash[:notice]="編集が完了しました"
      redirect_to users_posts_index_path(current_user)
    elsif @post.user == current_user
      flash[:notice]="入力内容にエラーがあります"
      render users_posts_index_path(current_user)
    else
      flash[:notice]="他のユーザーの投稿のため、編集できません"
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to users_posts_index_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title_id, :content)
  end
end
