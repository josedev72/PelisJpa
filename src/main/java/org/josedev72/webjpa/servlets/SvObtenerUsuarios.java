
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
import logica.Usuario;


@WebServlet(name = "SvObtenerUsuarios", urlPatterns = {"/SvObtenerUsuarios"})
public class SvObtenerUsuarios extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

   
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //String filtro = request.getParameter("filtro");

        Usuario usu = new Usuario();
        List<Usuario> lista = control.traerUsuarios();

        Gson gson = new Gson();
        String json = gson.toJson(lista);

        System.out.println("json usuarios: " + json);

        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println(json);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
