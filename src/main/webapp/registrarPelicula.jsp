<%-- Autor: josedev72 --%>

<%@page import="logica.Director"%>
<%@page import="java.util.List"%>
<%@page import="logica.Estrellas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    
    <!-- mis estilos -->
    <link rel="stylesheet" href="assets/css/styles.css">


    <title>Registrar Película</title>
</head>
<body>
    
    <div class="container">
        <form id="loginFormulario" class="centered-form" action="SvPeliculas" method="POST">
            <h2 class="form-title">Registro de Películas</h2>
            <!<!-- id, nombre, descripcion, genero, calificacion, anio, Estrellas estrellas, Director director -->
            <div class="form-group">
                <label for="name">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese nombre de la película" required>
            </div>

            <div class="form-group">
                <label for="lastName">Descripcion</label>
                <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="Ingrese Descripción" required>
            </div>

            <div class="form-group">
                <label for="genero">Género</label>
                <input type="number" class="form-control" id="genero" name="genero" placeholder="Ingrese género" required>
            </div>

            <div class="form-group">
                <label for="password">Calificación</label>
                <input type="number" class="form-control" id="calificacion" name="calificacion" placeholder="Ingrese su calificación" required>
            </div>
            
            <div class="form-group">
                <label for="fecha_nac">Año</label>
                <input type="number" class="form-control" id="anio" name="anio" placeholder="Ingrese año" required>
            </div>
            
            
            <div class="form-group">
                <label for="estrellas">Estrellas</label>
                <select class="form-control" id="estrellas" name="estrellas">
                    <%
                        List<Estrellas> listaEstrellas = (List<Estrellas>) request.getAttribute("listaEstrellas");
                        for (Estrellas estrella : listaEstrellas) {
                    %>
                        <option value="<%= estrella.getId() %>"><%= estrella.getNombre() %></option>
                    <%
                        }
                    %>
                </select>
            </div>
                
            <div class="form-group">
                <label for="director">Director</label>
                <select class="form-control" id="director" name="director">
                    <%
                        List<Director> listaDirectores = (List<Director>) request.getAttribute("listaDirectores");
                        for (Director director : listaDirectores) {
                    %>
                        <option value="<%= director.getId() %>"><%= director.getNombre() + " " + director.getApellido() %></option>
                    <%
                        }
                    %>
                </select>
            </div>
                
            
            
            <button type="submit" class="btn btn-primary">Registrar Película</button>
        </form>
      </div>
    <!--  
        <script src="../js/validardespues.js"></script>
    -->


</body>
</html>