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
      create_stripe_customer
      create_stripe_charge
    end

  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
  end

  private

  def create_stripe_customer
    customer = Stripe::Customer.create(
      description: buyer_id, 
      card: stripe_card_token
    )
    self.stripe_customer_token = customer.id
    save!
  end

  def create_stripe_charge
    charge = Stripe::Charge.create(
      :customer    => self.stripe_customer_token,
      :amount      => (amount * 100).to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
  end
end
