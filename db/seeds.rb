# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Category.destroy_all
Beverage.destroy_all

sake = Category.create!(name: "日本酒")
beer = Category.create!(name: "ビール")

Beverage.create!(
  name: "獺祭 純米大吟醸",
  description: "華やかな香りとキレのある後味が特徴の日本酒。",
  category: sake
)

Beverage.create!(
  name: "よなよなエール",
  description: "柑橘系の香りとコクが楽しめるクラフトビール。",
  category: beer
)