class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :price, presence: true
  validates :amount, presence: true
  validates :making_status, presence: true

  def subtotal
    price * amount
  end

  enum making_status: { unstartable: 0, waiting: 1, creating: 2, completed: 3}

end
