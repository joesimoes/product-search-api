# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

products_csv_text = File.read(Rails.root.join('lib', 'seeds', 'products.csv'))
products = CSV.parse(products_csv_text, :headers => true, :encoding => 'ISO-8859-1')

inventory_csv_text = File.read(Rails.root.join('lib', 'seeds', 'inventory.csv'))
inventory = CSV.parse(inventory_csv_text, :headers => true, :encoding => 'ISO-8859-1')

products.each do |product|
    p = Product.new
    p.id = product['product_id']
    p.name = product['product_name']
    p.image = product['product_image']
    p.description = product['product_description']
    p.save
    puts "#{p.name} saved"
end
#
inventory.each do |item|
    puts item
    i = Inventory.new
    i.product_id = item['product_id']
    i.waist = item['waist']
    i.length = item['length']
    i.style = item['style']
    i.count = item['count']
    i.save
    puts "#{i.style} saved"
end
