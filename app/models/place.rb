class Place < ApplicationRecord
  has_many :tours, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
