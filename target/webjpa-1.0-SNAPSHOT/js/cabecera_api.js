fetch('../pages/header.html')
    .then(response => response.text())
        .then(data => {
            const headerContainer = document.getElementById('header-container');
            headerContainer.innerHTML = data;
        });

