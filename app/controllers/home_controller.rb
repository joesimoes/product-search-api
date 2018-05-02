class HomeController < ApplicationController
  API_URL = "http://localhost:3001"

  def index
  end

  def show
    @products = HTTParty.get("#{API_URL}/products/search?name=#{params[:search]}")
  end
end
