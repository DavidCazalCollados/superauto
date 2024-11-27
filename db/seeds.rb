# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

danial = User.create!(first_name: "Danial", last_name: "Jose", email: "danial@gmail.com", password: "123456")
heather = User.create!(first_name: "Heather", last_name: "Jose", email: "heather@gmail.com", password: "123456")
david = User.create!(first_name: "David", last_name: "Cazal", email: "david@gmail.com", password: "123456")

Car.create!(title: "Hyundai Elantra", description: "Great Car!", price_per_day: 200, user: danial)
Car.create!(title: "Chevrolet", description: "Yeahhhh", price_per_day: 800, user: heather)
Car.create!(title: "Ferrari", description: "Sport car", price_per_day: 1000, user: david)
Car.create!(title: "Tesla", description: "Electric car", price_per_day: 900, user: danial)
Car.create!(title: "Peugeot", description: "French car", price_per_day: 500, user: david)
