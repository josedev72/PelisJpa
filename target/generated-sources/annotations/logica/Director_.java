package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Pelicula;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-07-15T17:31:26")
@StaticMetamodel(Director.class)
public class Director_ { 

    public static volatile SingularAttribute<Director, Date> fecha_nac;
    public static volatile SetAttribute<Director, Pelicula> peliculas;
    public static volatile SingularAttribute<Director, String> apellido;
    public static volatile SingularAttribute<Director, Long> id;
    public static volatile SingularAttribute<Director, String> nombre;
    public static volatile SingularAttribute<Director, String> nacionalidad;

}