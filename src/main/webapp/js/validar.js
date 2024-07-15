const form = document.getElementById("loginForm");

form.addEventListener("submit", (event) => {
    // Evita que se envíe el formulario de forma predeterminada
    event.preventDefault();

    const nameInput = document.getElementById("name");
    const lastNameInput = document.getElementById("lastName");
    const emailInput = document.getElementById("email");
    const passwordInput = document.getElementById("password");
    const termsAcceptedInput = document.getElementById("termsAccepted");

    let isValid = true;

    console.log("Contenido de nameInput: " + nameInput.value.trim());


    // Validar el nombre
    if (nameInput.value.trim() === "") {
        isValid = false;
        nameInput.classList.add("error");
    } else {
        nameInput.classList.remove("error");
    }

    // Validar el apellido
    if (lastNameInput.value.trim() === "") {
        isValid = false;
        lastNameInput.classList.add("error");
    } else {
        lastNameInput.classList.remove("error");
    }

    // Validar el correo electrónico
    if (!isValidEmail(emailInput.value.trim())) {
        isValid = false;
        emailInput.classList.add("error");
    } else {
        emailInput.classList.remove("error");
    }

    // Validar la contraseña
    if (passwordInput.value.trim() === "") {
        isValid = false;
        passwordInput.classList.add("error");
    } else {
        passwordInput.classList.remove("error");
    }

    // Validar si se aceptaron los términos
    if (!termsAcceptedInput.checked) {
        isValid = false;
        termsAcceptedInput.classList.add("error");
    } else {
        termsAcceptedInput.classList.remove("error");
    }

    if (isValid) {
        // Guardar el nombre ingresado en el formulario
        const nombre = nameInput.value + ' ' + lastNameInput.value;
        localStorage.setItem('userName', nombre);
    
        // Redirigir al usuario a index.html
        window.location.href = '../../index.html';
      } else {
        console.log('Hay errores en el formulario, no se puede enviar');
      }
});

function isValidEmail(email) {
    // Expresión regular básica para validar correos electrónicos
    const emailRegex = /^[^\s@]+@[^\s@]{3,}\.[^\s@]{2,}$/;
    return emailRegex.test(email);
}
