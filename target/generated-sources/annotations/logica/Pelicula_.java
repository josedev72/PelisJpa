package logica;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Director;
import logica.Estrellas;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-07-14T20:50:07")
@StaticMetamodel(Pelicula.class)
public class Pelicula_ { 

    public static volatile SingularAttribute<Pelicula, String> descripcion;
    public static volatile SingularAttribute<Pelicula, Integer> calificacion;
    public static volatile SingularAttribute<Pelicula, Director> director;
    public static volatile SingularAttribute<Pelicula, Integer> genero;
    public static volatile SingularAttribute<Pelicula, Long> id;
    public static volatile SingularAttribute<Pelicula, String> nombre;
    public static volatile SingularAttribute<Pelicula, Integer> anio;
    public static volatile SingularAttribute<Pelicula, Estrellas> estrellas;

}