require "rake"

namespace :discount do
  task update_discounts_status: :environment do
    current_date = Date.current

    Discount.where(status: 0, start_date: current_date).find_each do |discount|
      discount.happening!
    end

    Discount.where(status: 1, end_date: current_date).find_each do |discount|
      discount.finished!
    end
  end
end
