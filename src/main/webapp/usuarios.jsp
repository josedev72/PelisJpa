<%-- Autor: josedev72 --%>

<%@page import="logica.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Usuarios</title>
    <style>
        /* Estilos CSS */
    </style>
</head>
<body>
    <h1>Gestión de Usuarios</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Correo Electrónico</th>
                <th>Fecha Nacimiento</th>
                <th>Nacionalidad</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Usuario> listaUsuarios = (List<Usuario>) request.getAttribute("listaUsuarios");
                for (Usuario usuario : listaUsuarios) { %>
                    <tr>
                        <td><%= usuario.getId() %></td>
                        <td><%= usuario.getNombre() %></td>
                        <td><%= usuario.getApellido() %></td>
                        <td><%= usuario.getEmail() %></td>
                        <td><%= usuario.getFecha_nac() %></td>
                        <td><%= usuario.getNacionalidad()%></td>
                        <td>
                            <a href="editar?id=<%= usuario.getId() %>" class="btn btn-primary">Editar</a>
                            <a href="borrar?id=<%= usuario.getId() %>" class="btn btn-danger">Borrar</a>
                        </td>
                    </tr>
            <%  } %>
        </tbody>
    </table>
        
    <a href="nuevoUsaurio.html" class="btn btn-primary">Nuevo Usuario</a>
</body>
</html>