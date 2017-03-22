module ApplicationHelper
	def total(user_id)
		@user = User.find(user_id)
		total = 0
		@user.orders.each {|o| total += o.quantity * o.book.price}
		total
	end
end
