<%-- 
    Document   : pagar
    Created on : May 22, 2024, 11:23:51 AM
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
    <h1>PAGO</h1>
    <form action="Controlador?menu=pago" method="POST">
        <div>
            <label class="form-label">Direccion:</label>
            <input type="text" name="direccion" id="direccion" class="form-control" value="${em.getDireccion()}" readonly="">
        </div>
        <div>
            <label class="form-label">Usuario:</label>
            <input type="number" name="usuario" id="usuario" class="form-control" value="${usu}" readonly="">
        </div>
        <div>
            <label for="fecha_inicio">Fecha pago</label>
            <input type="date" id="fecha_pago" name="fecha_pago"" required="">

        </div>
        <div>
            <label class="form-label">Cantidad:</label>
            <input type="number" name="cantidad" id="cantidad" class="form-control"required="" min="${total*0.2}" max="${total}">
        </div>
        <button type="submit">Pagar</button>
    </form>
        
    </body>
</html>
