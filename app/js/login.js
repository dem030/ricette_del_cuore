// Selezione degli elementi
const loginContainer = document.querySelector('.login-container');
const signupContainer = document.querySelector('.signup-container');
const showLogin = document.getElementById('showlogin');
const showSignup = document.getElementById('showSignup');

// Mostra il modulo di login
showLogin.addEventListener('click', (e) => {
    e.preventDefault(); // Previene il comportamento predefinito del link
    signupContainer.style.display = 'none'; // Nasconde il signup
    loginContainer.style.display = 'block'; // Mostra il login
    loginContainer.style.opacity = '1'; // Garantisce la visibilità
});
showSignup.addEventListener('click', (e) => {
    e.preventDefault();
    loginContainer.style.display = 'none';
    signupContainer.style.display = 'block';
    signupContainer.style.opacity = '1';
});


// Animazione al clic sui pulsanti
const buttons = document.querySelectorAll('button');
buttons.forEach((button) => {
    button.addEventListener('mousedown', () => {
        button.style.transform = 'scale(0.95)';
        button.style.transition = 'transform 0.2s';
    });
    button.addEventListener('mouseup', () => {
        button.style.transform = 'scale(1)';
    });
    button.addEventListener('mouseleave', () => {
        button.style.transform = 'scale(1)';
    });
});
