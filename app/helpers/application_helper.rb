module ApplicationHelper
  def total(user_id)
    @user = User.find(user_id)
    total = 0
    @user.orders.each { |o| total += o.quantity * o.book.price if o.status == 1 }
    total
  end

  def filter(category_id, books)
    books = books.select { |b| category_id.in?(b.category_ids) }
  end

  def is_admin
    current_user.admin?
  end
end
