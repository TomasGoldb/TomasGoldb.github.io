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

const verMas = (num) => {
    const textoAdicionalElement = document.getElementById('textoAdicional'+num);
    let verMasBoton=document.getElementById("verMasBtn"+num);
    if (textoAdicionalElement.style.display === 'none') {
        textoAdicionalElement.style.display = 'inline';
        verMasBoton.textContent = 'Ver menos';
    } else {
        textoAdicionalElement.style.display = 'none';
        verMasBoton.textContent = 'Ver más';
    }

}
function mostrarEstrellas(calificacion, id) {
    const contenedor = document.getElementsByClassName("rating"+id);
    contenedor.innerHTML = ' '; // Limpiar contenido previo

    // Número de estrellas completas
    const estrellasCompletas = Math.floor(calificacion);
    // El decimal restante para las estrellas parciales
    const decimal = calificacion % 1;

    // Mostrar estrellas completas
    for (let i = 0; i < estrellasCompletas; i++) {
        const star = document.createElement('div');
        star.classList.add('star', 'filled');
        contenedor.appendChild(star);
    }

    // Mostrar estrella parcial dependiendo del decimal
    if (decimal >= 0.75) {
        const star = document.createElement('div');
        star.classList.add('star', 'partial-3'); // 3/4 llena
        contenedor.appendChild(star);
    } else if (decimal >= 0.5) {
        const star = document.createElement('div');
        star.classList.add('star', 'partial-2'); // 1/2 llena
        contenedor.appendChild(star);
    } else if (decimal >= 0.25) {
        const star = document.createElement('div');
        star.classList.add('star', 'partial-1'); // 1/4 llena
        contenedor.appendChild(star);
    }

    // Mostrar estrellas vacías restantes
    const estrellasFaltantes = 5 - Math.ceil(calificacion); 
    for (let i = 0; i < estrellasFaltantes; i++) {
        const star = document.createElement('div');
        star.classList.add('star');
        contenedor.appendChild(star);
    }
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
            console.log(place);
            resultDiv.innerHTML = `
                <h2>${place.name}</h2>
                <p><strong>Dirección:</strong> ${place.formatted_address || 'No disponible'}</p>
                <p><strong>Teléfono:</strong> ${place.formatted_phone_number || 'No disponible'}</p>
                <p><strong>Reviews</strong> ${place.reviews || 'No disponible'}</p>
                <p><strong>Calificación:</strong> ${place.rating || 'No disponible'} (${place.user_ratings_total || 0} reseñas)</p>
                <p><strong>Sitio web:</strong> ${place.website ? `<a href="${place.website}" target="_blank">${place.website}</a>` : 'No disponible'}</p>
            `;
            let reviews=document.getElementById("reviews");
            

            for(let i=0;i<place.reviews.length;i++){
                let revi=`
                <div class="review">
                    <div class= "container-foto-user">
                        <div class="avatar">
                                <img class="imagenPerfil" src="${place.reviews[i].profile_photo_url}">
                                <p class="user-nombre"><b>${place.reviews[i].author_name}</b></p>
                        </div>
                        <div class="rating${i}"></div>
                        `;


                       

            const textoCompleto = place.reviews[i].text;
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
            if(textoCompleto.length >= longitudVisible){
             revi += "<p>"+textoVisible + '<span id="textoAdicional'+i+'" style="display:none;">' + textoAdicional + '</span>'+"</p>";
             revi+=`
                        <a id="verMasBtn${i}" class="ver-mas" onclick="verMas(${i})">Ver más...</a> `
            }else{
                revi += "<p>"+textoCompleto +"</p>";
            }
            
            






                revi+=`

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




/*

const request = {
    location: map.getCenter(),
    radius: 5000, // Radio de búsqueda en metros
    type: [tipoLugar.toLowerCase()] // Convertir a minúsculas, como "restaurant"
};

*/