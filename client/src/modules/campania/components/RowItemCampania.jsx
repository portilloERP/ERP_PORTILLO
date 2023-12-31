import { TableCell, TableRow } from "@mui/material";
import React from "react";
import { Link, useNavigate } from "react-router-dom";
import { CustomMoreVerticalActions } from "../../../components";

export const RowItemCampania = ({ item, onShowDeleteDialog }) => {
  const {
    id,
    nombre,
    fecha_estimada,
    fecha_cierre,
    coste_estimado,
    proyecto,
    subCategoria,
    categoria,
  } = item;

  const navigate = useNavigate();

  const onDeleteItemSelected = () => {
    onShowDeleteDialog(item);
  };

  const onEditItemSelected = () => {
    navigate(`/campania/update/${id}`);
  };

  return (
    <TableRow sx={{ "&:last-child td, &:last-child th": { border: 0 } }}>
      <TableCell>
        <CustomMoreVerticalActions
          onDelete={onDeleteItemSelected}
          onEdit={onEditItemSelected}
        />
      </TableCell>
      <TableCell>
        <Link
          to={`/campania/detail/${id}`}
          style={{
            textDecoration: "none",
            color: "black",
            transition: "color 0.3s", // Add a smooth transition effect
          }}
          onMouseEnter={(e) => {
            e.target.style.color = "blue";
          }}
          onMouseLeave={(e) => {
            e.target.style.color = "black";
          }}
        >
          {nombre}
        </Link>
      </TableCell>
      <TableCell>{fecha_estimada}</TableCell>
      <TableCell>{fecha_cierre}</TableCell>
      <TableCell>s/. {coste_estimado}</TableCell>
      <TableCell>{proyecto.nombre}</TableCell>
      <TableCell>{subCategoria.nombre}</TableCell>
      <TableCell>{categoria.nombre}</TableCell>
    </TableRow>
  );
};
