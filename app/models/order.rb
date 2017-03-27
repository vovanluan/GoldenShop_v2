class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  validates :quantity, presence: true, numericality: { greater_than: 0 }
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

  validates_inclusion_of :status, in: STATUSES.keys,
      message: "{{value}} must be in #{STATUSES.values.join ','}"

  # just a helper method for the view
  def status_name
    STATUSES[status]
  end
end
