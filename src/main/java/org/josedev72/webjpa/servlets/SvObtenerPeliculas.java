
package org.josedev72.webjpa.servlets;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Pelicula;
import logica.Usuario;


@WebServlet(name = "SvObtenerPeliculas", urlPatterns = {"/SvObtenerPeliculas"})
public class SvObtenerPeliculas extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

   
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        List<Pelicula> lista = control.traerPeliculas();

        Gson gson = new Gson();
        String json = gson.toJson(lista);

        //retornar json con los datos obtenidos 
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println(json);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
