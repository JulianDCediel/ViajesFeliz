<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelo.Alojamiento"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/732d00cb0f.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container mt-2">
            <div class="row">
                <c:forEach var="em" items="${Alojamientos}">
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card-header">
                                <label>Direccion</label><br>
                                <label>${em.getDireccion()}</label>
                            </div>
                            <div class="card-body">
                                <img src="${em.getRuta()}" width="300" height="250">
                            </div>
                            <div class="card-footer">
                                <label>Num Personas:${em.getN_personas()}</label><br>
                                <label>Num Habitaciones:${em.getN_habitaciones()}</label>
                                <label>Precio minimo Diario:${em.getP_min()}</label>
                                <div>
                                    <a href="Controlador?menu=AlojamientoUsuDet&accion=listar&id=${em.getDenco()}" class="btn btn-outline-info">VER ALAJAMIENTO</a>
                                </div>
                            </div>
                        </div>
                    </div>      

                </c:forEach>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
