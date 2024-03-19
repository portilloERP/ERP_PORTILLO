import axios from "axios";

export const getEstadoSeparacion = async () => {
  const DOMAIN = process.env.VITE_BACKEND_URL;
  const URL = `${DOMAIN}/api/estadoSeparacionLead/`;
  const { data } = await axios.get(URL);
  return data;
};
