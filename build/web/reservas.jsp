<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelo.Alojamiento"%>
<%@ page import="modelo.Reserva"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var today = new Date().toISOString().split('T')[0];
            var fechaInicio = document.getElementById('fecha_inicio');
            var fechaFin = document.getElementById('fecha_fin');

            fechaInicio.setAttribute('min', today);

            var fechasOcupadas = [
                <c:forEach var="reserva" items="${reservas}">
                    {
                        f_i: '${reserva.f_i}',
                        f_f: '${reserva.f_f}'
                    }<c:if test="${!status.last}">,</c:if>
                </c:forEach>
            ];

            function addDays(date, days) {
                var result = new Date(date);
                result.setDate(result.getDate() + days);
                return result.toISOString().split('T')[0];
            }

            function disableOccupiedDates(input) {
                var dates = fechasOcupadas.map(function (reserva) {
                    var startDate = new Date(reserva.f_i);
                    var endDate = new Date(reserva.f_f);
                    var dateArray = [];
                    var currentDate = startDate;

                    while (currentDate <= endDate) {
                        dateArray.push(new Date(currentDate));
                        currentDate.setDate(currentDate.getDate() + 1);
                    }

                    return dateArray;
                }).flat();

                input.addEventListener('click', function () {
                    var dateList = dates.map(function (date) {
                        return date.toISOString().split('T')[0];
                    });

                    // Limpiar días anteriores
                    input.setAttribute('data-disabled-dates', JSON.stringify(dateList));
                });

                input.addEventListener('input', function () {
                    var inputDate = new Date(this.value);
                    var isDisabled = dates.some(function (date) {
                        return inputDate.getTime() === date.getTime();
                    });

                    if (isDisabled) {
                        this.value = ''; // Clear the value if the date is disabled
                        alert('Esta fecha está ocupada. Por favor, elige otra fecha.');
                    }
                });
            }

            disableOccupiedDates(fechaInicio);
            disableOccupiedDates(fechaFin);

            fechaInicio.addEventListener('change', function () {
                var minFechaFin = addDays(new Date(this.value), 7);
                fechaFin.value = ''; 
                fechaFin.setAttribute('min', minFechaFin); 
                calcularTotal(); 
            });

            fechaFin.addEventListener('change', calcularTotal);

            const precioPorDia = ${em.getP_min()};

            function esTemporadaAlta(fecha) {
                const dia = fecha.getDate();
                const mes = fecha.getMonth() + 1; // Enero es 0

                if ((mes === 12 && dia >= 15) || (mes === 1 && dia <= 15) ||
                        (mes === 6 && dia >= 15) || (mes === 7 && dia <= 15)) {
                    return true;
                }

                const semanaSanta = ['2024-04-01', '2024-04-02', '2024-04-03', '2024-04-04', '2024-04-05']; // Ajustar fechas
                const puentesFestivos = ['2024-05-01', '2024-10-12', '2024-11-01']; // Ajustar fechas

                const fechaStr = fecha.toISOString().split('T')[0];
                if (semanaSanta.includes(fechaStr) || puentesFestivos.includes(fechaStr)) {
                    return true;
                }

                return false;
            }

            function calcularTotal() {
                const fechaInicio = new Date(document.getElementById('fecha_inicio').value);
                const fechaFin = new Date(document.getElementById('fecha_fin').value);

                if (isNaN(fechaInicio) || isNaN(fechaFin) || fechaInicio > fechaFin) {
                    document.getElementById('total').value = '';
                    return;
                }

                let total = 0;
                let fechaActual = new Date(fechaInicio);

                while (fechaActual <= fechaFin) {
                    let precioDiario = precioPorDia;

                    if (esTemporadaAlta(fechaActual)) {
                        precioDiario *= 1.30;
                    } else {
                        precioDiario *= 1.10;
                    }

                    total += precioDiario;
                    fechaActual.setDate(fechaActual.getDate() + 1);
                }

                document.getElementById('total').value = total.toFixed(2);
            }

            function validarMascotas() {
                const permiteMascotas = "${em.getMascotas()}"; 
                const seleccionMascotas = document.getElementById('mascotas').value;
                if (permiteMascotas === 'No' && seleccionMascotas === 'Si') {
                    alert('No se permiten mascotas en esta propiedad.');
                    document.getElementById('mascotas').value = 'No'; 
                }
            }
        });
    </script>
</head>
<body>
    <h1>Reserva</h1>
    <form action="Controlador?menu=reservar" method="POST">
        <div>
            <label class="form-label">Direccion:</label>
            <input type="text" name="direccion" id="direccion" class="form-control" value="${em.getDireccion()}" readonly="">
        </div>
        <div>
            <label class="form-label">Usuario:</label>
            <input type="number" name="usuario" id="usuario" class="form-control" value="${usu}" readonly="">
        </div>
        <div>
            <label for="fecha_inicio">Desde:</label>
            <input type="date" id="fecha_inicio" name="fecha_inicio" onchange="calcularTotal()">

            <label for="fecha_fin">Hasta:</label>
            <input type="date" id="fecha_fin" name="fecha_fin" onchange="calcularTotal()">
        </div>
        <div>
            <label class="form-label">Numero Personas:</label>
            <input type="number" name="personas" id="personas" class="form-control" max="${em.getN_personas()}" required="">
        </div>
        <div>
            <label class="form-label">Mascotas</label>
            <select name="mascotas" id="mascotas" class="form-select" onchange="validarMascotas()">
                <option value="No">No</option>
                <option value="Si">Si</option>
            </select>
        </div>
        <div>
            <label class="form-label">Total</label>
            <input type="number" name="total" id="total" class="form-control" readonly="">
        </div>
        <button type="submit">Reservar</button>
    </form>
</body>
</html>