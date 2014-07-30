class Search
  include ActiveModel::Model
  
  def initialize(attributes={})
    @query = attributes[:query]
  end
  
  def results
    Product.where("name ILIKE :query OR description ILIKE :query", query: "%#{@query}%")
  end
end
