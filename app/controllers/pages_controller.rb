class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:cart]
	def home
		@categories = Category.all
		@books = Book.all
		@books = Book.paginate(:page => params[:page], :per_page => 3)
	end

	def cart
		@orders = Order.all.select {|o| o.user_id == current_user.id}	
	end
end