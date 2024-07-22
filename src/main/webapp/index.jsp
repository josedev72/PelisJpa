<%-- Autor: josedev72 --%>

<%@page import="logica.Pelicula"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="estas">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <title>CAC-Movies</title>
</head>

<body>
    <header class="header">
        <a class="anclaLogo" href="#" onclick="showLoginRegister(); return false;">
            <i class="fa fa-film"></i>
            <span>CAC-MOVIES</span>
        </a>
        <nav class="navegacion">
    
            <ul class="listaNav">
                <li class="listaItem">
                    <a class="linkNav" href="#tendencias">Tendencias</a>
                </li>
    
                <li class="listaItem">
                    <a class="linkNav" href="#tendencias">Tendencias</a>
                </li>
    
                <li class="listaItem"  id="registerItem">
                    <a class="linkNav" href="registrarse.html">Registrarse</a>
                </li>
    
                <li class="listaItem" id="loginItem">
                    <a class="linkNav iniciarSesion" href="pages/iniciosesion.html">Iniciar Sesión</a>
                </li>
    
                <li class="listaItem" id="saludoItem">
                    <span class="bienvenida" id="welcomeMessage"></span>
                </li>
    
                <li class="listaItem" id="API Pokemon">
                    <a class="linkNav Api" href="pages/index_api2.html">API</a>
                </li>
                
                <li class="listaItem" id="crud">
                    <a class="crud" href="crudadmin.html">A.B.M.</a>
                </li>
            </ul>
        </nav>
    </header>
    
    <main id="main" class="main">
        <section class="sectionPrincipal">
            <h1 class="tituloPrincipal">
                Pelí­culas y series ilimitadas <br>en un solo lugar
            </h1>
            <h2 class="subtituloPrincipal">
                Disfruta donde quieras. <br>Cancela en cualquier momento.
            </h2>
            <a class="botonRegistrarse" href="pages/registrarse.html">Regi­strate</a>
        </section>

        <section class="buscadorPrincipal">
            <h2 class="tituloSection">¿Qué estas buscando para ver?</h2>
            <form class="buscadorPeliculas">
                <input class="inputBuscador" type="text" placeholder="Buscar..." id="buscar" name="buscar">
                <input class="botonBuscador" type="submit" value="Buscar">
            </form>
        </section>

        <hr>

        <section id="tendencias" class="peliculasTendencia">
            <h3 class="tituloSection">Las tendencias de hoy</h3>
            
            <div class="peliculas">
            
                <!<!-- Inicio Tendencias -->
                <div class="peliculas" id="tendenciasContainer">

                    <div id="contenedor-peliculas"></div>
                </div>
            </div>    
            <!-- fin Tendencias -->
            
            
            <button class="boton">Anterior</button>
            <button class="boton">Siguiente</button>
        </section>

        <hr>

        <section class="peliculasAclamadas">
            <h3 class="tituloSection">Las más aclamadas</h3>
            <div class="aclamadas" id="aclamadasContainer">
                <a href="pages/info.html">
                    <div class="peliculaItem">
                        <img class="imgAclamada" src="assets/img/peliculas/wages.jpg" alt="The Wages of Fear" loading="lazy">
                    </div>
                </a>

                <a href="pages/info.html">
                    <div class="peliculaItem">
                        <img class="imgAclamada" src="assets/img/peliculas/alienoid.jpg" alt="Alienoid" loading="lazy">
                    </div>
                </a>

                <a href="pages/info.html">
                    <div class="peliculaItem">
                        <img class="imgAclamada" src="assets/img/peliculas/roadhouse.jpg" alt="Road House" loading="lazy">
                    </div>
                </a>

                <a href="pages/info.html">

                    <div class="pelicula">
                        <img class="imgTendencia" src="assets\img\peliculas\dune.jpg" alt="Dune: Part Two" loading="lazy">
                        <div class="tituloPelicula">
                            <h4>Dune: Part Two</h4>
                        </div>
                    </div>
                </a>

                <a href="pages/info.html">
                    <div class="peliculaItem">
                        <img class="imgAclamada" src="assets/img/peliculas/dune.jpg" alt="Dune: Part Two" loading="lazy">
                    </div>
                </a>

                <a href="pages/info.html">
                    <div class="peliculaItem">
                        <img class="imgAclamada" src="assets/img/peliculas/hard hit.jpg" alt="Hard Hit" loading="lazy">
                    </div>
                </a>

                <a href="pages/info.html">
                    <div class="peliculaItem">
                        <img class="imgAclamada" src="assets/img/peliculas/madame web.jpg" alt="Madame Web" loading="lazy">
                    </div>
                </a>

                <a href="pages/info.html">
                    <div class="peliculaItem">
                        <img class="imgAclamada" src="assets\img\peliculas\creation of the gods.jpg" alt="Creation of the Gods" loading="lazy">
                    </div>
                </a>

            </div>
        </section>
        
        

    </main>

    <div id="footer-container"></div>

    <script src="js/pie.js"></script>

    <script src="js/saludo.js"></script>
    
    <script src="js/cargarPeliculas.js"></script>
    
    <<script>
        
    </script>
</body>
</html>