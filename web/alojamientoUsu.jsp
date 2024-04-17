<%-- 
    Document   : alojamientoUsu
    Created on : Apr 13, 2024, 6:32:40 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                                <i>${em.getP_min()}</i>
                                <img src="ControladorIMG?id=${em.getDenco()}" width="200" height="180">
                            </div>
                            <div class="card-footer">
                                <label>Num Personas:${em.getN_personas()}</label><br>
                                <label>Num Habitaciones:${em.getN_habitaciones()}</label>
                            </div>
                        </div>
                    </div>      

                </c:forEach>
            </div>
        </div>
    </body>
</html>
