class BooksController < ApplicationController

	def index
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	end

	def new
		@book = Book.new
		@subjects = Subject.all
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			redirect_to books_path
		else 
			@subjects = Subject.all
			render 'new'
		end
	end

	def edit
		@book = Book.find(params[:id])
		@subjects = Subject.all
	end

	def update
		@book = Book.find(param[:id])
		if @book.update(book_params)
			redirect_to @book
		else
			@subjects = Subject.all
			render 'edit'
		end
	end

	def delete
		Book.find(params[:id]).destroy
   		redirect_to books_path
	end

	def show_subjects
  		@subject = Subject.find(params[:id])
	end

	private
	def book_params
   		params.require(:book).permit(:title, :price, :subject_id, :description)
	end

end
