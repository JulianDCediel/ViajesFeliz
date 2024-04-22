
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <table class="table table-sm table-striped table-hover mt-4">
                <thead class="table-dark">
                    <tr>
                        <th>Direccion</th>
                        <th>Descripcion</th>
                        <th>Imagen</th>
                        <th>Aciones</th>
                    </tr>
                </thead>
                <tbody>
  
                        <tr>
                            <td>${em.getDireccion()}</td>
                            <td>
                                Numero Personas:${em.getN_personas()}<br>
                                Numero Baños: ${em.getN_baños()}<br>
                                Numero Habitaciones: ${em.getN_habitaciones()}<br>
                                Tipo: ${em.getTipo()}<br>
                                precio Minimo: ${em.getP_min()}<br>
                                Mascotas: ${em.getMascotas()}<br>
                                Caleafccion o Aire: ${em.getCal_aire()}<br>
                            </td>
                            <td><img src="ControladorIMG?id=${em.getDenco()}" width="200" height="200"></td>
                            <td>
                                <a href="#" class="btn btn-sm btn-warning"data-toggle="modal" data-target="#modal2"><i class="fa-regular fa-pen-to-square"></i>>  Editar</a>
                                <a href="#" class="btn btn-sm btn-danger"data-toggle="modal" data-target="#modal3"><i class="fa-regular fa-trash-can"></i>  Eliminar</a>
                            </td>
                        </tr>

                </tbody>
            </table>
    </body>
</html>
