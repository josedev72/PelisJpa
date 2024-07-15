<%-- Autor: josedev72 --%>

<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mostrar Usuarios</title>
    </head>
    <body>
        <h1>Mostrar Usuarios</h1>
        <%
            try {
                List<Usuario> lista = (List) request.getSession().getAttribute("listaUsuarios");
                for (Usuario u : lista) {
                %>
                    <p><b>Usuario N°: <%=u.getId()%></b></p>
                    <p><b>Nombre: <%=u.getNombre()%></b></p>
                    <p><b>Apellido: <%=u.getApellido()%></b></p>
                    <p>email: <%=u.getEmail()%></p>
                    <p>Fecha Nacimiento: <%=u.getFecha_nac()%></p>
                    <p>Nacionalidad: <%=u.getNacionalidad()%></p>
                    <p>--------------------------------------------------</p>

                <% } 
            } catch (Exception e) {
                System.out.println("Error: " + e.getMessage());
                }%>
    </body>
</html>
