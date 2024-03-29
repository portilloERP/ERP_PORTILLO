import axios from "axios";

export const updateProyecto = async (idProyecto, body, authToken) => {
  const DOMAIN = import.meta.env.VITE_BACKEND_URL;
  const URL = `${DOMAIN}/api/proyecto/${idProyecto}`;
  console.log(URL);
  const { data } = await axios.put(
    URL, 
    {...body,},
    {
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${authToken}`,
      },
    }
  );
  return data;
};
