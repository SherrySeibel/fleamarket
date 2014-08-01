class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount, null: false, default: 0, precision: 8, scale: 2
      t.belongs_to :buyer, index: true, null: false
      t.belongs_to :seller, index: true, null: false
      t.belongs_to :product, index: true, null: false
      t.string :stripe_customer_token, null: false

      t.timestamps null: false
    end
  end
end
