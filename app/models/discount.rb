class Discount < ApplicationRecord
  has_many :bookings, :tours, dependent: :destroy
end
