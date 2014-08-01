class User < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :bids, dependent: :destroy

  def allowed_to_modify_product?(product)
    admin? || product_owner?(product)
  end

  private

  def product_owner?(product)
    product.user_id == id
  end
end
