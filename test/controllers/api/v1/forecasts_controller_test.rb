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
