class AddAuctionDatesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :auction_starts_at, :datetime, null: true
    add_column :products, :auction_ends_at, :datetime, null: true

    update("UPDATE products SET auction_starts_at = created_at, auction_ends_at = created_at")

    change_column_null :products, :auction_starts_at, false
    change_column_null :products, :auction_ends_at, false
  end
end
