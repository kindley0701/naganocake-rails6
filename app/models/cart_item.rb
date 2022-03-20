class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def subtotal
    (item.unit_price * 1.08 * amount).to_i
  end

end
