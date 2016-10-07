class Booking < ApplicationRecord
  belongs_to :user, :tour, :discount

  has_one :payments
  has_many :activities, as: :activable, dependent: :destroy
end
