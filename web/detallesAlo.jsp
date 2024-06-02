<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelo.Alojamiento"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 20px;
            }

            .container {
                display: flex;
                align-items: flex-start;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .galeria {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-right: 20px;
            }

            .galeria img {
                width: 200px;
                height: 200px;
                object-fit: cover;
                margin-bottom: 10px;
                border-radius: 5px;
                transition: transform 0.3s;
            }

            .galeria img:hover {
                transform: scale(1.2);
            }

            .datos {
                flex: 1;
            }

            .datos h2 {
                color: #333;
            }

            .btn {
                display: inline-block;
                padding: 10px 20px;
                background-color: #4CAF50;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .btn:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="galeria">
                <h2>Imágenes</h2>
                <c:forEach var="fot" items="${fotos}">
                    <img src="${fot}" alt="Imagen">
                </c:forEach>
            </div>
            <div class="datos">
                <h2>Datos de la Propiedad</h2>
                <p>Numero Personas: ${em.getN_personas()}</p>
                <p>Numero Baños: ${em.getN_baños()}</p>
                <p>Numero Habitaciones: ${em.getN_habitaciones()}</p>
                <p>Tipo: ${em.getTipo()}</p>
                <p>precio Minimo: ${em.getP_min()}</p>
                <p>Mascotas: ${em.getMascotas()}</p>
                <p>Caleafccion o Aire: ${em.getCal_aire()}</p>
                <p>Ciudad: ${em.getCiudad()}</p>
                <p>Barrio: ${em.getBarrio()}</p>
                <a href="Controlador?menu=reservas&accion=listar&id=${em.getDenco()}" class="btn">RESERVAR</a>
            </div>
        </div>
    </body>
</html>