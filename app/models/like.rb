class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true, optional: true

  has_many :activities, as: :activable, dependent: :destroy
end
