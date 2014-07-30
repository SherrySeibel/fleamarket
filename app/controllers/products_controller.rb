class ProductsController < ApplicationController
  def new
    @categories = Category.all
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
    @image = Image.new
    @images = @product.images
  end

  def edit
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
