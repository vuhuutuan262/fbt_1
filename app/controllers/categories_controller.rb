class CategoriesController < ApplicationController
  before_action(only: :show) {find_object "category", "id"}

  def show
    @tours = @category.tours.all
  end
end
