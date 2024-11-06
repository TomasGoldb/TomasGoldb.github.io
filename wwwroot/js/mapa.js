
// URL base de la API de Google Maps con parámetros
/*
const url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=ChIJc3ppC2jKvJURyQ3P9zmN-rY&key=AIzaSyC2Sp2t0k8EtGxiJDpcwDmYc_UzML9QIek";

// Realizar la solicitud GET usando fetch
fetch(url)
  .then(response => response.json())  // Convertir la respuesta en JSON
  .then(data => {
    console.log(data);  // Imprimir todo el JSON en la consola
  })
  .catch(error => {
    console.error("Error al realizar la solicitud:", error);
  });
  

*/

// Definir la URL de la API de Google Places
const placeDetailsUrl = "/ejemplo.json";

// Función para obtener los detalles del lugar
async function getPlaceDetails() {
    try {
        const response = await fetch(placeDetailsUrl);
        console.log(response);
        const data = await response.json();

        if (data.status === 'OK') {
            const location = data.result.geometry.location;
            const lat = location.lat;
            const lng = location.lng;

            // Ahora podemos actualizar el mapa con la nueva ubicación y marcador
            actualizarUbicacion();
        } else {
            console.error("Error al obtener detalles del lugar:", data.status);
        }
    } catch (error) {
        console.error("Error en la solicitud:", error);
    }
}

// Función para actualizar el mapa con las coordenadas obtenidas
function updateMap(lat, lng) {
    //const mapElement = document.querySelector('gmp-map');
    const mapElement = document.querySelector('[map-id="mapa"]');
    console.log(mapElement);
    const map = mapElement.getMap ? mapElement.getMap() : null;
    console.log(map);
    if (mapElement ) {
        map = mapElement.getMap()

        // Centrar el mapa en las coordenadas obtenidas
        map.setCenter({ lat, lng });
        map.setZoom(15);  // Ajusta el nivel de zoom

        // Crear un marcador en la ubicación obtenida
        new google.maps.Marker({
            position: { lat, lng },
            map: map,
            title: 'Ubicación del lugar'
        });
    } else {
        console.error('El mapa no está disponible.');
    }

    
    
}

function actualizarUbicacion() {
    // Esperar a que el mapa esté completamente listo
    const mapElement = document.querySelector('[map-id="mapa"]');
  
    // Si el mapa está listo
    mapElement.addEventListener('mapReady', function (event) {
        console.log ("entro");
      const map = event.detail.map; // Obtener el objeto del mapa de Google
      
      // Nueva ubicación
      const nuevaUbicacion = { lat: -34.603684, lng: -58.381559 }; // Buenos Aires
      
      // Cambiar el centro del mapa
      map.setCenter(nuevaUbicacion);
      map.setZoom(12);  // Ajustar el nivel de zoom

      // Agregar un marcador en la nueva ubicación
      const marker = new google.maps.Marker({
        position: nuevaUbicacion,
        map: map,
        title: 'Nueva Ubicación'
      });
    });
  }

// Llamar a la función para obtener los detalles y actualizar el mapa
getPlaceDetails();





/*

// Función para obtener los detalles del lugar desde el backend
function getPlaceDetails(placeId) {
    // Hacemos una solicitud GET a la acción del backend
    fetch(`/GoogleMaps/GetPlaceDetails?placeId=${placeId}`)
        .then(response => response.json())  // Convertimos la respuesta a JSON
        .then(data => {
            if (data.error) {
                console.error("Error:", data.error);
            } else {
                // Mostrar la información del lugar en la consola o en el HTML
                console.log("Detalles del lugar:", data);
                
                const result = JSON.parse(data);  // Parseamos el JSON devuelto
                console.log(result);
                const place = result.result;  // Accedemos al objeto 'result' dentro de la respuesta

                // Mostrar en el HTML
                document.getElementById("placeName").textContent = place.name;
                document.getElementById("placeRating").textContent = `Rating: ${place.rating}`;
                document.getElementById("placePhone").textContent = `Phone: ${place.formatted_phone_number}`;
            }
        })
        .catch(error => {
            console.error("Error al obtener los detalles del lugar:", error);
        });
}

// Llamamos a la función con un ejemplo de placeId
getPlaceDetails("ChIJN1t_tDeuEmsRUsoyG83frY4");
*/