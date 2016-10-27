class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :load_place, only: :home

  def show
    if valid_page?
      render "static_pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist? Pathname
      .new Rails.root + "app/views/static_pages/#{params[:page]}.html.erb"
  end

  def load_place
    @places = Place.all.order(viewer: :desc).
      limit(Settings.limit_image_view)
    @categories = Category.all
  end
end
