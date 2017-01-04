class CommentsController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @post = Post.find(params[:post_id])
    @comments = Comment.all
  end

  def new
    @user = User.find(current_user.id)
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def show
    @user = User.find(current_user.id)
    @post = Post.find(params[:post_id])
    @comments = Comment.all
  end

  def create
    @user = User.find(current_user.id)
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_comments_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
