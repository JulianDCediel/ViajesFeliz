
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>The Easiest Way to Add Input Masks to Your Forms</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style2.css">
    </head>
    <body>
        <div class="registration-form">
            <form action="Validar" method="post">
                <div class="form-icon">
                    <span><i class="icon icon-user"></i></span>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control item" id="nombres" name="nombres"required="" placeholder="Nombres">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control item" id="apellidos" name="apellidos"required=" "placeholder="Apellidos">
                </div>
                <div class="form-group">
                    <input type="number" class="form-control item" id="cedula" name="cedula"required="" placeholder="Cedula">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control item" id="Direccion" name="Direccion"required=" "placeholder="Direccion">
                </div>
                <div class="form-group">
                    <input type="email" class="form-control item" id="email" name="email"required=""placeholder="Email">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control item" id="nac" name="nac"required=""placeholder="Nacionalidad">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control item" id="password" name="password"required="" placeholder="Password">
                </div>
                <div class="form-group">
                    <button class="btn btn-block create-account" name="accion" value="Registro" type="submit">Create Account</button>
                </div>
            </form>
            <div class="social-media">
                <h5>Sign up with social media</h5>
                <div class="social-icons">
                    <a href="#"><i class="icon-social-facebook" title="Facebook"></i></a>
                    <a href="#"><i class="icon-social-google" title="Google"></i></a>
                    <a href="#"><i class="icon-social-twitter" title="Twitter"></i></a>
                </div>
            </div>
        </div>
    </body>
</html>
