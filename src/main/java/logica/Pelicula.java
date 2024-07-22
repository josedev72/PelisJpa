package logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Entity
@Data
public class Pelicula implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    private String nombre;
    private String descripcion;
    private String urlImagen;
    private int genero;
    private int calificacion;
    private int anio;
    private int id_estrellas;
    private int id_director;

    public Pelicula() {
    }

    public Pelicula(Long id, String nombre, String descripcion, String urlImagen, int genero, int calificacion, int anio, int id_estrellas, int id_director) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.urlImagen = urlImagen;
        this.genero = genero;
        this.calificacion = calificacion;
        this.anio = anio;
        this.id_estrellas = id_estrellas;
        this.id_director = id_director;
    }

    
    
    
    
}
