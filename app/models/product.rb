class Product < ApplicationRecord
  has_many :inventories

  def self.search(search)
    products = Product.where("name LIKE ?", "%#{search}%")
    return products unless products.empty?

    search_words = search.split
    search_words.each do |word|
      results = Product.where("name LIKE ?", "%#{word}%")
      return results unless results.empty?
    end
  end
end
