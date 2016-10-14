class Category < ApplicationRecord
  include ImageValidations

  has_many :tours, dependent: :destroy
end
