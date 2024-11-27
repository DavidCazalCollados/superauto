# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Car.create!(title: "Hyundai Elantra", description: "Great Car!", price_per_day: 200, user_id: 2)
Car.create!(title: "Chevrolet", description: "Yeahhhh", price_per_day: 800, user_id: 2)
Car.create!(title: "Ferrari", description: "Sport car", price_per_day: 1000, user_id: 2)
Car.create!(title: "Tesla", description: "Electric car", price_per_day: 900, user_id: 2)
Car.create!(title: "Peugeot", description: "French car", price_per_day: 500, user_id: 2)
