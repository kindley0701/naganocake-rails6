class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  validates :zip, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :pay_method, presence: true

  def full_address
    "〒" + zip + " " + address + " " + name
  end
  
  def total_amounts
    
  end
  
  enum status: { waiting: 0, confirm: 1, creating: 2, preparing: 3, shipped: 4}

  enum pay_method: { credit_card: 0, transfer: 1 }
end
