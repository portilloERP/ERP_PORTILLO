import axios from "axios";
const DOMAIN = import.meta.env.VITE_BACKEND_URL;

export const getProyectoCampania = async (query) => {
  const URL = `${DOMAIN}/api/reporteProyectoCampania/${query}`;
  console.log(URL)
  const { data } = await axios.get(URL);
  return data;
};
