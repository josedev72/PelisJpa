// Función para obtener los datos del JSON desde el servlet
function obtenerPeliculas() {
  // Hacer una petición AJAX al servlet
  fetch('SvObtenerPeliculas')
    .then(response => response.json())
    .then(data => {
      // Llamar a la función para generar el código HTML
      generarPeliculas(data);
    })
    .catch(error => {
      console.error('Error al obtener las películas:', error);
    });
}

// Función para generar el código HTML
function generarPeliculas(peliculas) {
  let htmlPeliculas = "";

  peliculas.forEach(pelicula => {
    htmlPeliculas += `
      <div class="peliculas">
        <a href="pages/info.html?id=${pelicula.id}">
          <div class="pelicula">
            <img class="imgTendencia" src="assets/img/peliculas/${pelicula.urlImagen}" alt="${pelicula.nombre}" loading="lazy">
            <div class="tituloPelicula">
              <h4>${pelicula.nombre}</h4>
            </div>
          </div>
        </a>
      </div>
    `;
  });

  // Ubicar el contenedor donde se insertará el HTML
  const contenedorPeliculas = document.getElementById("contenedor-peliculas");

  // Generar y agregar el código HTML al contenedor
  contenedorPeliculas.innerHTML = htmlPeliculas;
}

// Llamar a la función para obtener las películas
obtenerPeliculas();