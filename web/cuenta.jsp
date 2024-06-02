<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MI CUENTA</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 600px;
                margin: 40px auto;
                padding: 30px;
                background-color: #fff;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }
            h1 {
                color: #333;
                text-align: center;
                margin-bottom: 30px;
                position: relative;
            }
            h1::before {
                content: "";
                position: absolute;
                bottom: -10px;
                left: 50%;
                transform: translateX(-50%);
                width: 100px;
                height: 4px;
                background-color: #4CAF50;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
                color: #555;
                font-weight: 600;
            }
            .form-group input[type="text"],
            .form-group input[type="number"],
            .form-group input[type="date"],
            .form-group input[type="password"],
            .form-group select {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 16px;
            }
            .form-group input[type="text"][readonly],
            .form-group input[type="number"][readonly] {
                background-color: #f5f5f5;
            }
            button {
                width: 100%;
                padding: 15px;
                font-size: 18px;
                color: #fff;
                background-color: #4CAF50;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                transition: background-color 0.3s ease;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            button:hover {
                background-color: #3e8e41;
            }
            button i {
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>MIS DATOS</h1>
            <form action="Controlador?menu=EditarUsu" method="POST">
                <div class="form-group">
                    <label>Cedula</label>
                    <input type="number" value="${Cliente.getCed()}" name="cedula" class="form-control" readonly>
                </div>
                <div class="form-group">
                    <label>Nombres</label>
                    <input type="text" value="${Cliente.getNom()}" name="nombres" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Apellidos</label>
                    <input type="text" value="${Cliente.getApell()}" name="apellidos" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Dirección</label>
                    <input type="text" value="${Cliente.getDireccion()}" name="Direccion" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Teléfono</label>
                    <input type="text" value="${Cliente.getTel()}" name="telefono" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Correo</label>
                    <input type="text" value="${Cliente.getCorreo()}" name="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Nacionalidad</label>
                    <input type="text" value="${Cliente.getNaci()}" name="nac" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Contraseña</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <div class="form-group">
                    <button type="submit"><i class="fas fa-save"></i> Editar</button>
                </div>
            </form>
        </div>
    </body>
</html>