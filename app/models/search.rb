class Search
  include ActiveModel::Model
  
  attr_reader :query

  def initialize(attributes={})
    @query = attributes[:query]
  end

  def run
    Product.where("name || description ILIKE ?", "%#{@query}%")
  end
end
