import React, { useState } from "react";
import WeatherInfo from "./WeatherInfo";
import Loading from "./Loading";

const isValidZipCode = (zipCode) => {
  return /^(\d{5})$|^(\d{5}-\d{4})$/.test(zipCode);
};

const Search = () => {
  const [searchTerm, setSearchTerm] = useState("");
  const [forecasts, setForecasts] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error_message, setErrorMessage] = useState(null);

  const handleKeyDown = (event) => {
    if (event.key === "Enter") {
      handleSubmit();
    }
  };

  const handleSubmit = () => {
    setForecasts(null);

    if (!isValidZipCode(searchTerm)) {
      setErrorMessage("Invalid zip code");
    } else {
      setErrorMessage(null);
      setLoading(true);

      fetch(`/api/v1/forecasts?target=${searchTerm}`)
        .then((res) => res.json())
        .then((data) => {
          setLoading(false);
          setForecasts(data);
        });
    }
  };

  return (
    <div
      tabIndex={0}
      onKeyDown={handleKeyDown}
      className="w-full max-w-md mx-auto mt-8 flex flex-col gap-4 dark:text-darkText"
    >
      <label className="block text-sm font-bold mb-2">Zip Code</label>
      <input
        type="text"
        value={searchTerm}
        placeholder="Enter Zip Code"
        onChange={(e) => setSearchTerm(e.target.value)}
        className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
      />

      <button
        onClick={handleSubmit}
        className="bg-blue-500 hover:bg-blue-400 text-white font-bold py-2 px-4 border-b-4 border-blue-700 hover:border-blue-500 rounded"
      >
        Submit
      </button>
      {error_message && <p className="text-red-500">{error_message}</p>}
      {loading && <Loading />}
      {forecasts && <WeatherInfo forecasts={forecasts} />}
    </div>
  );
};

export default Search;
