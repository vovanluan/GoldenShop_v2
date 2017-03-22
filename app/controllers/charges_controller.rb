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

	  # TODO: After successful payment, change orders status and redirect to another path
	  
	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to cart_path
	end
end
