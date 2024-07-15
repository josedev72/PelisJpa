const form = document.getElementById("loginForm");

form.addEventListener("submit", (event) => {
    // Evita que se envíe el formulario de forma predeterminada
    event.preventDefault();

    const emailInput = document.getElementById("email");
    const passwordInput = document.getElementById("password");

    let isValid = true;

    console.log("Contenido de emailInput: " + emailInput.value.trim());
    
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
    
    if (isValid) {
        // Guardar el nombre ingresado en el formulario
        //localStorage.setItem('userName', emailInput.value);
    
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
