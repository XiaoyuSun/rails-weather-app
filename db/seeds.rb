# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

  weather_data = {
    coord: {
      lon: -122.2243,
      lat: 47.7918,
    },
    weather: [
      {
        id: 804,
        main: "Clouds",
        description: "overcast clouds",
        icon: "04d",
      },
    ],
    base: "stations",
    main: {
      temp: 283.29,
      feels_like: 282.71,
      temp_min: 281.38,
      temp_max: 285.16,
      pressure: 1005,
      humidity: 90,
    },
    visibility: 10000,
    wind: {
      speed: 6.17,
      deg: 140,
      gust: 9.77,
    },
    clouds: {
      all: 100,
    },
    dt: 1711576191,
    sys: {
      type: 2,
      id: 2036677,
      country: "US",
      sunrise: 1711547771,
      sunset: 1711593103,
    },
    timezone: -25200,
    id: 0,
    name: "Bothell",
    cod: 200,
  },

Forecast.create!([{ target: '98021', weather_data: JSON.generate(weather_data) }])