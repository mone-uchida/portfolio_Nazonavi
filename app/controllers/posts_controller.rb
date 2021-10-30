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
      redirect_to user_posts_path(current_user)
    else
      flash[:notice]="入力内容にエラーがあります"
      render ("posts/new")
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title_id, :content)
  end
end
