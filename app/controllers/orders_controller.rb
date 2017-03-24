class OrdersController < ApplicationController
	def create
		@order = Order.new(create_params)
		@book = @order.book
		if @order.quantity > @book.in_stock 
			flash[:alert] = "You can't order more than number of books in stock. Please decrese the number of books you want to order."
			redirect_to book_path(@book.id)
			return
		end		
		if @order.save
			flash[:notice] = "Added book to cart"
			redirect_to cart_path
		else
			flash[:alert] = @order.errors.full_messages
			redirect_to book_path(@book.id)
		end
	end

	def update
		@order = Order.find(params[:id])
		# CONVERT status string into status integer
		status = 2
		Order::STATUSES.each {|k, v| status = k if v == update_params[:status]}
		if @order.update(status: status)
			flash[:notice] = "Updated order's status successfully"
		else
			flash[:alert] = "Can't not update order status. Please check the below errors:\n" + @order.errors.full_messages.first
		end
		redirect_to orders_path
	end

	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to cart_path
	end

	def index
		if current_user.admin?
			@orders = Order.all.select {|o| o.status != 1}
		else	
			@orders = Order.all.select {|o| o.status != 1 && current_user.id == o.user_id}
		end
	end

	private
	def create_params
		params.require(:order).permit(:book_id, :user_id, :quantity)
	end
	def update_params
		params.require(:order).permit(:status)
	end
end