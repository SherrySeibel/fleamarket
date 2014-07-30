class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url, null: false
      t.belongs_to :product, null: false

      t.timestamps null: false
    end
    add_index :images, [:product_id]
  end
end
