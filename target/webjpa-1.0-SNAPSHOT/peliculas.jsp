<%-- Autor: josedev72 --%>

<%@page import="logica.Pelicula"%>
<%@page import="logica.Director"%>
<%@page import="logica.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Películas</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</head>
<body>
    <div class="container-fluid mt-5">
        <div class="row">
            <div class="col-12">
                <h1 class="mb-4">Gestión de Películas</h1>
            </div>
            
            <div class="col-12 text-left">
                <a href="SvObtenerDirectorEstrellas" class="btn btn-success">Nueva Película</a>
            </div>
            
        </div>
        <div class="row">
            <div class="col-12">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <!-- id, nombre, descripcion, genero, calificacion, anio, estrellas, director) -->
                            <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Género</th>
                            <th scope="col">Calificación</th>
                            <th scope="col">Año</th>
                            <th scope="col">Estrellas</th>
                            <th scope="col">Director</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Pelicula> listaPeliculas = (List<Pelicula>) request.getAttribute("listaPeliculas");
                            for (Pelicula pelicula : listaPeliculas) { %>
                                <tr>
                                    <th scope="row"><%= pelicula.getId() %></th>
                                    <td><%= pelicula.getNombre() %></td>
                                    <td><%= pelicula.getDescripcion()%></td>
                                    <td><%= pelicula.getGenero()%></td>
                                    <td><%= pelicula.getCalificacion()%></td>
                                    <td><%= pelicula.getAnio()%></td>
                                    <td><%= pelicula.getId_estrellas()%></td>
                                    <td><%= pelicula.getId_director()%></td>
                                    <td>
                                        <a href="editar?id=<%= pelicula.getId() %>" class="btn btn-primary btn-sm">Editar</a>
                                        <a href="borrar?id=<%= pelicula.getId() %>" class="btn btn-danger btn-sm">Borrar</a>
                                    </td>
                                </tr>
                        <%  } %>
                    </tbody>
                </table>
            </div>
        </div>
        
    </div>
</body>
</html>