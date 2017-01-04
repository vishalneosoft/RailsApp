class WelcomeController < ApplicationController
  def index
  	@user = User.find(current_user.id)
    @posts = Post.paginate(:page => params[:page], :per_page => 3)
  	@post = Post.new
  end
end
