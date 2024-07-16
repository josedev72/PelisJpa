
package logica;

import java.util.List;
import persistencia.ControladoraPersistencia;

public class Controladora {
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public void crearUsuario(Usuario usuario){
        controlPersis.crearUsuario(usuario);
    }
    
    public List<Usuario> traerUsuarios(){
        return controlPersis.traerUsuarios();
    }
    
    

    public void eliminarUsuario(int id) {
        controlPersis.eliminarUsuario(id);
    }

    public Usuario obtenerUsuario(int id) {
        return controlPersis.obtenerUsuario(id);
    }
    
    public void editarUsuario(Usuario usuario) {
        controlPersis.editarUsuario(usuario);
    }

    //Director
    public List<Director> traerDirectores() {
        return controlPersis.traerDirectores();
    }
    
    // Pelicula
    public List<Pelicula> traerPeliculas() {
        return controlPersis.traerPeliculas();
    }

    public void crearPelicula(Pelicula peli) {
        controlPersis.crearPelicula(peli);
    }

    //Estrellas
    public List<Estrellas> traerEstrellas() {
        return controlPersis.traerEstrellas();
    }

    public void crearDirector(Director director) {
        controlPersis.crearDirector(director);
    }
}
