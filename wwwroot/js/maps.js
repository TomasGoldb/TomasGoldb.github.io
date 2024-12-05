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

const typeTranslations = {
    accounting: "contabilidad",
    point_of_interest: "punto de interés",
    establishment: "establecimiento",
    airport: "aeropuerto",
    amusement_park: "parque de atracciones",
    aquarium: "acuario",
    art_gallery: "galería de arte",
    atm: "cajero automático",
    bakery: "panadería",
    bank: "banco",
    bar: "bar",
    beauty_salon: "salón de belleza",
    bicycle_store: "tienda de bicicletas",
    book_store: "librería",
    bowling_alley: "bolera",
    bus_station: "estación de autobuses",
    cafe: "cafetería",
    campground: "campamento",
    car_dealer: "concesionario de coches",
    car_rental: "alquiler de coches",
    car_repair: "reparación de coches",
    car_wash: "lavado de coches",
    casino: "casino",
    cemetery: "cementerio",
    church: "iglesia",
    city_hall: "ayuntamiento",
    clothing_store: "tienda de ropa",
    convenience_store: "tienda de conveniencia",
    courthouse: "palacio de justicia",
    dentist: "dentista",
    department_store: "gran almacén",
    doctor: "doctor",
    drugstore: "farmacia",
    electrician: "electricista",
    electronics_store: "tienda de electrónica",
    embassy: "embajada",
    fire_station: "estación de bomberos",
    florist: "floristería",
    funeral_home: "funeraria",
    furniture_store: "tienda de muebles",
    gas_station: "gasolinera",
    gym: "gimnasio",
    hair_care: "cuidado del cabello",
    hardware_store: "ferretería",
    hindu_temple: "templo hindú",
    home_goods_store: "tienda de artículos para el hogar",
    hospital: "hospital",
    insurance_agency: "agencia de seguros",
    jewelry_store: "joyería",
    laundry: "lavandería",
    lawyer: "abogado",
    library: "biblioteca",
    light_rail_station: "estación de tren ligero",
    liquor_store: "licorería",
    local_government_office: "oficina de gobierno local",
    locksmith: "cerrajero",
    lodging: "alojamiento",
    meal_delivery: "entrega de comida",
    meal_takeaway: "comida para llevar",
    mosque: "mezquita",
    movie_rental: "alquiler de películas",
    movie_theater: "cine",
    moving_company: "empresa de mudanzas",
    museum: "museo",
    night_club: "club nocturno",
    painter: "pintor",
    park: "parque",
    parking: "estacionamiento",
    pet_store: "tienda de mascotas",
    pharmacy: "farmacia",
    physiotherapist: "fisioterapeuta",
    plumber: "plomero",
    police: "policía",
    post_office: "oficina de correos",
    primary_school: "escuela primaria",
    real_estate_agency: "agencia inmobiliaria",
    restaurant: "restaurante",
    roofing_contractor: "contratista de techos",
    rv_park: "parque para casas rodantes",
    school: "escuela",
    secondary_school: "escuela secundaria",
    shoe_store: "zapatería",
    shopping_mall: "centro comercial",
    spa: "spa",
    stadium: "estadio",
    storage: "almacenamiento",
    store: "tienda",
    subway_station: "estación de metro",
    supermarket: "supermercado",
    synagogue: "sinagoga",
    taxi_stand: "parada de taxis",
    tourist_attraction: "atracción turística",
    train_station: "estación de tren",
    transit_station: "estación de transporte",
    travel_agency: "agencia de viajes",
    university: "universidad",
    veterinary_care: "cuidado veterinario",
    zoo: "zoológico"
  };

  
function fetchPlaceDetails(placeId) {
    if (!placeService) {
        console.error("El servicio de lugares no está disponible.");
        return;
    }

    const request = {
        placeId: placeId
    };
    let mapa=document.getElementById("iframeMapa");
    mapa.src="https://www.google.com/maps/embed/v1/place?key=AIzaSyC2Sp2t0k8EtGxiJDpcwDmYc_UzML9QIek&q=place_id:"+placeId;
    // Realizar la solicitud para obtener detalles del lugar
    placeService.getDetails(request, (place, status) => {
        const resultDiv = document.getElementById('result');
        console.log(place);
        document.getElementById("direccion").innerHTML+=place.formatted_address;
        if (status === google.maps.places.PlacesServiceStatus.OK) {
            
            document.getElementById("nombre").innerHTML=place.name;
            let reviews=document.getElementById("reviews");
            

            for(let i=0;i<place.reviews.length;i++){
                let revi=`
                <div class="review">
                    <div class= "container-foto-user">
                        <div class="avatar">
                                <img class="imagenPerfil" src=${place.reviews[i].profile_photo_url}>
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
            let tiposEspañol=[];
            place.types.forEach((tipo)=>{
                tiposEspañol.push(typeTranslations[tipo]);
            });
            let pTipos=document.getElementById("types-lugar");
                let tipos=tiposEspañol.join(", ");;
                pTipos.innerHTML+=tipos;
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