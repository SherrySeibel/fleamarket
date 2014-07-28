class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :condition, null: false
      t.text :description, null: false
      t.belongs_to :user, index: true, null: false
      t.belongs_to :category, index: true, null: false

      t.timestamps null: false
    end
  end
end
