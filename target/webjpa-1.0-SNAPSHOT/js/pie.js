
fetch('pages/footer.html')
.then(response => response.text())
    .then(data => {
        const headerContainer = document.getElementById('footer-container');
        headerContainer.innerHTML = data;
    });