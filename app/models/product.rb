class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :condition, presence: true
  validates :description, presence: true
  validates :user, presence: true
  validates :category, presence: true

  belongs_to :user
  belongs_to :category

  has_many :product_categories
  has_many :categories, through: :product_categories
end
