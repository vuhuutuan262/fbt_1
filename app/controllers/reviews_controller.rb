class ReviewsController < ApplicationController
  skip_filter :authenticate_user!, only: :show
  before_action :load_places, only: [:new, :edit]
  before_action :find_review, except: [:new, :create, :index]

  def show
  end

  def new
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.reviews.build review_params
    if @review.save
      flash.now[:success] = t "review.create_success"
      redirect_to @review
    else
      flash.now[:danger] = t "review.create_error"
      load_places
      render :new
    end
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    if @review.update_attributes review_params
      flash.now[:success] = t "review.updated_success"
      redirect_to @review
    else
      load_places
      render :edit
    end
  end

  def destroy
    authorize @review
    if @review.destroy
      flash.now[:success] = t "review.destroyed_success"
    else
      flash.now[:danger] = t "review.destroyed_error"
    end
    redirect_to root_url
  end

  private
  def review_params
    params.require(:review).permit :title, :content, :place_id
  end

  def find_review
    @review = Review.find_by id: params[:id]
    if @review.nil?
      flash.now[:danger] = t "review.not_found"
      redirect_to root_url
    end
  end
end
