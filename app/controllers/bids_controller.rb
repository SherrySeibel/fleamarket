class BidsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @bid = current_user.bids.new(bid_params.merge(product_id: @product.id))

    if @bid.save
      redirect_to @product
    else
      @bids = @product.bids.order(amount: :desc)
      @highest_bid = @bids.first
      render "products/show"
    end
  end

  private

  def bid_params
    params.require(:bid).
      permit(
        :amount,
      )
  end
end
