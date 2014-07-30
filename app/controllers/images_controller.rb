class ImagesController < ApplicationController
  def new
    @image = Image.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @image = @product.images.new(image_params)

    if @image.save
      redirect_to @product
    else
      render :new
    end
  end

  private

  def image_params
    params.require(:image).
      permit(
        :url,
        :product_id,
    )
  end
end
