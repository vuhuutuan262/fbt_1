class CategoriesController < ApplicationController
  before_action :find_category, only: :show

  def show
    @tours = @category.tours.all
  end

  private
  def find_category
    @category = Category.find_by id: params[:id]
    if @category.nil?
      flash[:danger] = t "category.not_found"
      redirect_to root_url
    end
  end
end
