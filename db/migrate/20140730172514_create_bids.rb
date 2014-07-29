class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :amount, precision: 9, scale: 2, default: 0.00, null: false
      t.integer :product_id, null: false
      t.integer :user_id, null: false
      t.string :timestamps, null: false
    end

    add_index :bids, [:amount, :product_id], unique: true
  end
end
