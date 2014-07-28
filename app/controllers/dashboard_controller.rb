class DashboardController < ApplicationController
  def show
    @product = Product.new
  end
end
