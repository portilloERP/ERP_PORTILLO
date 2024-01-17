import React, { useState, useContext } from "react";
import { useNavigate } from "react-router-dom";
import { TextField } from "@mui/material";
import { createProyecto } from "../helpers";
import { useAlertMUI } from "../../../hooks";
import { CustomAlert, CustomCircularProgress } from "../../../components";
import { AuthContext } from "../../../auth";
import { combinarErrores } from "../../../utils";

export const CreateProyecto = () => {
  const { authTokens, currentUser } = useContext(AuthContext);
  const [project, setProject] = useState({
    nombre: "",
    ubicacion: "",
    descripcion: "",
    estado: "A",
  });

  const { nombre, ubicacion, descripcion, estado } = project;

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
    setProject({
      ...project,
      [name]: value,
    });
  };

  const navigate = useNavigate();
  const onNavigateBack = () => {
    navigate(-1);
  };

  const validateProject = (nombre, ubicacion, descripcion) => {
    const errors = [];

    if (!nombre) {
      errors.push("- El nombre del proyecto es obligatorio.");
    }
    if (!ubicacion) {
      errors.push("- La ubicacion es obligatoria.");
    }
    if (!descripcion) {
      errors.push("- La descripcion es obligatoria.");
    }
    return errors.join("\n");
  };

  const crearProyecto = async () => {
    const validationMessage = validateProject(nombre, ubicacion, descripcion);

    if (validationMessage) {
      // Si hay campos faltantes, mostrar una alerta con los mensajes de error concatenados
      setFeedbackMessages({
        style_message: "warning",
        feedback_description_error: validationMessage,
      });
      handleClickFeedback();
    } else {
      setVisibleProgress(true);
      try {
        const formatData = {
          ...project,
          usuarioCreador: currentUser["user_id"],
          usuarioActualizador: currentUser["user_id"],
        };
        const result = await createProyecto(formatData, authTokens["access"]);
        setVisibleProgress(false);
        onNavigateBack();
      } catch (error) {
        setVisibleProgress(false);
        const pilaError = combinarErrores(error);
        setFeedbackMessages({
          style_message: "error",
          feedback_description_error: pilaError,
        });
        handleClickFeedback();
      }
    }
  };

  return (
    <>
      <div className="relative p-5">
        <h1 className="text-lg font-bold">Crear Proyecto</h1>
        <hr className="my-4"></hr>
        <form
          method="post"
          className="min-w-[242px] flex flex-col gap-y-6 gap-x-8"
        >
          <div className="flex flex-row gap-y-6 gap-x-8">
            <div className="w-6/12 flex flex-col gap-y-5">
              <label className="flex flex-col gap-y-1 ">
                <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                  Nombre del proyecto
                </span>
                <input
                  type="text"
                  name="nombre"
                  className="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1"
                  placeholder="Nombre del proyecto"
                  autoComplete="off"
                  value={nombre}
                  onChange={handledForm}
                />
              </label>

              <label htmlFor="ubicacion" className="flex flex-col gap-y-1">
                <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                  Ubicacion
                </span>
                <input
                  type="text"
                  name="ubicacion"
                  id="ubicacion"
                  placeholder="Ubicacion"
                  value={ubicacion}
                  onChange={handledForm}
                  className="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1"
                />
              </label>
            </div>
          </div>
          <div>
            <label htmlFor="descripcion" className=" flex flex-col gap-y-1">
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
          onClick={crearProyecto}
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
