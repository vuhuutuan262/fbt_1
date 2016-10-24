class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  belongs_to :discount

  has_one :payment
  has_many :activities, as: :activable, dependent: :destroy

  enum status: [:init, :pending, :accepted, :ignored, :canceled]

  before_create :apply_discount, unless: :discount

  private
  def apply_discount
    unless discount && total_price
      if tour.discount
        discount = tour.discount
        total_price = tour.price - tour.price * discount
        discount_id = discount.id
      else
        total_price = tour.price
      end
    end
  end
end
