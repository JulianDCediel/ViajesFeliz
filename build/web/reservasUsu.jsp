<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelo.Alojamiento"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>TUS RESERVAS!</h1>
        <c:forEach var="em" items="${reservas}">
            <div>
                Numero Reserva: ${em.getIdRes()}<br>
                Estado Reserva: ${em.getEstado()}<br>
                Direccion: ${em.getDireccion()}<br>
                Cedula usuario: ${em.getCed()}<br>
                Fecha Inicio: ${em.getF_i()}<br>
                Fecha Inicio: ${em.getF_f()}<br>
                Numero Personas: ${em.getN_per()}<br>
                Mascotas: ${em.getMascotas()}<br>
                Total: ${em.getTotal()}<br>
                Cantidad Pagada: ${em.getCantP()}<br>
                <c:if test="${em.getCantP() < em.getTotal()}">
                    <form action="" method="post">
                        <a class="btn btn-warning" href="Controlador?menu=reservarFin&id=${em.getIdRes()}">PAGAR</a>
                    </form>
                </c:if>
            </div>
        </c:forEach>
    </body>
</html>

