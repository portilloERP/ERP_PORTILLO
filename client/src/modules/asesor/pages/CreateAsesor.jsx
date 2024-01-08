import React, { useState } from "react";
import {
  CustomAlert,
  CustomCircularProgress,
  FilterEstadoRegistro,
  FilterUsuario,
} from "../../../components";
import { useNavigate } from "react-router-dom";
import { useAlertMUI } from "../../../hooks";
import { createAsesor } from "../helpers";
import { combinarErrores } from "../../../utils";

export const CreateAsesor = () => {
  const [asesor, setAsesor] = useState({
    user: 0,
    maximoLeads: 0,
    estado: "A",
    codigo: "",
  });

  const { user, maximoLeads, estado, codigo } = asesor;

  const handledForm = (event) => {
    const { name, value } = event.target;
    setAsesor({
      ...asesor,
      [name]: value,
    });
  };

  const {
    feedbackCreate,
    feedbackMessages,
    setFeedbackMessages,
    handleCloseFeedback,
    handleClickFeedback,
  } = useAlertMUI();

  const [visibleProgress, setVisibleProgress] = useState(false);

  const navigate = useNavigate();
  const onNavigateBack = () => {
    navigate(-1);
  };

  const onAdduser = ({ id }) => {
    setAsesor({
      ...asesor,
      user: id,
    });
  };

  const onAddEstado = ({ id }) => {
    setAsesor({
      ...asesor,
      estado: id,
    });
  };

  const transformarCadena = (texto) => {
    // Paso 1: Eliminar espacios en blanco a la izquierda y derecha
    const paso1 = texto.trim();
    // Paso 2: Transformar la cadena a minúsculas
    const paso2 = paso1.toUpperCase();
    // Paso 3: Reemplazar los espacios en blanco con guiones bajos
    const paso3 = paso2.replace(/\s+/g, "_");
    return paso3;
  };

  const formatText = (texto) => {
    const lengthText = texto.trim().length;
    return lengthText > 0 ? true : false;
  };

  const validarDatosAsesor = (user, maximoLeads, codigo) => {
    var messages_error = "";
    if (!formatText(codigo)) {
      messages_error += "No se proporciono un codigo de asesor\n";
    }
    if (user === 0) {
      messages_error += "No se proporciono un usuario\n";
    }
    if (maximoLeads === 0) {
      messages_error +=
        "El asesor debe al menos manejar un lead o ingresa -1 para que no tenga limite\n";
    }
    return messages_error;
  };

  const crearAsesor = async () => {
    const validate = validarDatosAsesor(user, maximoLeads, codigo);
    if (validate.length === 0) {
      setVisibleProgress(true);
      const formatData = {
        ...asesor,
        codigo: transformarCadena(asesor.codigo),
      };
      try {
        const result = await createAsesor(formatData);
        // quitamos progress bar
        setVisibleProgress(false);
        // navegamos atras
        onNavigateBack();
      } catch (error) {
        setVisibleProgress(false);
        // manejador de errores
        const pilaError = combinarErrores(error);
        // mostramos feedback de error
        setFeedbackMessages({
          style_message: "error",
          feedback_description_error: pilaError,
        });
        handleClickFeedback();
      }
    } else {
      // mostramos feedback
      setFeedbackMessages({
        style_message: "warning",
        feedback_description_error: validate,
      });
      handleClickFeedback();
    }
  };

  return (
    <>
      <div className="relative border-2 rounded-md border-inherit p-5">
        <h1 className="text-lg font-bold">Crear asesor</h1>
        <hr className="my-4"></hr>
        <form
          method="post"
          className="min-w-[242px] flex flex-col gap-y-6 gap-x-8"
        >
          <div className="flex flex-row gap-y-6 gap-x-8">
            <div className="w-6/12 flex flex-col gap-y-5">
              <label className="block flex flex-col gap-y-1 ">
                <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                  Usuario
                </span>
                <FilterUsuario defaultValue={null} onNewInput={onAdduser} />
              </label>
              <label className="block flex flex-col gap-y-1 ">
                <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                  Numero de leads
                </span>
                <input
                  type="number"
                  name="maximoLeads"
                  className="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1"
                  value={maximoLeads}
                  onChange={handledForm}
                />
              </label>
            </div>
            <div className="w-6/12 flex flex-col gap-y-5">
              <label className="block flex flex-col gap-y-1 ">
                <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                  Codigo asesor
                </span>
                <input
                  type="text"
                  name="codigo"
                  className="mt-1 px-3 py-2 bg-white border shadow-sm border-slate-300 placeholder-slate-400 focus:outline-none focus:border-sky-500 focus:ring-sky-500 block w-full rounded-md sm:text-sm focus:ring-1"
                  value={codigo}
                  onChange={handledForm}
                />
              </label>
              <label className="block flex flex-col gap-y-1 ">
                <span className="after:content-['*'] after:ml-0.5 after:text-yellow-500 block text-sm font-medium">
                  Estado asesor
                </span>
                <FilterEstadoRegistro
                  defaultValue={estado}
                  onNewInput={onAddEstado}
                />
              </label>
            </div>
          </div>
        </form>
      </div>
      <div className="flex justify-center mt-4 mb-4">
        <button
          className="bg-green-500 hover:bg-green-600 text-white py-2 px-4 rounded mr-2"
          onClick={crearAsesor}
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
