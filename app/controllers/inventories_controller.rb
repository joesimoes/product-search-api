class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :update, :destroy]
end
