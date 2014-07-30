class Product < ActiveRecord::Base
  CONDITIONS = [["New"], ["Used--Good"], ["Used--Acceptable"], ["Refurbished"], ["Poor"]]

  has_many :bids, dependent: :destroy
  has_many :images, dependent: :destroy

  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :condition, presence: true
  validates :description, presence: true
  validates :user, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :auction_starts_at, presence: true
  validates :auction_ends_at, presence: true

  def self.chronological
    order("created_at DESC")
  end
end
