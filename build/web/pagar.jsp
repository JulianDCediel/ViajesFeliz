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
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 60%;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }
            h1 {
                color: #333;
                border-bottom: 2px solid #4CAF50;
                padding-bottom: 10px;
                text-align: center;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
                color: #555;
            }
            .form-group input[type="text"],
            .form-group input[type="number"],
            .form-group input[type="date"],
            .form-group select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }
            .form-group input[type="text"][readonly],
            .form-group input[type="number"][readonly] {
                background-color: #e9ecef;
            }
            button {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                color: #fff;
                background-color: #007BFF;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                transition: background-color 0.3s ease;
                cursor: pointer;
            }
            button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>PAGO</h1>
            <form action="Controlador?menu=pago" method="POST">
                <div class="form-group">
                    <label class="form-label">Direccion:</label>
                    <input type="text" name="direccion" id="direccion" class="form-control" value="${em.getDireccion()}" readonly="">
                </div>
                <div class="form-group">
                    <label class="form-label">Usuario:</label>
                    <input type="number" name="usuario" id="usuario" class="form-control" value="${usu}" readonly="">
                </div>
                <div class="form-group">
                    <label for="fecha_pago">Fecha pago:</label>
                    <input type="date" id="fecha_pago" name="fecha_pago" class="form-control" required="">
                </div>
                <div class="form-group">
                    <label class="form-label">Cantidad:</label>
                    <input type="number" name="cantidad" id="cantidad" class="form-control" required="" min="${total*0.2}" max="${total}">
                </div>
                <button type="submit">Pagar</button>
            </form>
        </div>
    </body>
</html>