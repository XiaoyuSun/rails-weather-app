require "test_helper"

class ForecastsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get forecasts_index_url
    assert_response :success
  end
end
require 'test_helper'

class ForecastsControllerTest < ActionDispatch::IntegrationTest

  test "should return weather data for valid target" do
    get forecasts_index_url, params: { target: 'Denver,CO' }

    assert_response :success
    assert_not_nil json['weather_data']
  end

  test "should return cached data if updated within last 30 minutes" do
    Forecast.create(target: 'Denver,CO', weather_data: {}, updated_at: 29.minutes.ago)

    get forecasts_index_url, params: { target: 'Denver,CO' }

    assert json['cached']
  end

  test "should return error message if API call fails" do
    Forecast.stub :new, ->{ raise } do
      get forecasts_index_url, params: { target: 'InvalidTarget' }

      assert_equal 'Couldn\'t get weather', json['error_message']
    end
  end

end
   test "should return 400 bad request if target is missing" do
     get forecasts_index_url

     assert_response :bad_request
   end

   test "should return error if API call returns error" do
     Forecast.stub :new, ->{ raise Forecast::Error } do
       get forecasts_index_url, params: { target: 'Denver,CO' }

       assert_equal 'Error getting weather data', json['error_message']
     end
   end

   test "should cache weather data" do
     get forecasts_index_url, params: { target: 'Denver,CO' }

     assert Forecast.find_by(target: 'Denver,CO')
   end

   test "should return cached data if updated within last 60 minutes" do
     Forecast.create(target: 'Denver,CO', weather_data: {}, updated_at: 59.minutes.ago)

     get forecasts_index_url, params: { target: 'Denver,CO' }

     assert json['cached']
   end
 