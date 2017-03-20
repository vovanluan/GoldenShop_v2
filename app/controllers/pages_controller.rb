class PagesController < ApplicationController
	def home
		@categories = Category.all
		@books = Book.all
		@books = Book.paginate(:page => params[:page], :per_page => 2)
	end
end