<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calificación</title>
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
            .form-group select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
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
            button:disabled {
                background-color: #ccc;
                cursor: not-allowed;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Reseña</h1>
            <form action="Controlador?menu=EnviarCalificar" method="POST">
                <div class="form-group">
                    <label>ID</label>
                    <input type="number" name="id" value="${idres}" readonly>
                </div>
                <div class="form-group">
                    <label>Comentarios</label>
                    <input type="text" name="comen" value="${cal.getComen()}" required>
                </div>
                <div class="form-group">
                    <label>Calificación (1-5)</label>
                    <select name="calificacion" required>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="form-group">
                    <c:choose>
                        <c:when test="${cal.getId() != 0}">
                            <button type="submit" disabled>Enviar</button>
                        </c:when>
                        <c:otherwise>
                            <button type="submit">Enviar</button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </form>
        </div>
    </body>
</html>
