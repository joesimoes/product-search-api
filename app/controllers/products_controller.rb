class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def search
    products = Product.search(params[:name])
    products_with_inventory = []
    products.each do |product|
      products_with_inventory << product.as_json.merge(inventory: product.inventories)
    end
    render json: products_with_inventory, status: :ok
  end

  private

  def product_params
    params.permit(:name, :image, :description)
  end
end
