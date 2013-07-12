class PaymentsController < ApplicationController
  #before_action :set_payment, only: [:show, :edit, :update, :destroy]

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.valid? and @payment.charge_and_save
      redirect_to new_payment_path, notice: 'Your payment was successfully charged and you will receive an email receipt. Thank you.'
    else
      render action: :new, alert: "There was an error processing your card."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def payment_params
      params.require(:payment).permit(:invoice_id, :stripe_token, :email, :phone, :amount)
    end
end
