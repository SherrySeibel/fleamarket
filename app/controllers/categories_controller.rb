class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @categories = @categories.alphabetical
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

  private

  def category_params
    params.require(:category).
      permit(
        :name,
      )
  end
end
