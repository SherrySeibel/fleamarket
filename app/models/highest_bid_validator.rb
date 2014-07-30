class HighestBidValidator < ActiveModel::EachValidator
  def validate_each(bid, attribute, value)
    highest_bid = Bid.where(product_id: bid.product_id).highest_amount || 0 

    if value <= highest_bid
      bid.errors[attribute] << "is too low, enter a higher value."
    end
  end
end
