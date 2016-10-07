class Tour < ApplicationRecord
  belongs_to :discount, :place, :category

  has_many :bookings, :reviews, :ratings, dependent: :destroy
end
