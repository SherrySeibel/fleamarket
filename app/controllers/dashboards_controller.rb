class DashboardsController < ApplicationController
  def show
    @search = Search.new
  end
end
