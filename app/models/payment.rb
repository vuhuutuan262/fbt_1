class Payment < ApplicationRecord
  belongs_to :booking, :bankAccount
end
