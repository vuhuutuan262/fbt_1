class Place < ApplicationRecord
  has_many :tours, :reviews, dependent: :destroy
end
