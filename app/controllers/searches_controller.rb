class SearchesController < ApplicationController
  def show
    search = Search.new(params)
    @products = search.results.chronological
  end
end
