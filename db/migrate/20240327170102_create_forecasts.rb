class CreateForecasts < ActiveRecord::Migration[7.1]
  def change
    create_table :forecasts do |t|
      t.string :target
      t.json :weather_data

      t.timestamps
    end
  end
end
