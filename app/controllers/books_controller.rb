class BooksController < ApplicationController
	before_action :set_Book, only: [:edit, :update, :show, :destroy]
	def index
		#UserMailer.checkout_email(current_user).deliver
		if params[:id]
			#@books = Book.filter(params[:id]).order("created_at DESC")
			@books = Book.all.select {
				|b| b.category_ids.include?(params[:id].to_i) 
			}
		elsif params[:search]
			@books = Book.search(params[:search]).order("created_at DESC")
		else
			@books = Book.all
		end
		#@books = Book.paginate(:page => params[:page], :per_page => 3)
	end	

	def user_books
		@books = Book.all.select {|x| x.user.id == current_user.id}
		#debugger
		#@books = @books.paginate(:page => params[:page], :per_page => 3)
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