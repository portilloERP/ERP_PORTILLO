import React, { useContext, useState } from "react";
import { useNavigate } from "react-router-dom";
import { MenuItem, Select, TextField } from "@mui/material";
import jwtDecode from "jwt-decode";
import { createCampania } from "../helpers";
import { useAlertMUI } from "../../../hooks";
import {
  CustomAlert,
  FilterProyectos,
  FilterSubcategoria,
  CustomCircularProgress,
} from "../../../components";
import { AuthContext } from "../../../auth";

export const CreateCampania = () => {
  const { authTokens } = useContext(AuthContext);
  /* obtenemos los datos de la sesión para enviarlo. */
  const [currentUser, setCurrentUser] = useState(() =>
    jwtDecode(authTokens.refresh)
  );

  const [campaign, setCampaign] = useState({
    nombre: "",
    fecha_estimada: "",
    fecha_cierre: "",
    coste_estimado: "",
    coste_real: "",
    descripcion: "",
    estado: "A",
    user: currentUser.user_id,
    proyecto: 0,
    subCategoria: 0,
  });

  const {
    nombre,
    fecha_estimada,
    fecha_cierre,
    coste_estimado,
    coste_real,
    descripcion,
    estado,
    user,
    proyecto,
    subCategoria,
  } = campaign;

  const {
    feedbackCreate,
    feedbackMessages,
    setFeedbackMessages,
    handleCloseFeedback,
    handleClickFeedback,
  } = useAlertMUI();

  const [visibleProgress, setVisibleProgress] = useState(false);

  const handledForm = (event) => {
    const { name, value } = event.target;
    setCampaign({
      ...campaign,
      [name]: value,
    });
  };

  const navigate = useNavigate();
  const onNavigateBack = () => {
    navigate(-1);
  };

  const onAddCategory = (category) => {
    setCampaign({
      ...campaign,
      subCategoria: category.id,
    });
  };

  const onAddProject = (project) => {
    setCampaign({
      ...campaign,
      proyecto: project.id,
    });
  };

  const validateCampaign = (
    nombre,
    fecha_estimada,
    fecha_cierre,
    coste_estimado,
    coste_real,
    descripcion,
    estado,
    user,
    proyecto,
    subCategoria
  ) => {
    const errors = [];

    if (!nombre) {
      errors.push("- El nombre de la campaña es obligatorio.");
    }
    if (!fecha_estimada) {
      errors.push("- La fecha estimada es obligatoria.");
    }
    if (!fecha_cierre) {
      errors.push("- La fecha de cierre es obligatoria.");
    }
    if (!coste_estimado) {
      errors.push("- El costo estimado es obligatorio.");
    }
    if (!coste_real) {
      errors.push("- El costo real es obligatorio.");
    }
    if (!descripcion) {
      errors.push("- La descripción es obligatoria.");
    }
    if (!estado) {
      errors.push("- El estado es obligatorio.");
    }
    if (!user) {
      errors.push("- El usuario es obligatorio.");
    }
    if (!proyecto) {
      errors.push("- El proyecto es obligatorio.");
    }
    if (!subCategoria) {
      errors.push("- La subcategoría es obligatoria.");
    }

    return errors.join("\n");
  };

  const crearCampania = async () => {
    const validationMessage = validateCampaign(
      nombre,
      fecha_estimada,
      fecha_cierre,
      coste_estimado,
      coste_real,
      descripcion,
      estado,
      user,
      proyecto,
      subCategoria
    );

    if (validationMessage) {
      // Si hay campos faltantes, mostrar una alerta con los mensajes de error concatenados
      setFeedbackMessages({
        style_message: "warning",
        feedback_description_error: validationMessage,
      });
      handleClickFeedback();
    } else {
      setVisibleProgress(true);
      const result = await createCampania(campaign);
      setVisibleProgress(false);
      onNavigateBack();
    }
  };

  return (
    <>
      <div className="relative border-2 rounded-md border-inherit p-5">
        <h1 className="text-lg font-bold">Campañas de marketing</h1>
        <hr className="my-4"></hr>
        <form
          method="post"
          className="min-w-[242px] flex flex-col gap-y-6 gap-x-8"
        >
          <div className="flex flex-row gap-y-6 gap-x-8">
            <div className="w-6/12 flex flex-col gap-y-5">
              <label className="block flex flex-col gap-y-1 ">
                <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                  Nombre de la campaña
                </span>
                <input
                  type="text"
                  name="nombre"
                  className="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1"
                  placeholder="Nombre de la campaña"
                  value={nombre}
                  onChange={handledForm}
                />
              </label>

              <label className="block flex flex-col gap-y-1">
                <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                  Costo estimado
                </span>
                <input
                  type="number"
                  name="coste_estimado"
                  className="mt-1 px-3 py-2  bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1"
                  placeholder="Costo estimado"
                  value={coste_estimado}
                  onChange={handledForm}
                />
              </label>

              <label
                htmlFor="fecha_estimada"
                className="block flex flex-col gap-y-1"
              >
                <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                  Fecha estimado
                </span>
                <input
                  type="date"
                  name="fecha_estimada"
                  id="fecha_estimada"
                  value={fecha_estimada}
                  onChange={handledForm}
                  className="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1"
                />
              </label>

              <label className="block flex flex-col gap-y-1">
                <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                  Proyecto
                </span>
                <FilterProyectos
                  defaultValue={null}
                  onNewInput={onAddProject}
                />
              </label>
            </div>

            <div className="w-6/12 flex flex-col gap-y-5">
              <label className="block flex flex-col gap-y-1">
                <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                  Estado inicial
                </span>
                <Select
                  name="estado"
                  value={estado}
                  onChange={handledForm}
                  style={{
                    height: "2.64rem", // Ajusta el valor según tus necesidades
                    paddingTop: "1rem", // Ajusta el valor según tus necesidades
                    paddingBottom: "1rem",
                  }}
                  className="bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1"
                >
                  <MenuItem value="A">Activo</MenuItem>
                  <MenuItem value="I">Inactivo</MenuItem>
                  <MenuItem value="E">Eliminado</MenuItem>
                </Select>
              </label>

              <label className="block flex flex-col gap-y-1">
                <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                  Costo real
                </span>
                <input
                  type="number"
                  name="coste_real"
                  className="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1"
                  placeholder="Costo real"
                  value={coste_real}
                  onChange={handledForm}
                />
              </label>

              <label className="block flex flex-col gap-y-1">
                <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                  Fecha cierre
                </span>
                <input
                  type="date"
                  name="fecha_cierre"
                  id="fecha_cierre"
                  value={fecha_cierre}
                  onChange={handledForm}
                  className="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1"
                />
              </label>

              <label className="block flex flex-col gap-y-1">
                <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                  Subcategoria
                </span>
                <FilterSubcategoria
                  defaultValue={null}
                  onNewInput={onAddCategory}
                />
              </label>
            </div>
          </div>
          <div>
            <label
              htmlFor="descripcion"
              className="block flex flex-col gap-y-1"
            >
              <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                Descripción
              </span>
              <TextField
                name="descripcion"
                onChange={handledForm}
                id="descripcion"
                value={descripcion}
                multiline
                rows={2}
                inputProps={{
                  style: {
                    width: "100%",
                    overflowWrap: "break-word",
                  },
                }}
              />
            </label>
          </div>
        </form>
      </div>
      <div className="flex justify-center mt-4 mb-4">
        <button
          className="bg-green-500 hover:bg-green-600 text-white py-2 px-4 rounded mr-2"
          onClick={crearCampania}
        >
          Guardar
        </button>
        <button
          className="bg-gray-500 hover:bg-gray-600 text-white py-2 px-4 rounded"
          onClick={onNavigateBack}
        >
          Cancelar
        </button>
      </div>
      {/* COMPONENTE ALERTA */}
      <CustomAlert
        feedbackCreate={feedbackCreate}
        feedbackMessages={feedbackMessages}
        handleCloseFeedback={handleCloseFeedback}
      />
      {/* CIRCULAR PROGRESS */}
      {visibleProgress && <CustomCircularProgress />}
    </>
  );
};
