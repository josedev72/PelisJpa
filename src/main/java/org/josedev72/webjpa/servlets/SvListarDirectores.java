
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
import logica.Usuario;


@WebServlet(name = "SvListarDirectores", urlPatterns = {"/SvListarDirectores"})
public class SvListarDirectores extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Director> listaDirectores = new ArrayList<>();
        listaDirectores = control.traerDirectores();
             
        // Agregar la lista de usuarios a la request
        request.setAttribute("listaDirectores", listaDirectores);

        // Enviar la request al archivo JSP
        request.getRequestDispatcher("/directores.jsp").forward(request, response);
                
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
