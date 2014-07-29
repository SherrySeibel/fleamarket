class CategoriesController < ApplicationController
  before_action :require_admin, only: [:create, :destroy]

  def index
    @categories = Category.alphabetical
    @category = Category.new
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.name = @category.name.capitalize

    if @category.save
      redirect_to :categories
    else
      @categories = Category.all
      render :index
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to :categories
  end

  private

  def category_params
    params.require(:category).
      permit(
        :name,
      )
  end
end
