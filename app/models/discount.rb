class Discount < ApplicationRecord
  has_many :bookings, through: :tours
  has_many :tours, dependent: :destroy

  validates :name, presence: true, length: {minimum: 6}
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :percent, presence: true

  enum status: [:oncoming, :happening, :finished]
end
