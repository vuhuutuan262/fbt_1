class Rating < ApplicationRecord
  belongs_to :user, :tour

  has_many :activities, as: :activable, dependent: :destroy
end
