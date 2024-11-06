/*
// URL base de la API de Google Maps con parámetros
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
