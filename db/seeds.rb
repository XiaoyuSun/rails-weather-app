# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
json = {
  "name": "Bothell",
  "latitude": 47.7735,
  "longitude": -122.204,
  "country": "US",
  "population": 47415,
  "is_capital": false
}

Forecast.create!([{ target: 'bothell', weather_data: JSON.generate(json) }])