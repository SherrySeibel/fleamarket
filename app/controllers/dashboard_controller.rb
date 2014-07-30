class DashboardController < ApplicationController
  def show
    @search = Search.new
  end
end
