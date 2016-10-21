class ToursController < ApplicationController
  before_action(only: :show) {find_object "tour", "id"}
  def index
    @tours = Tour.all
  end

  def show
  end
end
