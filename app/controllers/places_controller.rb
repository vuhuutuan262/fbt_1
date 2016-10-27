class PlacesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_place, only: [:show]

  def index
    @places = Place.all
  end

  def show
    @tours = @place.tours.page(params[:page]).per Settings.show_8
    @reviews = @place.reviews.page(params[:page]).per Settings.show_6
  end

  private
  def find_place
    @place = Place.find_by id: params[:id]
    if @place.nil?
      redirect_to root_path
    end
  end
end
