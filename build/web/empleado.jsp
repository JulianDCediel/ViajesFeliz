<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>EMPLOYEES</title>
    </head>
    <body>
        <div class="d-flex" >
            <div class="card col-sm-4">
                <div class="card_body">
                    <form action="Controlador?menu=Empleado" method="POST">
                        <div class="form-group">
                            <label>Cedula</label>
                            <input type="text" value="${empleado.getCed()}" name="txtCed" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Nombres</label>
                            <input type="text" value="${empleado.getNom()}" name="txtNombres" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Apellidos</label>
                            <input type="text" value="${empleado.getApell()}" name="txtApellidos" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Correo</label>
                            <input type="text" value="${empleado.getCorreo()}" name="txtCorreo" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="text" value="${empleado.getContra()}" name="txtContra" class="form-control">
                        </div>
                        
                        <input type="submit" name="accion" value="Add" class="btn btn-info">
                        <input type="submit" name="accion" value="Update" class="btn btn-success">
                    </form>
                </div>
            </div>

            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Cedula</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Correo</th>
                            <th>Contraseña</th>
                            <th>ACTIONS</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <c:forEach var="em" items="${empleados}">
                            <tr>
                                <td>${em.getCed()}</td>
                                <td>${em.getNom()}</td>
                                <td>${em.getApell()}</td>
                                <td>${em.getCorreo()}</td>
                                <td>${em.getContra()}</td>
                               <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Empleado&accion=Edit&id=${em.getCed()}">Edit</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Empleado&accion=Delete&id=${em.getCed()}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>   
    </body>
</html>

