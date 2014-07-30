class AddPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :starting_price, :decimal, null: false, default: 0
  end
end
