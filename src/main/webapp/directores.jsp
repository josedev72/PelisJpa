<%-- Autor: josedev72 --%>

<%@page import="logica.Director"%>
<%@page import="logica.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Usuarios</title>
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
                <h1 class="mb-4">Gestión de Directores</h1>
            </div>
            
            <div class="col-12 text-left">
                <a href="nuevoDirector.html" class="btn btn-success">Nuevo Director</a>
            </div>
            
        </div>
        <div class="row">
            <div class="col-12">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <!--Long id, String nombre, String apellido, Date fecha_nac, String nacionalidad -->
                            <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellido</th>
                            <th scope="col">Fecha Nacimiento</th>
                            <th scope="col">Nacionalidad</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Director> listaDirectores = (List<Director>) request.getAttribute("listaDirectores");
                            for (Director director : listaDirectores) { %>
                                <tr>
                                    <th scope="row"><%= director.getId() %></th>
                                    <td><%= director.getNombre() %></td>
                                    <td><%= director.getApellido() %></td>
                                    <td><%= director.getFecha_nac() %></td>
                                    <td><%= director.getNacionalidad() %></td>
                                    <td>
                                        <a href="editar?id=<%= director.getId() %>" class="btn btn-primary btn-sm">Editar</a>
                                        <a href="borrar?id=<%= director.getId() %>" class="btn btn-danger btn-sm">Borrar</a>
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