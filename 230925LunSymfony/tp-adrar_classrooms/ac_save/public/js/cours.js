let coursButtons = document.querySelectorAll(".cours");

coursButtons.forEach(function (button) {
    button.addEventListener("click", function () {
        // Réinitialisez la couleur de tous les boutons
        coursButtons.forEach(function (btn) {
            btn.style.backgroundColor = ''; // Réinitialise la couleur
        });

        // Appliquez la couleur verte au bouton cliqué
        button.style.backgroundColor = 'green';
    });
});
