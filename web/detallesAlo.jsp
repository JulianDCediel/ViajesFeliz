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

        <div class="galeria">
            <h2>Imágenes</h2>
            <c:forEach var="fot" items="${fotos}">
                <img src="${fot}" alt="Imagen">
            </c:forEach>

        </div>
        <div>
            <h2>Datos de la Propiedad</h2>
            Numero Personas:${em.getN_personas()}<br>
            Numero Baños: ${em.getN_baños()}<br>
            Numero Habitaciones: ${em.getN_habitaciones()}<br>
            Tipo: ${em.getTipo()}<br>
            precio Minimo: ${em.getP_min()}<br>
            Mascotas: ${em.getMascotas()}<br>
            Caleafccion o Aire: ${em.getCal_aire()}<br>
            Ciudad: ${em.getCiudad()}<br>
            Barrio: ${em.getBarrio()}<br>
        </div>
        <div>
            <a href="Controlador?menu=reservas&accion=listar&id=${em.getDenco()}" class="btn btn-outline-info">RESERVAR</a>
        </div>
    </body>
</html>
