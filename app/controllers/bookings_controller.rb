class BookingsController < ApplicationController
  before_action(only: :create) {find_object "tour", "tour_id"}
  before_action(except: :create) {find_object "tour_booking"}
  before_action :update, only: :show
  protect_from_forgery except: [:update]

  def create
    @booking = @tour.bookings.new booking_params
    @booking.user = current_user
    if @booking.save
      flash.now[:success] = t "booking.created"
      redirect_to [@tour, @booking]
    else
      flash.now[:danger] = t "booking.created_error"
      redirect_to :back
    end
  end

  def show
    authorize @booking
  end

  def update
    authorize @booking
    if params[:user_payment]
      payment = @booking.create_payment amount: @booking.total_price
      redirect_to payment.paypal_url tour_booking_path(@tour, @booking)
    elsif paypal_params[:payment_status] == "Completed"
      payment = @booking.payment
      payment.update_attributes status: "completed",
        transaction_id: paypal_params[:txn_id], purchased_at: Time.now
      @booking.pending!
    end
  end

  private
  def booking_params
    params.require(:booking).permit :start_date, :tour_id
  end

  def paypal_params
    params.permit :payment_status, :invoice, :txn_id
  end
end
