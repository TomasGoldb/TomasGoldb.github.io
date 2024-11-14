// Esta función se ejecutará cuando la API se haya cargado correctamente
function initMap() {
    // Asegurarnos de que el objeto google esté disponible
    if (typeof google === "undefined" || !google.maps) {
        console.error("La API de Google Maps no se ha cargado correctamente.");
        return;
    }

    // Crear un mapa invisible solo para inicializar el servicio de lugares
    const map = new google.maps.Map(document.createElement('div')); 

    // Inicializar el servicio de lugares
    placeService = new google.maps.places.PlacesService(map);
    console.log('El servicio de lugares está disponible:', placeService); // Verificación en consola
}

function fetchPlaceDetails(placeId) {
    if (!placeService) {
        console.error("El servicio de lugares no está disponible.");
        return;
    }

    const request = {
        placeId: placeId
    };

    // Realizar la solicitud para obtener detalles del lugar
    placeService.getDetails(request, (place, status) => {
        const resultDiv = document.getElementById('result');
        if (status === google.maps.places.PlacesServiceStatus.OK) {
            resultDiv.innerHTML = `
                <h2>${place.name}</h2>
                <p><strong>Dirección:</strong> ${place.formatted_address || 'No disponible'}</p>
                <p><strong>Teléfono:</strong> ${place.formatted_phone_number || 'No disponible'}</p>
                <p><strong>Reviews</strong> ${place.reviews || 'No disponible'}</p>
                <p><strong>Calificación:</strong> ${place.rating || 'No disponible'} (${place.user_ratings_total || 0} reseñas)</p>
                <p><strong>Sitio web:</strong> ${place.website ? `<a href="${place.website}" target="_blank">${place.website}</a>` : 'No disponible'}</p>
            `;
            let reviews=document.getElementById("reviews");
            


            const textoCompleto = "Este es el texto completo que queremos mostrar. Aquí hay más información que será visible solo al hacer clic en el botón 'Ver más'.";
            const longitudVisible = 100; // Número máximo de caracteres a mostrar inicialmente
            
            // Función para obtener el texto visible sin cortar palabras
            function obtenerTextoVisible(texto, longitud) {
                if (texto.length <= longitud) return texto; // Si el texto es más corto, devuélvelo todo
                
                let puntoCorte = texto.lastIndexOf(' ', longitud); // Encuentra el último espacio antes de la longitud
                return puntoCorte > 0 ? texto.substring(0, puntoCorte) : texto.substring(0, longitud); // Devuelve el texto hasta el último espacio
            }
            
            // Divide el texto en partes
            const textoVisible = obtenerTextoVisible(textoCompleto, longitudVisible);
            const textoAdicional = textoCompleto.substring(textoVisible.length);
            
            // Muestra la parte visible y oculta el resto
            document.getElementById('texto').innerHTML = textoVisible + '<span id="textoAdicional" style="display:none;">' + textoAdicional + '</span>';
            
            document.getElementById('verMasBtn').addEventListener('click', function() {
                const textoAdicionalElement = document.getElementById('textoAdicional');
                if (textoAdicionalElement.style.display === 'none') {
                    textoAdicionalElement.style.display = 'inline';
                    this.textContent = 'Ver menos';
                } else {
                    textoAdicionalElement.style.display = 'none';
                    this.textContent = 'Ver más';
                }
            });






            for(let i=0;i<place.reviews.length;i++){
                let revi=`
                <div class="review">
                    <div class= "container-foto-user">
                        <div class="avatar">
                                <img class="imagenPerfil" src="${place.reviews[i].profile_photo_url}">
                                <p class="user-nombre"><b>${place.reviews[i].author_name}</b></p>
                        </div>
                        <div class="rating">
                       
                        </div>
                    </div>
                    <div class="review-content">
                        <p id="texto">${place.reviews[i].text}</p>
                        <a id="verMasBtn" href="#">Ver más...</a> 
                        
                    </div>
                
                </div>
                `;
                reviews.innerHTML+=revi;
                console.log(revi);
            }
        } else {
            resultDiv.innerHTML = '<p class="error">No se pudo obtener los detalles del lugar. Estado: ' + status + '</p>';
        }

        // Limpiar resultados
        document.getElementById('predictions').innerHTML = '';
        document.getElementById('placeInput').value = '';
    });
    

    // Ejecutamos la función de ejemplo después de que la API de Google Maps esté cargada
    function testPlaceDetails() {
        fetchPlaceDetails("ChIJc3ppC2jKvJURyQ3P9zmN-rY");
    }

    // Esperamos a que la API cargue para ejecutar la prueba
    window.onload = function () {
        setTimeout(testPlaceDetails, 2000);  // Intentamos después de 2 segundos para asegurarnos de que la API esté lista
    }
}
