class Address < ApplicationRecord
  belongs_to :customer

  validates :zip, presence: true
  validates :address, presence: true
  validates :name, presence: true
  
  def full_address
    "〒" + zip + " " + address + " " + name
  end

end
