import axios from "axios";

export const getLeads = async () => {
  const DOMAIN = import.meta.env.VITE_BACKEND_URL;
  const URL = `${DOMAIN}/api/lead/`;

  const { data } = await axios.get(URL);

  return data;
};
