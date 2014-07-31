class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
    @products = Product.all
    @sellers = User.where("id != ?", current_user.id)
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      redirect_to root_path
    else
      @products = Product.all
      @sellers = User.where("id != ?", current_user.id)
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).
      permit(
        :amount,
        :buyer,
        :seller,
        :product_id,
    )
  end
end
