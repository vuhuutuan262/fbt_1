require "rake"

namespace :rating do
  task update_tours_rating: :environment do
    time_range = 6.hours.ago..Time.current
    tours = Tour.includes(:reviews).where(reviews: {updated_at: time_range})
    tours.each do |tour|
      rate = (tour.ratings.average(:rate).to_f*2).round/2.0
      tour.update_attributes rate: rate
    end
  end
end
