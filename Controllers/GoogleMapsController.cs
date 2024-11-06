using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using JuntifyApp.Models;

namespace JuntifyApp.Controllers;
public class GoogleMapsController : Controller
{
    // Tu clave de API de Google (reemplázala con tu propia clave)
    private const string ApiKey = "AIzaSyC2Sp2t0k8EtGxiJDpcwDmYc_UzML9QIek";

    // Acción para obtener los detalles del lugar desde la API de Google
    [HttpGet]
    public async Task<IActionResult> GetPlaceDetails(string placeId)
    {
        // URL de la API de Google
        string url = $"https://maps.googleapis.com/maps/api/place/details/json?fields=name,rating,formatted_phone_number&place_id={placeId}&key={ApiKey}";

        using (HttpClient client = new HttpClient())
        {
            // Realizamos la solicitud GET a la API de Google
            HttpResponseMessage response = await client.GetAsync(url);

            if (response.IsSuccessStatusCode)
            {
                // Leemos la respuesta como cadena
                string content = await response.Content.ReadAsStringAsync();

                // Devolvemos el contenido JSON (sin necesidad de JsonRequestBehavior)
                return Content(content, "application/json");  // Esto devuelve la respuesta JSON
            }
            else
            {
                // Si no se pudo obtener la información, devolvemos un error JSON
                return Json(new { error = "No se pudo obtener la información del lugar." });
            }
        }
    }
}
