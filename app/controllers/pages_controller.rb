class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:cart]
  def cart
    @orders = Order.all.select { |o| o.user_id == current_user.id && o.status == 1 }
  end
end
