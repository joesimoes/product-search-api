require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let!(:product) { Product.create(name: 'jeans')}

  describe "GET search" do
    it "has a 200 status code" do
      get :search, params: {name: 'jeans'}
      expect(response.status).to eq(200)
    end

    it "returns a product" do
      get :search, params: {name: 'jeans'}
      expect(response.body).not_to be_empty
    end
  end
end
