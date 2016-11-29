class CommentsController < ApplicationController
	
	http_basic_authenticate_with name: "comment", password: "comment"

	def create
		@student = Student.find(params[:student_id])
		@comment = @student.comments.create(comment_params)
		redirect_to student_path(@student)
	end

	def destroy
    	@student = Student.find(params[:student_id])
    	@comment = @student.comments.find(params[:id])
    	@comment.destroy
    	redirect_to student_path(@student)
  	end

	private
	def comment_params
		params.require(:comment).permit(:professor_name, :comments)
	end
end
