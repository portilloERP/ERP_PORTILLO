import React, { useState } from "react";
import jwt_decode from "jwt-decode";
import { AuthContext } from "./AuthContext";
import { useNavigate } from "react-router-dom";

export const AuthProvider = ({ children }) => {
  // hook navegacion
  const navigate = useNavigate();

  // estado del token
  const [authTokens, setauthTokens] = useState(() =>
    localStorage.getItem("authTokens")
      ? JSON.parse(localStorage.getItem("authTokens"))
      : null
  );

  // estado de la informacion del usuario
  const [currentUser, setCurrentUser] = useState(() =>
    localStorage.getItem("authTokens")
      ? jwt_decode(localStorage.getItem("authTokens"))
      : null
  );

  // estado de la informacion de los permisos
  const [permissions, setPermissions] = useState(() =>
    localStorage.getItem("permissions")
      ? JSON.parse(localStorage.getItem("permissions"))
      : null
  );

  // funcion para logearse
  const loginUser = async (username, password, setVisibleProgress) => {
    const permissions_user = [];
    const DOMAIN = process.env.VITE_BACKEND_URL;
    const ENDPOINT = `${DOMAIN}/api/token/`;
    const response = await fetch(ENDPOINT, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ username: username, password: password }),
    });

    const data = await response.json();

    if (response.status == 200) {
      // decodificamos la data del payload
      const payloadUser = jwt_decode(data.access);
      const { user } = payloadUser;
      // obtenemos el grupo
      const { groups } = user;
      // obtenemos los modulos con permisos
      const { modulos } = groups;

      modulos.forEach((item) => {
        if (item["can_view"][0]) {
          permissions_user.push({
            title: item["nombre"],
            url: item["url"],
            permissions: {
              can_add: item["can_add"][0],
              can_change: item["can_change"][0],
              can_delete: item["can_delete"][0],
              can_view: item["can_view"][0],
            },
          });
        }
      });
      // seteamos los estados
      setauthTokens(data);
      setCurrentUser(payloadUser);
      setPermissions(permissions_user);

      localStorage.setItem("authTokens", JSON.stringify(data));
      localStorage.setItem("permissions", JSON.stringify(permissions_user));
      setVisibleProgress(false);
      navigate(`/home`);
    }
    if (response.status == 401) {
      setVisibleProgress(false);
      return data;
    }
  };

  const logoutUser = () => {
    setauthTokens(null);
    setCurrentUser(null);
    setPermissions(null);
    localStorage.removeItem("authTokens");
    localStorage.removeItem("permissions");
    navigate("");
  };

  const contextData = {
    currentUser,
    permissions,
    authTokens,
    loginUser,
    logoutUser,
  };

  return (
    <AuthContext.Provider value={contextData}>{children}</AuthContext.Provider>
  );
};
