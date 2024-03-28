require 'rest-client'
require 'uri'

class Api::V1::ForecastsController < ApplicationController
  def index
    target = Forecast.find_by(target: params[:target])

    cached = false

    error_message = nil

    if target.nil? || target.not_updated_within_last_30_minutes
      begin
        target ||= Forecast.new(target: params[:target])
        data = get_forecast(params[:target])
        target.update(weather_data: data, updated_at: Time.now)
      rescue
        error_message = "Couldn't get weather"
      end
    else
      cached = true
    end

    render json: { weather_data: target.weather_data, cached: cached, error_message: error_message }
  end

end

def get_forecast(target)
  begin
    api_key = ENV['OPEN_WEATHER_API_KEY']
    host = "api.openweathermap.org";

    params = {
      'zip' => target,
      'appid'=> api_key
    }

    url = URI::HTTPS.build(
      host: host,
      path: '/data/2.5/weather',
      query: URI.encode_www_form(params)
    ).to_s

    response = RestClient.get(url)

    data = JSON.parse(response.body)

    if data['cod'] == 200
      return data
    else
      raise RestClient::ExceptionWithResponse, 'Error in retrieving weather data'
    end
  rescue RestClient::ExceptionWithResponse => e
    raise RestClient::ExceptionWithResponse, e.response.body
  rescue StandardError => e
    raise StandardError, e.message
  end
end
