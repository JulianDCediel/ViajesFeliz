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
        <div >
            <h2 class="text-center">Alojamientos</h2>
            <div class="row justify-content">
                <div class="col-auto">
                    <a href="" class="btn btn-primary"data-toggle="modal" data-target="#nuevomodal"><i class="fa-solid fa-circle-plus"></i>  Agregar Alojamiento</a>
                </div>        
            </div>
            <!-- Modal -->
            <div class="modal fade" id="nuevomodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="nuevomodal">AGREGAR ALOJAMIENTO</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="Controlador?menu=Alojamiento" method="POST"">
                                <div class="mb-3">
                                    <label class="form-label">Direccion:</label>
                                    <input type="text" name="direccion" id="direccion" class="form-control" required="">
                                </div> 
                                <div class="mb-3">
                                    <label class="form-label">Numero Personas:</label>
                                    <input type="number" name="personas" id="personas" class="form-control" required="">
                                </div> 
                                <div class="mb-3">
                                    <label class="form-label">Numero Baños:</label>
                                    <input type="number" name="banos" id="banos" class="form-control" required="">
                                </div> 
                                <div class="mb-3">
                                    <label class="form-label">Numero habitaciones:</label>
                                    <input type="number" name="hab" id="hab" class="form-control" required="">
                                </div> 
                                <div class="mb-3">
                                    <label class="form-label">Tipo</label>
                                    <select name="tipo" id="tipo" class="form-select">
                                        <option value="casa">Casa</option>
                                        <option value="cabaña">Cabaña</option>
                                    </select>
                                </div> 
                                <div class="mb-3">
                                    <label class="form-label">Precio Min</label>
                                    <input type="number" name="precio" id="precio" class="form-control" required="">
                                </div> 
                                <div class="mb-3">
                                    <label class="form-label">Mascotas</label>
                                    <select name="mascotas" id="mascotas" class="form-select">
                                        <option value="Si">Si</option>
                                        <option value="No">No</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Cal/Aire</label>
                                    <select name="ca" id="ca" class="form-select">
                                        <option value="Calefaccion">Calefaccion</option>
                                        <option value="Aire">Aire Acondicionado</option>
                                        <option value="Ambos">Ambos</option>
                                        <option value="Ninguno">Ninguno</option>
                                    </select>
                                </div>
                                <div>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                    <button type="submit" class="btn btn-primary" name="accion" value="Add"><i class="fa-regular fa-floppy-disk"></i> Guardar</button>
                                </div>
                            </form>
         
                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
                 <form action="Controlador?menu=Alojamiento" method="POST" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label class="form-label">Fotos</label>
                                    <input type="file" name="fotos" id="fotos" class="form-control">
                                    <button type="submit" class="btn btn-primary" name="accion" value="AddIm"><i class="fa-regular fa-floppy-disk"></i> Guardar</button>
                                </div> 
                            </form>
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
                    <c:forEach var="em" items="${Alojamientos}">

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
                    </c:forEach>
                </tbody>
            </table>
            <!-- Modal2 -->
            <div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="editarmodel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modal2">EDITAR ALOJAMIENTO</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="Controlador?menu=Alojamiento" method="POST" enctype="multipart/form-data">

                                <div class="mb-3">
                                    <label class="form-label">Direccion:</label>
                                    <input type="text" name="direccion" id="direccion""class="form-control" required="">
                                </div> 
                                <div class="mb-3">
                                    <label class="form-label">Numero Personas:</label>
                                    <input type="number" name="personas" id="personas" class="form-control" required="">
                                </div> 
                                <div class="mb-3">
                                    <label class="form-label">Numero Baños:</label>
                                    <input type="number" name="banos" id="banos" class="form-control" required="">
                                </div> 
                                <div class="mb-3">
                                    <label class="form-label">Numero habitaciones:</label>
                                    <input type="number" name="hab" id="hab" class="form-control" required="">
                                </div> 
                                <div class="mb-3">
                                    <label class="form-label">Tipo</label>
                                    <select name="tipo" id="tipo" class="form-select">
                                        <option value="casa">Casa</option>
                                        <option value="cabaña">Cabaña</option>
                                    </select>
                                </div> 
                                <div class="mb-3">
                                    <label class="form-label">Precio Min</label>
                                    <input type="number" name="precio" id="precio" class="form-control" required="">
                                </div> 
                                <div class="mb-3">
                                    <label class="form-label">Mascotas</label>
                                    <select name="mascotas" id="mascotas" class="form-select">
                                        <option value="Si">Si</option>
                                        <option value="No">No</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Cal/Aire</label>
                                    <select name="ca" id="ca" class="form-select">
                                        <option value="calefaccion">Calefaccion</option>
                                        <option value="Aire">Aire Acondicionado</option>
                                        <option value="Ambos">Ambos</option>
                                        <option value="Ninguno">Ninguno</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Fotos</label>
                                    <input type="file" name="fotos" id="fotos" class="form-control" accept="image/png" multiple>
                                </div> 
                                <div class="">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                    <button type="submit" class="btn btn-primary" name="accion" value="edit"><i class="fa-regular fa-floppy-disk"></i> Guardar</button>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal3 -->
            <div class="modal fade" id="modal3" tabindex="-1" role="dialog" aria-labelledby="eliminarmodal" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modal3">ElIMINAR ALOJAMIENTO</h5>
                            <button type="button" class="close" data-dismiss="modal3" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            ¿DESEAS ELIMINAR EL ALOJAMIENTO?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <a class="btn btn-danger" href="Controlador?menu=Alojamineto&accion=Delete&id=${em.getDenco()}">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>       

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
