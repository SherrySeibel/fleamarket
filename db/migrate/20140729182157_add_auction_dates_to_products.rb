class AddAuctionDatesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :auction_started_at, :datetime
    add_column :products, :auction_ended_at, :datetime
  end
end
