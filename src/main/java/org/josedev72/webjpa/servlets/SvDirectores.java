
package org.josedev72.webjpa.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Director;
import logica.Estrellas;
import logica.Pelicula;
import logica.Usuario;


@WebServlet(name = "SvDirectores", urlPatterns = {"/SvDirectores"})
public class SvDirectores extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Usuario> listaUsuarios = new ArrayList<>();
        listaUsuarios= control.traerUsuarios();
             
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaUsuarios", listaUsuarios);
        
        response.sendRedirect("mostrarUsuarios.jsp");
                
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Long id, String nombre, String apellido, Date fecha_nac, String nacionalidad
        long id =0;
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String fecha_nac = request.getParameter("fecha_nac");
        String nacionalidad = request.getParameter("nacionalidad");
                
        Director dire = new Director(Long.parseLong("0"),nombre, apellido, convertirEnFecha(fecha_nac), nacionalidad);
        
        System.out.println("Peli: " + dire);
        control.crearDirector(dire);
        
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
