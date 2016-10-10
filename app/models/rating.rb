class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  has_many :activities, as: :activable, dependent: :destroy
end
