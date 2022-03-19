class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :genre

  validates :name, presence: true, uniqueness: true
  validates :caption, presence: true
  validates :unit_price, presence: true

  def price
    (unit_price * 1.08).to_i
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
