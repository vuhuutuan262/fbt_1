class User < ApplicationRecord
  has_many :bankAccounts, :bookings, :reviews, :activities, :comments,
    :likes, :ratings, dependent: :destroy
end
