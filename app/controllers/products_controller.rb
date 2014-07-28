class ProductsController < ApplicationController
  def new
    @categories = Category.all
  end
end
