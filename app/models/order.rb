class Order < ActiveRecord::Base
  NOT_PAID = 1
  NEW = 2
  PREPARING = 3
  SHIPPING = 4
  DONE = 5
  CANCEL_REFUND = 6

  STATUSES = {
    NOT_PAID => 'Not Paid',
    NEW => 'New',
    PREPARING => 'Preparing',
    SHIPPING => 'Shipping',
    DONE => 'Done',
    CANCEL_REFUND => 'Cancel'
  }

  belongs_to :user
  validates :user_id, presence: true
  belongs_to :book
  validates :book_id, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :status, presence: true, numericality: { only_integer: true }
  validates_inclusion_of :status, in: STATUSES.keys

  # a helper method for the view
  def status_name
    STATUSES[status]
  end
end
