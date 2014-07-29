class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :products, dependent: :destroy

  def self.alphabetical
    order(:name)
  end
end
