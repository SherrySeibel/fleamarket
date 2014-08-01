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

  def auction_active?(product)
    product.auction_starts_at < DateTime.now && product.auction_ends_at > DateTime.now
  end

  def auction_time_remaining
    product_end = @product.auction_ends_at
    current_time = DateTime.now

    time_remaining = product_end - current_time
    @minutes, @seconds = time_remaining.divmod(60)
    @hours, @minutes = @minutes.divmod(60)
    @days, @hours = @hours.divmod(24)

  end
end
