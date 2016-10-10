class Discount < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :tours, dependent: :destroy
end
