class MessagesController < ApplicationController
	def show 
		@post = Post.find(params[:id])
		@message = Message.new
	end

	def create
  		@post = Post.find_by(user_id: current_user.id)
  		@message = @post.messages.create(message_params)
 
  		if @message.save
      		redirect_to post_path(current_user) 
  		else
      		flash[:error] = "Problem!"
      		redirect_to post_path(current_user)
  		end
	end

	private
	def message_params
		params.require(:message).permit(:content)
	end
end
