class Bid < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :amount, presence: true,
    higher_than_product_price: true,
    highest_bid: true

  validates :product, presence: true
  validates :user, presence: true

  def self.highest_amount
    order(amount: :desc).pluck(:amount).first
  end
end
