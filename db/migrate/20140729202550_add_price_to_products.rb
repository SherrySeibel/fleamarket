class AddPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price, :float, null: true
    add_index :products, :price

    update("UPDATE products SET price = 0.00")

    change_column_null :products, :price, false
  end
end
