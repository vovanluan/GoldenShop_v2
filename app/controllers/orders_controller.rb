class OrdersController < ApplicationController
	def create
		@order = Order.new(create_params)
		if @order.save
			flash[:notice] = "Added book to cart"
			redirect_to cart_path
		else
			flash[:alert] = "Failed"
			redirect_to book_path
		end
	end

	private
	def create_params
		params.require(:order).permit(:book_id, :user_id, :quantity)
	end
end