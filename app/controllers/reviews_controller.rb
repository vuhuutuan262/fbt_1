class ReviewsController < InheritedResources::Base
  before_action :load_places, only: [:new]

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

  private
  def review_params
    params.require(:review).permit :title, :content, :place_id
  end
end
