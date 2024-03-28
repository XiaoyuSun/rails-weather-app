# README

This weather application integrates Vite, React, and Rails 7. Currently, it only handles Zip codes at this time. When provided with a US zip code, the app displays the current temperature, feels like temperature, minimum temperature for the day, and maximum temperature for the day. If the same Zip code is requested within 30 minutes, the app retrieves the data from the cache instead of making a new API call.

## Requirements

This App uses [Open Weather API](https://openweathermap.org/api), you need to store your own API key in ```/config/application.yml```
```
OPEN_WEATHER_API_KEY: "YOUR_API_KEY"
```

```
Ruby 3.3.0
Rails 7.1.3.2
Node v21.6.1
PostgreSQL > 1.1
```

## STEPS:
```
1. bundle install
2. npm install
3. rails s
```
if you want to make stying changes by Tailwind CSS, running `./bin/dev` instead of `rails s`

## Examples:
<img width="1431" alt="light-live-data" src="https://github.com/XiaoyuSun/rails-weather-app/assets/3075015/01d069df-258c-4a8d-9b16-9a7cd0ec8192">
<img width="1436" alt="light-cached-data" src="https://github.com/XiaoyuSun/rails-weather-app/assets/3075015/31aa7a6e-c29d-4404-b331-746f13f49693">
<img width="1435" alt="dark-cached-data" src="https://github.com/XiaoyuSun/rails-weather-app/assets/3075015/2b596739-142b-45e6-9a0a-f505eb9b92f1">

## Follow up
- integration with [Google's Places Autocomplete API](https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete)
- fetch ZipCode or latitude and longitude by address
- show weather for next several days (require paid plan on Open Weather.)
- create mapping function to display more weather infomation.
