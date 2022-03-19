class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
<<<<<<< HEAD

  validates :name, presence: true, uniqueness: true

=======
>>>>>>> d8285dd (made page[public(items#index), admin(genres#index, genres#edit, items#index, items#new, items#show)])
end
