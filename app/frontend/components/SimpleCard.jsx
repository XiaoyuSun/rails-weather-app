import React from "react";
import {
  WiThermometer,
  WiHumidity,
  WiHot,
  WiDayHaze,
  WiThermometerExterior,
  WiTornado,
} from "react-icons/wi";

const convertKelvinToFahrenheit = (kelvin) => {
  return Math.round(kelvin * (9 / 5) - 459.67);
};

const temps = ["temp", "feels_like", "temp_min", "temp_max"];

const SimpleCard = ({ value, label }) => {
  return (
    <div className="shadow-md rounded-lg flex gap-5 dark:bg-black  p-4">
      <div className="flex items-center">
        {label === "temp" && <WiThermometerExterior className="text-3xl" />}
        {label === "feels_like" && <WiThermometer className="text-3xl" />}
        {label === "temp_min" && <WiDayHaze className="text-3xl" />}
        {label === "temp_max" && <WiHot className="text-3xl" />}
        {label === "pressure" && <WiTornado className="text-3xl" />}
        {label === "humidity" && <WiHumidity className="text-3xl" />}
      </div>
      <div className="flex flex-col justify-between items-start gap-y-2">
        <p className="text-gray-700 font-medium dark:text-blue-100">{label}</p>
        <p className="text-3xl font-bold text-blue-600">
          {temps.includes(label)
            ? `${convertKelvinToFahrenheit(value)} °F`
            : value}
        </p>
      </div>
    </div>
  );
};

export default SimpleCard;
