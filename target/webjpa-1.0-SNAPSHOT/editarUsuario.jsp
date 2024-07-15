<%-- Autor: josedev72 --%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuario</title>
    </head>
    <body>
        <%
            Usuario usuario = (Usuario) request.getSession().getAttribute("UsuarioEdit");
            
            // Cadena de fecha original
            Date fecha = usuario.getFecha_nac();

            // Formatear la fecha en el formato requerido
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String fechaFormateada = sdf.format(fecha);
            System.out.println("fechaFormateada: " + fechaFormateada);
            %>
            
        <h1>Datos del Usuario</h1>
        <form action="SvUsuariosEditar" method="POST">
            <p><label>Id: </label><input type="text" id="id" name="id" value="<%=usuario.getId()%>"></p>
            <p><label>Nombre: </label><input type="text" id="nombre" name="nombre" value="<%=usuario.getNombre()%>"></p>
            <p><label>Apellido: </label><input type="text" id="apellido" name="apellido" value="<%=usuario.getApellido()%>"></p>
            <p><label>Email: </label><input type="text" id="email" name="email" value="<%=usuario.getEmail()%>"></p>
            <p><label>Contraseña: </label><input type="password" id="contrasenia" name="contrasenia" value="<%=usuario.getContrasenia()%>"></p>
            <p><label>Fecha nacimiento: </label><input type="date" id="fecha_nac" name="fecha_nac" value="<%=fechaFormateada%>"></p>
            <p><label>Nacionalidad: </label><input type="text" id="nacionalidad" name="nacionalidad" value="<%=usuario.getNacionalidad()%>"></p>
            <button type="submit"> Editar</button>
            
        </form>
        
            <script>
                // Obtener el valor del input de tipo "date"
                var dateInput = document.getElementById("fecha_nac");
                var formattedDate = dateInput.value;
                console.log(formattedDate); // Salida: 2005-12-01
            </script>
    </body>
</html>
