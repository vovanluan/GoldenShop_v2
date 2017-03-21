class BooksController < ApplicationController
	before_action :set_Book, only: [:edit, :update, :show, :destroy]
	def index
		@books = Book.all.select {|x| x.user.id == current_user.id}
	end	
	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user = current_user
		if @book.save
			flash[:notice] = "Book was successfully created"
			redirect_to book_path(@book)	
		else
			render 'new'
		end

	end
	def show
		@similarbooks = Book.all.select {|x| x.id != @book.id && !(x.categories & @book.categories).empty?}
	end


	def destroy 
		@book.destroy
		flash[:notice] = "Book was successfully deleted"
		redirect_to books_path
	end

	def edit
		@book = Book.find(params[:id])
		# Check current user permission
		if current_user.id != @book.user.id 
			flash[:notice] = "You don't have permission to access this page."
			redirect_to books_path
		end
	end
	def update
		if @book.update(book_params)
			flash[:notice] = "Book was successfully updated"
			redirect_to book_path(@book)
		else
			render 'edit'
		end
	end
	private
		def book_params
			params.require(:book).permit(:title, :description, :price, :in_stock, :image, category_ids: [])
		end
		def set_Book
			@book = Book.find(params[:id])			
		end


end