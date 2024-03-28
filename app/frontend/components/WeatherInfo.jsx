import React from "react";
import SimpleCard from "./SimpleCard";

const WeatherInfo = ({ forecasts }) => {
  const { weather_data, cached, error_message } = forecasts;

  if (error_message) {
    return <h2 className="text-red-500">Error: {error_message}</h2>;
  }

  const { main, wind, clouds } = weather_data;

  return (
    <>
      {cached && <div className="text-4xl">Using cached data.</div>}
      <div className="grid grid-cols-2 gap-4">
        {Object.keys(main).map((key) => {
          return <SimpleCard key={key} value={main[key]} label={key} />;
        })}
      </div>
    </>
  );
};

export default WeatherInfo;
