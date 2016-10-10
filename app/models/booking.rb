class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  belongs_to :discount

  has_one :payments
  has_many :activities, as: :activable, dependent: :destroy
end
