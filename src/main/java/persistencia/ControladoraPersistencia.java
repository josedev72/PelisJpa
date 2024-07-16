package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Director;
import logica.Estrellas;
import logica.Pelicula;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {
    UsuarioJpaController usuJPA = new UsuarioJpaController();
    DirectorJpaController direJPA = new DirectorJpaController();
    PeliculaJpaController peliJPA = new PeliculaJpaController();
    EstrellasJpaController estrellasJPA = new EstrellasJpaController();
    
    public void crearUsuario(Usuario usuario){
        usuJPA.create(usuario);
    }
    
    public List<Usuario> traerUsuarios(){
        return usuJPA.findUsuarioEntities();
    }

    public void eliminarUsuario(int id) {
        try {
            usuJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario obtenerUsuario(int id) {
        return usuJPA.findUsuario(id);
    }
    
    public void editarUsuario(Usuario usuario) {
        try {
            usuJPA.edit(usuario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //Director
    public List<Director> traerDirectores(){
        return direJPA.findDirectorEntities();
    }

    public List<Pelicula> traerPeliculas() {
        return peliJPA.findPeliculaEntities();
    }

    public void crearPelicula(Pelicula peli) {
        peliJPA.create(peli);
    }

    public List<Estrellas> traerEstrellas() {
        return estrellasJPA.findEstrellasEntities();
    }
}
