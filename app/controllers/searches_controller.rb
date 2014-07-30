class SearchesController < ApplicationController
  def create
    search = Search.new(search_params)
    @products = search.run
    render :show
  end

  private

  def search_params
    params.require(:search).
      permit(
        :query
    )
  end
end
