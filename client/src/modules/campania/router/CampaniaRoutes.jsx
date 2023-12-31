import React from "react";
import { Route, Routes } from "react-router-dom";
import {
  CreateCampania,
  DetailCampania,
  ListCampanias,
  UpdateCampania,
} from "../pages";

export const CampaniaRoutes = () => {
  return (
    <Routes>
      <Route path="" element={<ListCampanias />} />
      <Route path="create/" element={<CreateCampania />} />
      <Route path="detail/:idCampania" element={<DetailCampania />} />
      <Route path="update/:idCampania" element={<UpdateCampania />} />
    </Routes>
  );
};
