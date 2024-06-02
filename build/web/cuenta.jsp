<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MI CUENTA</title>
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
            .form-group input[type="password"],
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
            <h1>MIS DATOS</h1>
            <form action="Controlador?menu=EditarUsu" method="POST">
                <div class="form-group">
                    <label>Cedula</label>
                    <input type="number" value="${Cliente.getCed()}" name="cedula" class="form-control" readonly="">
                </div>
                <div class="form-group">
                    <label>Nombres</label>
                    <input type="text" value="${Cliente.getNom()}" name="nombres" class="form-control">
                </div>
                <div class="form-group">
                    <label>Apellidos</label>
                    <input type="text" value="${Cliente.getApell()}" name="apellidos" class="form-control">
                </div>
                <div class="form-group">
                    <label>Direccion</label>
                    <input type="text" value="${Cliente.getDireccion()}" name="Direccion" class="form-control">
                </div>
                <div class="form-group">
                    <label>Telefono</label>
                    <input type="text" value="${Cliente.getTel()}" name="telefono" class="form-control">
                </div>
                <div class="form-group">
                    <label>Correo</label>
                    <input type="text" value="${Cliente.getCorreo()}" name="email" class="form-control">
                </div>
                <div class="form-group">
                    <label>Nacionalidad</label>
                    <input type="text" value="${Cliente.getNaci()}" name="nac" class="form-control">
                </div>
                <div class="form-group">
                    <label>Contraseña</label>
                    <input type="password" name="password" class="form-control">
                </div>
                <div class="form-group">
                    <button type="submit">Editar</button>
                </div>
            </form>
        </div>
    </body>
</html>