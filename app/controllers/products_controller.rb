class ProductsController < ApplicationController
  def new
    @categories = Category.all
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)
    @categories = Category.all

    if @product.save
      redirect_to :products
    else 
      render :new
    end
  end

  def index
    @products = current_user.products
  end

  private

  def product_params
    params.require(:product).
      permit(
        :name,
        :description,
        :condition,
        :category_id
    )
  end
end
