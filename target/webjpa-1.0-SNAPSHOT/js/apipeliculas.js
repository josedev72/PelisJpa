async function getPelisInfo() {
  // Evita que se envíe el formulario de forma predeterminada
  event.preventDefault();

  // Elementos de la página html
  const pokemonNameInput = document.getElementById('pokemon-name');
  const pokemonName = pokemonNameInput.value.trim().toLowerCase();

  try {
    const response = await fetch(`http://localhost:8080/api/peliculas/mostrarTodas`);
    if (!response.ok) {
      throw new Error(`Error ${response.status}: ${response.statusText}`);
    }
    const data = await response.json();

    console.log(data);

    
    displayPokemonDetails(data);
  } catch (error) {
    console.error('Error al obtener la información del Pokémon:', error);
    displayErrorMessage(error.message);
  }
}

function displayPokemonDetails(pokemonData) {
  const pokemonDetailsElement = document.getElementById('pokemon-details');
  pokemonDetailsElement.innerHTML = `
    <div class="d-flex flex-column justify-content-center align-items-center">
      <h2>${pokemonData.name}</h2>
      <p>ID: ${pokemonData.id}</p>
      <p>Tipo: ${pokemonData.types.map(type => type.type.name).join(', ')}</p>
      <p>Altura: ${pokemonData.height} dm</p>
      <p>Peso: ${pokemonData.weight} hg</p>
      <img src="${pokemonData.sprites.front_default}" alt="${pokemonData.name}">
    </div>
  `;
}

function displayErrorMessage(errorMessage) {
  const pokemonDetailsElement = document.getElementById('pokemon-details');
  pokemonDetailsElement.innerHTML = `
    <p style="color: red;">${errorMessage}</p>
  `;
}