class ChargesController < ApplicationController
	def new
	end

	def create
	  # Amount in cents
	  @amount = params[:amount]
	  @amount = Float(@amount).round(2)
	  @amount = (@amount * 100).to_i
	  
	  flash.now[:notice] = @amount
	  flash.now[:notice] = @amount.class
	  
	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

		# Change order's status to new, then redirect to manage order page #
		current_user.orders.each {|o| o.update(status: 2)}
		redirect_to orders_path
	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to cart_path
	end
end
