class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def search
    products = Product.search(params[:name])
    render json: products, status: :ok
  end

  private

  def product_params
    params.permit(:name, :image, :description)
  end
end
