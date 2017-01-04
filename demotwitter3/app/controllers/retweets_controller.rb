class RetweetsController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @retweet = Post.find(params[:id])
    @post = Post.find(@retweet.retweet_id)
  end

  def new
    @user = User.find(current_user.id)
    @post = Post.find(params[:id])
    @retweet = @post.retweets.build
  end

  def create
    @user = User.find(current_user.id)
    @post = Post.find(params[:id])
    @retweet = @post.retweets.build(retweet_params)
    if @retweet.save
      redirect_to retweet_path(@retweet)
    else
      render 'new'
    end
  end

  private

  def retweet_params
    params.require(:post).permit(:retweet_id, :content).merge(user_id: current_user.id)
  end
  
end
