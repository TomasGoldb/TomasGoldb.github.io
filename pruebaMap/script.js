// Hacemos el fetch del archivo JSON local
fetch('ejemplo.json')  // Ruta del archivo JSON
  .then(response => {
    if (!response.ok) {
        throw new Error('Error en la carga del archivo JSON');
    }
    return response.json();  // Parseamos la respuesta como JSON
  }).then(data =>{
    console.log(data);
  });