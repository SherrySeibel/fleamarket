class AddPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :starting_price, :float, null: true

    update("UPDATE products SET starting_price = 0.00")

    change_column_null :products, :starting_price, false
  end
end
