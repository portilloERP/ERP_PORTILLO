import React, { useState, useEffect, useContext } from "react";
import { getObjecion } from "./getObjecion";
import { Autocomplete, TextField } from "@mui/material";
import { AuthContext } from "../../../auth";

const defaultOption = {
  value: null,
  label: "Selecciona una objecion",
  id: null,
};

export const FilterObjecion = ({
  defaultValue = null,
  onNewInput,
  active = false,
}) => {
  const [options, setOptions] = useState([defaultOption]);
  const [value, setValue] = useState(defaultOption);
  const { authTokens } = useContext(AuthContext);

  const obtenerObjecion = async () => {
    const result = await getObjecion(authTokens["access"]);
    const formatSelect = [
      defaultOption,
      ...result.map((element) => {
        return {
          value: element.id,
          label: element.nombre,
          id: element.id,
        };
      }),
    ];
    setOptions(formatSelect);
    // verficar si defualtvalue coincide
    const defaultValueOption = formatSelect.find(
      (option) => option.id === defaultValue
    );
    if (defaultValueOption) {
      setValue(defaultValueOption);
    }
  };

  const handleChange = (event, value) => {
    onNewInput(value);
    // setValue(value);
  };

  // use effect cuando hay cambios en el valor por defecto
  useEffect(() => {
    // verficar si defualtvalue coincide
    const defaultValueOption = options.find(
      (option) => option.id === defaultValue
    );
    if (defaultValueOption) {
      setValue(defaultValueOption);
    }
  }, [defaultValue]);

  useEffect(() => {
    obtenerObjecion();
  }, []);

  return (
    <Autocomplete
      disabled={active}
      options={options}
      value={value}
      disableClearable
      getOptionLabel={(option) => option.label}
      onChange={handleChange}
      isOptionEqualToValue={(option, value) => option.id == value.id}
      renderInput={(params) => <TextField {...params} size="small" />}
    />
  );
};
