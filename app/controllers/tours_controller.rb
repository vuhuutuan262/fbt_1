class ToursController < ApplicationController
  before_action :find_tour, only: :show

  def show
  end

  private
  def find_tour
    @tour = Tour.find_by id: params[:id]
    if @tour.nil?
      flash[:danger] = t "tour.not_found"
      redirect_to root_url
    end
  end
end
