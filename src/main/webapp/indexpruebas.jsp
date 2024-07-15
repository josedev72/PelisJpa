<%-- 
    Document   : index
    Created on : 14 jul 2024, 10:34:35
    Author     : joseg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Datos del Usuario</h1>
        <form action="SvUsuarios" method="POST">
            <p><label>Nombre: </label><input type="text" id="nombre" name="nombre"> </p>
            <p><label>Apellido: </label><input type="text" id="apellido" name="apellido"> </p>
            <p><label>Email: </label><input type="text" id="email" name="email"> </p>
            <p><label>Contraseña: </label><input type="password" id="contrasenia" name="contrasenia"> </p>
            <p><label>Fecha nacimiento: </label><input type="date" id="fecha_nac" name="fecha_nac"> </p>
            <p><label>Nacionalidad: </label><input type="text" id="nacionalidad" name="nacionalidad"> </p>
            <button type="submit"> Enviar</button>
        </form>
        
        <h1>Mostrar Usuarios</h1>
        <form action="SvUsuarios" method="GET">            
            <button type="submit"> Mostrar</button>
        </form>
        
        <h1>Eliminar Usuarios</h1>
        <form action="SvUsuariosEliminar" method="POST">
            <p><label>Id: </label><input type="text" id="id" name="id"> </p>
            <button type="submit"> Eliminar usuario</button>
        </form>
        
        <h1>Editar Usuarios</h1>
        <form action="SvUsuariosEditar" method="GET">
            <p><label>Id: </label><input type="text" id="id" name="id"> </p>
            <button type="submit"> Editar usuario</button>
        </form>
        
    </body>
</html>
