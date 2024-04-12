<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ViajesFeliz</title>
        <link rel="stylesheet" href="css/style4.css">
    </head>
    <body>

        <div class="back"></div>
        <div>
            <h1>VIAJESFELIZ S.A</h1>
        </div>
        <nav>
            <ul>
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Alojamientos</a></li>
                <li><a href="#">Reservas</a></li>
                <li class="dropdown">
                    <button class="dropbtn">${user.getNom()}</button>
                    <div class="dropdown-content">
                        <a href="#">Ver Perfil</a>
                        <a href="index.jsp">Salir</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div>
            <h2>ENCUENTRA EL<BR> LUGAR PERFECTO</h2>
        </div>
        <div>
            <h3>NOSOTROS ESTAMOS PARA<BR> AYUDARTE EN EL PROCESO</h3>
        </div>
    </body>
</html>
