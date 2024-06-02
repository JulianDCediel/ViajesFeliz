<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelo.Alojamiento"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="modelo.Reserva"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 80%;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }
            h1 {
                color: #333;
                border-bottom: 2px solid #4CAF50;
                padding-bottom: 10px;
                text-align: center;
            }
            .reservation {
                border: 1px solid #ddd;
                padding: 15px;
                border-radius: 5px;
                margin-bottom: 20px;
                background-color: #fafafa;
            }
            .reservation p {
                margin: 10px 0;
                color: #555;
            }
            .btn-warning {
                display: inline-block;
                padding: 10px 20px;
                font-size: 16px;
                color: #fff;
                background-color: #f0ad4e;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }
            .btn-warning:hover {
                background-color: #ec971f;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>TUS RESERVAS!</h1>
            <c:forEach var="em" items="${reservas}">
                <div class="reservation">
                    <p><strong>Numero Reserva:</strong> ${em.getIdRes()}</p>
                    <p><strong>Estado Reserva:</strong> ${em.getEstado()}</p>
                    <p><strong>Direccion:</strong> ${em.getDireccion()}</p>
                    <p><strong>Cedula usuario:</strong> ${em.getCed()}</p>
                    <p><strong>Fecha Inicio:</strong> ${em.getF_i()}</p>
                    <p><strong>Fecha Fin:</strong> ${em.getF_f()}</p>
                    <p><strong>Numero Personas:</strong> ${em.getN_per()}</p>
                    <p><strong>Mascotas:</strong> ${em.getMascotas()}</p>
                    <p><strong>Total:</strong> ${em.getTotal()}</p>
                    <p><strong>Cantidad Pagada:</strong> ${em.getCantP()}</p>
                    <c:if test="${em.getCantP() < em.getTotal()}">
                        <form action="" method="post">
                            <a class="btn btn-warning" href="Controlador?menu=reservarFin&id=${em.getIdRes()}">PAGAR</a>
                        </form>
                    </c:if>
                    <c:if test="${em.getEstado() == 'Cancelado'}">
                        <p class="btn btn-warning"><strong>RESERVA CANCELADA</strong></p>
                    </c:if>
                    <c:set var="fechaFin" value="${em.getF_f()}"/>
                    <%
                        // Obtener la fecha actual
                        Date fechaActual = new Date();

                        // Obtener la fecha de fin de la reserva
                        Date fechaFin = (Date) pageContext.getAttribute("fechaFin");

                        // Comparar las fechas
                        if (fechaActual.after(fechaFin)) {
                    %>
                    <form action="Controlador?menu=calificar&id=${em.getIdRes()}" method="post">
                        <button class="btn btn-warning" type="submit">Calificar</button>
                    </form>
                    <%
                        }
                    %>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
