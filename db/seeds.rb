# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"
puts "cleaning DB"
Article.destroy_all

puts "creating Articles"
file = URI.parse("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg").open
article = Article.new(title: "NES", body: "A great console")
article.photos.attach(io: file, filename: "nes.jpg", content_type: "image/jpeg")
article.save

file = File.open("app/assets/images/226e4004cdc17092917c1c9b3146c369.jpg")
article = Article.new(title: "Table Setting", body: "Wedding table setting ideas")
article.photos.attach(io: file, filename: "flower_table_piece.jpg", content_type: "image/jpeg")
article.save

puts "created #{Article.count} articles"
