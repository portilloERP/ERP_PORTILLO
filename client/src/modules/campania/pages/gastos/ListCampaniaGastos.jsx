import React, { useContext, useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { useFilterGastos } from '../../hooks'
import { Button, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle, FormControl, IconButton, InputAdornment, InputLabel, MenuItem, OutlinedInput, Paper, Select, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, TextField } from '@mui/material'
import { CustomAlert, CustomCircularProgress, CustomDatePicker, CustomDatePickerMonth } from '../../../../components'
import { RowGastoCampania } from '../../components'
import { FiPlusCircle } from "react-icons/fi";
import { getGastosCampaniaById } from '../../helpers/gastos/getGastosCampaniaById'
import { AuthContext } from '../../../../auth'
import { combinarErrores } from '../../../../utils'
import { useAlertMUI } from '../../../../hooks'
import { IoIosAlert } from 'react-icons/io'

// funcion total gasto por semana
const calculateSpentByWeek = (dataWeek, data) => {
    const inicioSemana = dataWeek[0]
    const finSemana = dataWeek[1]
    let sumaTotal = 0
    data.forEach((element) => {
        const parserDate = new Date(element["fechaGasto"])
        const day = parserDate.getDate()
        if (inicioSemana <= day && finSemana >= day) {
            sumaTotal += element["gastoDolares"]
        }
    })
    return sumaTotal
}

export const ListCampaniaGastos = () => {
    // id de la campaña de query params
    const { idCampania } = useParams()
    // token
    const { authTokens } = useContext(AuthContext);
    // hook
    const { getSemanasPorMes, filtrarGastosPorSemana, showDataParser } = useFilterGastos();
    // modificador de fecha
    const [date, setDate] = useState(new Date())
    // informacion de semana seleccionada
    const [selectedSemana, setSelectedSemana] = useState(-1);
    // informacion de data
    // const [data, setData] = useState(dataJSON)
    const [data, setData] = useState([])
    // hook alert
    const {
        feedbackCreate,
        feedbackMessages,
        setFeedbackMessages,
        handleCloseFeedback,
        handleClickFeedback,
    } = useAlertMUI();

    // Retroalimentacion, estado de progreso.
    const [visibleProgress, setVisibleProgress] = useState(true);

    // navegar
    const navigate = useNavigate();
    const onNavigateBack = () => {
        navigate(-1);
    };

    // handle change semana
    const handleChangeSemana = ({ target }) => {
        const { value } = target
        setSelectedSemana(value)
    }
    // handle change mes
    const handleChangeDate = (newDate) => {
        setDate(newDate)
        setSelectedSemana(-1)
    }

    // traer gastos de campaña
    const traerGastoCampania = async () => {
        setVisibleProgress(true);
        try {
            const resultPeticion = await getGastosCampaniaById({
                campania: idCampania
            }, authTokens)
            console.log(resultPeticion)
            setVisibleProgress(false);
            setData(resultPeticion)
        } catch (error) {
            // ocultar el progress
            setVisibleProgress(false);
            const pilaError = combinarErrores(error);
            // mostramos feedback de error
            setFeedbackMessages({
                style_message: "error",
                feedback_description_error: pilaError,
            });
            handleClickFeedback();
        }
    }

    // actualización  de gasto
    const actualizarGastoCampania = () => {

    }

    // eliminacion de gasto
    const deleteGastoCampania = () => {

    }

    // agregar gasto de campañas
    const createGastoCampania = () => {

    }

    // informacion de semanas por mes
    const semanasFecha = getSemanasPorMes(date);
    // formato de fechas
    const fechaFormat = showDataParser(selectedSemana, semanasFecha, date)
    // data
    const filteredData = filtrarGastosPorSemana(data, semanasFecha, selectedSemana, date)

    useEffect(() => {
        traerGastoCampania()
    }, [])

    return (
        <>
            <main>
                <h2 className='text-center font-bold text-2xl'>Registro de gastos</h2>
                <section className='pb-4 p-2 mt-2 border-2'>
                    <p className='pb-2 font-semibold'>Datos de campaña</p>
                    <div className='grid grid-cols-2 gap-4 mb-4'>
                        <div className="flex">
                            <span className="font-medium mr-3">Nombre: </span>
                            <span>Campaña de cierto valor</span>
                        </div>

                        <div className='flex'>
                            <span className="font-medium mr-3">Código: </span>
                            <span>#MG-CW-0303</span>
                        </div>

                    </div>
                </section>
                <section className='mt-2 p-2 border-2'>
                    <p className='mb-2 font-semibold'>Acciones</p>
                    <div className='flex flex-row justify-between mb-4'>
                        <div className='flex flex-row gap-x-2'>
                            {/* DATE PICKER */}
                            <CustomDatePickerMonth value={date} onNewFecha={handleChangeDate} />
                            {/* SELECT SEMANA */}
                            <FormControl>
                                <Select
                                    size='small'
                                    value={selectedSemana}
                                    onChange={handleChangeSemana}
                                >
                                    <MenuItem key={-1} value={-1}>Todos</MenuItem>
                                    {
                                        semanasFecha.map((element, index) => (
                                            <MenuItem key={index} value={index}>{`Semana ${index + 1}`}</MenuItem>
                                        ))
                                    }
                                </Select>
                            </FormControl>
                        </div>
                        {/* BOTON PARA REGISTRAR GASTO */}
                        <DialogCreateGastoCampania handleConfirm={createGastoCampania} />
                    </div>
                    <p className='text-center mb-3'>{`${fechaFormat["inicio"]} - ${fechaFormat["fin"]}`}</p>
                    <div className='mb-4'>
                        <p className='pb-2 font-semibold'>Información de gastos</p>
                        <Paper sx={{ borderRadius: "0px" }}>
                            <TableContainer
                                sx={{ minWidth: 700 }}
                                arial-aria-labelledby="customized table"
                            >
                                <Table>
                                    <TableHead>
                                        <TableRow
                                            sx={{
                                                "& th": {
                                                    color: "rgba(200,200,200)",
                                                    backgroundColor: "#404040",
                                                },
                                            }}
                                        >
                                            {
                                                semanasFecha.map((element, index) => (
                                                    <TableCell align='center' key={index}
                                                        style={
                                                            {
                                                                backgroundColor: index === selectedSemana ? '#7de37f' : '#404040',
                                                                color: index === selectedSemana ? 'black' : '#C8C8C8'
                                                            }
                                                        }>
                                                        {`Semana ${index + 1}`}
                                                    </TableCell>
                                                ))
                                            }
                                        </TableRow>
                                    </TableHead>
                                    <TableBody>
                                        <TableRow>
                                            {
                                                semanasFecha.map((element, index) => (
                                                    <TableCell align='center' key={index} style={{ backgroundColor: index === selectedSemana ? '#7de37f' : 'white' }} >
                                                        {calculateSpentByWeek(element, filteredData)}
                                                    </TableCell>
                                                ))
                                            }
                                        </TableRow>
                                    </TableBody>
                                </Table>
                            </TableContainer>
                        </Paper>
                    </div>
                    <div className='pb-4'>
                        {/* PAPER TABLE */}
                        <Paper sx={{ borderRadius: "0px" }}>
                            <TableContainer
                                sx={{ minWidth: 700 }}
                                arial-aria-labelledby="customized table"
                            >
                                <Table>
                                    <TableHead>
                                        <TableRow
                                            sx={{
                                                "& th": {
                                                    color: "rgba(200,200,200)",
                                                    backgroundColor: "#404040",
                                                },
                                            }}
                                        >
                                            <TableCell>Fecha</TableCell>
                                            <TableCell>Mes</TableCell>
                                            <TableCell>Dia</TableCell>
                                            <TableCell>Gasto</TableCell>
                                            <TableCell>Acciones</TableCell>
                                        </TableRow>
                                    </TableHead>
                                    <TableBody>
                                        {
                                            filteredData.map((element) => (
                                                <RowGastoCampania key={element["id"]} element={element} />
                                            ))
                                        }
                                    </TableBody>
                                </Table>
                            </TableContainer>
                        </Paper>
                    </div>
                </section>
            </main>
            {/* COMPONENTE ALERTA */}
            <CustomAlert
                feedbackCreate={feedbackCreate}
                feedbackMessages={feedbackMessages}
                handleCloseFeedback={handleCloseFeedback}
            />

            {/* CIRCULAR PROGRESS */}
            {visibleProgress && <CustomCircularProgress />}

            {/* DIALOG CREATE */}

        </>
    )
}

const DialogCreateGastoCampania = ({ handleConfirm }) => {
    const [open, setOpen] = useState(false)
    const [alertDolar, setAlertDolar] = useState(false)
    const [alertSol, setAlertSol] = useState(false)
    const [alertFecha, setAlertFecha] = useState(false)
    const [tipoCambio, setTipoCambio] = useState(3.66)
    const [presupuesto, setPresupuesto] = useState({
        presupuestoSoles: 0,
        presupuestoDolares: 0,
        fechaPresupuesto: "",
    });

    const {
        presupuestoSoles,
        presupuestoDolares,
        fechaPresupuesto,
    } = presupuesto;

    const handleClickOpen = () => {
        setOpen(true);
    };

    const handleClose = () => {
        setOpen(false);
    };

    const handleInputChange = (event) => {
        const { name, value } = event.target;
        let newValue = value;

        if (isNaN(value) || value < 0 || value === "") {
            setAlertSol(true);
            setAlertDolar(true);
        } else {
            setAlertSol(false);
            setAlertDolar(false);
        }
        if (name === "presupuestoSoles") {
            newValue = parseFloat(value) / tipoCambio;
        } else if (name === "presupuestoDolares") {
            newValue = parseFloat(value) * tipoCambio;
        }

        setPresupuesto({
            ...presupuesto,
            [name]: value,
            // Actualiza el otro campo en tiempo real
            ...(name === "presupuestoSoles"
                ? { presupuestoDolares: newValue }
                : { presupuestoSoles: newValue }),
        });
    };

    const handleFecha = (newDate) => {
        if (newDate != "") {
            setAlertFecha(false);
        }
        setPresupuesto({
            ...presupuesto,
            fechaPresupuesto: newDate,
        });
    };

    const validateData = () =>
        presupuestoSoles > 0 && presupuestoDolares > 0 && fechaPresupuesto !== "";

    const handleFormSubmit = () => {
        if (validateData()) {
            console.log("creado correctamente");
            console.log(presupuesto);
            handleConfirm();
            handleClose();
        } else {
            setAlertSol(presupuestoSoles <= 0);
            setAlertDolar(presupuestoDolares <= 0);
            setAlertFecha(fechaPresupuesto === "");
        }
    };

    // consultar el tipo de cambio
    const consultarTipoCambio = async () => {
        const resultPeticion = await consultarTipoCambio()
        console.log(resultPeticion)
    }

    useEffect(() => {
        consultarTipoCambio()
    }, [])

    return (
        <div>
            <Button startIcon={<FiPlusCircle />} color='primary' variant='contained' onClick={handleClickOpen}>
                Agregar
            </Button>
            <Dialog open={open} onClose={handleClose}>
                <DialogTitle
                    className="flex justify-between items-center"
                    style={{ background: "#9E154A", color: "#fff" }}
                >
                    <span>Registrar Presupuesto </span>
                    <span style={{ fontSize: 13, opacity: 0.7 }}>
                        (Tipo cambio hoy: {tipoCambio})
                    </span>
                </DialogTitle>
                <DialogContent>
                    <form>
                        <FormControl fullWidth variant="outlined" margin="normal">
                            <InputLabel htmlFor="presupuestoSoles">
                                Presupuesto en Soles
                            </InputLabel>
                            <OutlinedInput
                                id="presupuestoSoles"
                                name="presupuestoSoles"
                                type="number" // Cambia esto según el tipo correcto de tu dato
                                value={presupuestoSoles}
                                onChange={handleInputChange}
                                endAdornment={
                                    <InputAdornment position="end">
                                        {alertSol && (
                                            <IoIosAlert
                                                style={{ color: "#d32f2f", fontSize: "2rem" }}
                                            />
                                        )}
                                    </InputAdornment>
                                }
                                label="Presupuesto en Soles"
                            />
                        </FormControl>

                        <FormControl fullWidth variant="outlined" margin="normal">
                            <InputLabel htmlFor="presupuestoDolares">
                                Presupuesto en Dólares
                            </InputLabel>
                            <OutlinedInput
                                id="presupuestoDolares"
                                name="presupuestoDolares"
                                type="number" // Cambia esto según el tipo correcto de tu dato
                                value={presupuestoDolares}
                                onChange={handleInputChange}
                                endAdornment={
                                    <InputAdornment position="end">
                                        {alertDolar && (
                                            <IoIosAlert
                                                style={{ color: "#d32f2f", fontSize: "2rem" }}
                                            />
                                        )}
                                    </InputAdornment>
                                }
                                label="Presupuesto en Dólares"
                            />
                        </FormControl>

                        <label className="flex flex-col gap-y-1">
                            <span className=" block text-sm">Fecha de registro</span>
                            <div className="flex flex-row items-center">
                                <CustomDatePicker
                                    onNewFecha={handleFecha}
                                    defaultValue={fechaPresupuesto}
                                />
                                {alertFecha && (
                                    <IoIosAlert style={{ color: "#d32f2f", fontSize: "2rem" }} />
                                )}
                            </div>
                        </label>
                    </form>
                </DialogContent>
                <DialogActions>
                    <Button variant="contained" onClick={handleClose} color="error">
                        Cancelar
                    </Button>
                    <Button variant="contained" onClick={handleFormSubmit} color="primary">
                        Guardar
                    </Button>
                </DialogActions>
            </Dialog>
        </div>
    );

}

const DialogUpdateGastoCampania = () => {

}

const DialogDeleteGastoCampania = () => {

}
