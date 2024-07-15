package org.josedev72.webjpa.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Usuario;
import static org.josedev72.webjpa.servlets.SvUsuarios.convertirEnFecha;

@WebServlet(name = "SvUsuariosEditar", urlPatterns = {"/SvUsuariosEditar"})
public class SvUsuariosEditar extends HttpServlet {
    
    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt( request.getParameter("id"));
        
        Usuario usuario = control.obtenerUsuario(id);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("UsuarioEdit", usuario);
        
        response.sendRedirect("editarUsuario.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario usu = new Usuario();
        usu.setId(Integer.parseInt(request.getParameter("id")));
        usu.setNombre(request.getParameter("nombre"));
        usu.setApellido(request.getParameter("apellido"));
        usu.setEmail(request.getParameter("email"));
        usu.setContrasenia(request.getParameter("contrasenia"));
        
        usu.setFecha_nac(convertirEnFecha(request.getParameter("fecha_nac")));
        usu.setNacionalidad(request.getParameter("nacionalidad"));
        control.editarUsuario(usu);
        
        response.sendRedirect("index.jsp");        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    public static Date convertirEnFecha(String fechaString){
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = null;
        try {
            fecha=df.parse(fechaString);
            
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        return fecha;
    }

}
