class Payment < ApplicationRecord
  belongs_to :booking, :bank_account
end
