class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :condition, presence: true
  validates :description, presence: true
  validates :user, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :auction_starts_at, presence: true
  validates :auction_ends_at, presence: true

  has_many :images
  belongs_to :user
  belongs_to :category

  CONDITIONS = [["New"], ["Used--Good"], ["Used--Acceptable"], ["Refurbished"], ["Poor"]]
end
