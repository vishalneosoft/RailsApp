class PostsController < ApplicationController

	def index
		@user = User.find(current_user.id)
		#@posts = Post.all
		@posts = Post.paginate(:page => params[:page], :per_page => 3)
		@post = Post.new
	end

	def show
		@user = User.find(params[:id])
		@post = Post.new
		@posts = Post.all
	end

	def create
  		@user = User.find(current_user.id)
  		@post = @user.posts.new(post_params)
 
  		if @post.save
      		redirect_to user_path(current_user) 
  		else
      		flash[:error] = "Problem!"
      		redirect_to user_path(current_user)
  		end
	end

  def images
    @posts = Post.all
  end

	def destroy
		@user = User.find(current_user.id)
   	@post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to post_path(current_user)
  end
	
	private
	def post_params
		params.require(:post).permit(:content,:avatar)
	end
end
