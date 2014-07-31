class User < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :bids, dependent: :destroy

  has_many :payments

  has_many :buyers, 
    class_name: "Payment",
    foreign_key: :buyer_id

  has_many :sellers,
    class_name: "Payment",
    foreign_key: :seller_id
end
