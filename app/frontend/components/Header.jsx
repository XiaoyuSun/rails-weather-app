import React from "react";
import ToggleButton from "./ToggleButton";

const Header = () => {
  return (
    <header className="px-5 py-4 dark:text-darkText flex flex-row-reverse">
      <ToggleButton />
    </header>
  );
};

export default Header;
