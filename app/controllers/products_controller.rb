class ProductsController < ApplicationController
  before_action :require_owner, only: [:edit, :update]

  def new
    @categories = Category.alphabetical
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)
    @categories = Category.all

    if @product.save
      redirect_to current_user
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @bid = Bid.new
    @bids = @product.bids.order(amount: :desc)
    @highest_bid = @bids.first
  end

  def edit
    @product = current_user.products.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = current_user.products.find(params[:id])
    @categories = Category.all

    if @product.update(product_params)
      redirect_to @product
    else
      @bid = Bid.new
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).
      permit(
        :name,
        :description,
        :condition,
        :category_id,
        :price,
        :auction_starts_at,
        :auction_ends_at,
        :url,
    )
  end
end
