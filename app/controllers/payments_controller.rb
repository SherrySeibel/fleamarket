class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
    @products = Product.all
    @sellers = User.sellers
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save_sale
      redirect_to root_path
    else
      @products = Product.all
      @sellers = User.sellers
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).
      permit(
        :amount,
        :seller_id,
        :product_id,
        :stripe_card_token
    ).merge(buyer_id: current_user.id)
  end
end
