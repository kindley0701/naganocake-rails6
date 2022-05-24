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

  enum pay_method: { credit_card: 0, transfer: 1 }
end
