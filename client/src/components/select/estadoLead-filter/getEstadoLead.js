import axios from "axios";

export const getEstadoLead = async (token) => {
  const DOMAIN = import.meta.env.VITE_BACKEND_URL;
  const URL = `${DOMAIN}/api/estadoLead/`;
  const config = {
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${token}`,
    },
  };
  const { data } = await axios.get(URL, config);
  return data;
};
