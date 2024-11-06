// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

// Toggle para el menú desplegable de "Crear Plan"
function toggleDropdown() {
    var menu = document.getElementById("dropdownMenu");
    menu.style.display = menu.style.display === "block" ? "none" : "block";
}

// Toggle para el menú de notificaciones
function toggleNotificationMenu() {
    var menu = document.getElementById("notificationMenu");
    menu.style.display = menu.style.display === "block" ? "none" : "block";
}

// Cierra los menús si el usuario hace clic fuera de ellos
window.onclick = function(event) {
    if (!event.target.matches('.dropdown-button') && !event.target.matches('.icono-notificacion')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        for (var i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.style.display === "block") {
                openDropdown.style.display = "none";
            }
        }
        
        var notifications = document.getElementsByClassName("notification-content");
        for (var j = 0; j < notifications.length; j++) {
            var openNotification = notifications[j];
            if (openNotification.style.display === "block") {
                openNotification.style.display = "none";
            }
        }
    }
}
