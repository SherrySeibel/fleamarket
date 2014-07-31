class Payment < ActiveRecord::Base
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  belongs_to :product

  validates :amount, presence: true
  validates :seller, presence: true
  validates :buyer, presence: true

  attr_accessor :stripe_card_token

  def save_sale
    if valid?
      customer = Stripe::Customer.create(
        description: product_id, 
        card: stripe_card_token
      )
      self.stripe_customer_token = customer.id
      save!

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )
    end

  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
  end
end
