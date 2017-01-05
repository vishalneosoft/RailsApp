class RetweetsController < ApplicationController

  def show
    @retweet = Post.find(params[:id])
    @post = Post.find(@retweet.retweet_id)
  end

  def new
    @post = Post.find(params[:id])
    @retweet = @post.retweets.build
    respond_to do |format|
      format.html
      format.js
    end    
  end

  def create
    @post = Post.find(params[:id])
    @retweet = @post.retweets.build(retweet_params)
    @posts = Post.all
    if @retweet.save
      respond_to do |format|
        format.html { redirect_to retweet_path(@retweet) }
        format.js 
      end
    else
      render 'new'
    end
  end

  private

  def retweet_params
    params.require(:post).permit(:retweet_id, :content, :avatar).merge(user_id: current_user.id)
  end
  
end
