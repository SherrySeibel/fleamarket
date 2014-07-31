class AddStripeToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :stripe_customer_token, :string
  end
end
