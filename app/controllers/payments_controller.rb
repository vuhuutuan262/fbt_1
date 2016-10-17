class PaymentsController < ApplicationController
  before_action :update, only: :show
  protect_from_forgery except: [:update]

  def new
    @payment = Payment.new
  end

  def show
    @payment = Payment.find_by id: params[:id]
    if @payment.nil?
      redirect_to root_path
    end
  end

  def create
    @payment = Payment.new registration_params
    if @payment.save
      redirect_to @payment.paypal_url(payment_path(@payment))
    else
      render :new
    end
  end

  def update
    params.permit!
    status = params[:payment_status]
    if status == "Completed"
      @payment = Payment.find params[:invoice]
      @payment.update_attributes status: status,
        transaction_id: params[:txn_id], purchased_at: Time.now
    end
  end

  private
  def registration_params
    params.require(:payment).permit(:amount)
  end
end
