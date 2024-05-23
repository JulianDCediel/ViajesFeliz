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
        <h1>PAGO 2</h1>
        <form action="Controlador?menu=pagofaltante" method="POST">
            <div>
                <label class="form-label">Reserva:</label>
                <input type="text" name="reserva" id="reserva" class="form-control" value="${em.getIdRes()}" readonly="">
            </div>
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
                <label class="form-label">Total:</label>
                <input type="number" name="total" id="total" class="form-control"value="${em.getTotal()}"readonly="">
            </div>
            <div>
                <label class="form-label">Pagado:</label>
                <input type="number" name="pagado" id="pagado" class="form-control"value="${em.getCantP()}"readonly="">
            </div>
            <div>
                <label class="form-label">Faltante:</label>
                <input type="number" name="faltante" id="faltante" class="form-control"value="${em.getTotal()-em.getCantP()}"readonly="">
            </div>
            <button type="submit">Pagar Faltante</button>
        </form>

    </body>
</html>
