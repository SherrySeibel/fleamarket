class SearchesController < ApplicationController
  def show
    search = Search.new(params)
    @products = search.run.chronological
  end
end
