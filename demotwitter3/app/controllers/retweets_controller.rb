class RetweetsController < ApplicationController

  def show
    @retweet = Post.find(params[:id])
    @post = Post.find(@retweet.retweet_id)
  end

  def new
    @post = Post.find(params[:id])
    @retweet = @post.retweets.build
  end

  def create
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
    params.require(:post).permit(:retweet_id, :content, :avatar).merge(user_id: current_user.id)
  end
  
end
