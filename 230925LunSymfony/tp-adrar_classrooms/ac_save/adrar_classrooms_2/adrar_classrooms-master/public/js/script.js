function showCourseForm(action) {
    document.getElementById('courseForm').style.display = 'block';
    document.getElementById('courseName').value = '';
}

function saveCourse() {
    var courseName = document.getElementById('courseName').value;
    // Envoyer les données à votre backend pour l'ajout ou la mise à jour dans la base de données
    // ...
    // Après la sauvegarde, rafraîchir la liste des cours depuis la base de données
    // ...
    hideCourseForm();
}

function hideCourseForm() {
    document.getElementById('courseForm').style.display = 'none';
}

function showUserForm(action) {
    document.getElementById('userForm').style.display = 'block';
    document.getElementById('userName').value = '';
}

function saveUser() {
    var userName = document.getElementById('userName').value;
    // Envoyer les données à votre backend pour l'ajout ou la mise à jour dans la base de données
    // ...
    // Après la sauvegarde, rafraîchir la liste des utilisateurs depuis la base de données
    // ...
    hideUserForm();
}

function hideUserForm() {
    document.getElementById('userForm').style.display = 'none';
}

// Chargement initial des données depuis la base de données
// ...
