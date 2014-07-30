class User < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :bids, dependent: :destroy
end
