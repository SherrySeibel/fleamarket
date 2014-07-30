class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.decimal :amount, precision: 8, scale: 2, default: 0.00, null: false
      t.integer :product_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.timestamps null: false
    end

    add_index :bids, [:amount, :product_id], unique: true
  end
end
