class Product < ApplicationRecord
  has_many :inventories

  def self.search(search)
    search_words = search.split(',')
    Product.where("name LIKE ?", "%#{search}%")
  end
end
