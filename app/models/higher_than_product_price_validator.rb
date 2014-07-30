class HigherThanProductPriceValidator < ActiveModel::EachValidator
  def validate_each(bid, attribute, value)
    product_price = bid.product.price

    if value < product_price
      bid.errors[attribute] << "must be greater than or equal to product price, enter a higher value."
    end
  end
end
