class AddPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :starting_price, :decimal, null: true, default: 0

    change_column_null :products, :starting_price, false
  end
end
