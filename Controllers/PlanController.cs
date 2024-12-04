using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using JuntifyApp.Models;

namespace JuntifyApp.Controllers;

public class PlanController : Controller
{
    private readonly ILogger<PlanController> _logger;

    public PlanController(ILogger<PlanController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }
     public IActionResult Invitacion()
    {
         ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }
     public IActionResult AceptarPlan(int idPlan, int idNoti)
    {
         ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        ViewBag.idPlan=idPlan;
        ViewBag.Direcciones=Sesion.listarDirecciones(Sesion.userActual.idUsuario);
        Sesion.SacarNotificacion(idNoti);
        return View();
    }
    public IActionResult Unirse(int direccion, int idPlan){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.idPlan=idPlan;
        Sesion.AceptarInvitacion(direccion,idPlan);
        return View();
    }
    public IActionResult VerPlan(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult Votar(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }

    public IActionResult PostVoto(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }

    public IActionResult DashPlan(int idPlan){
        Dictionary<string, string> typeTranslations = new Dictionary<string, string>
        {
            { "accounting", "contabilidad" },
            { "point_of_interest", "punto de interés" },
            { "establishment", "establecimiento" },
            { "airport", "aeropuerto" },
            { "amusement_park", "parque de atracciones" },
            { "aquarium", "acuario" },
            { "art_gallery", "galería de arte" },
            { "atm", "cajero automático" },
            { "bakery", "panadería" },
            { "bank", "banco" },
            { "bar", "bar" },
            { "beauty_salon", "salón de belleza" },
            { "bicycle_store", "tienda de bicicletas" },
            { "book_store", "librería" },
            { "bowling_alley", "bolera" },
            { "bus_station", "estación de autobuses" },
            { "cafe", "cafetería" },
            { "campground", "campamento" },
            { "car_dealer", "concesionario de coches" },
            { "car_rental", "alquiler de coches" },
            { "car_repair", "reparación de coches" },
            { "car_wash", "lavado de coches" },
            { "casino", "casino" },
            { "cemetery", "cementerio" },
            { "church", "iglesia" },
            { "city_hall", "ayuntamiento" },
            { "clothing_store", "tienda de ropa" },
            { "convenience_store", "tienda de conveniencia" },
            { "courthouse", "palacio de justicia" },
            { "dentist", "dentista" },
            { "department_store", "gran almacén" },
            { "doctor", "doctor" },
            { "drugstore", "farmacia" },
            { "electrician", "electricista" },
            { "electronics_store", "tienda de electrónica" },
            { "embassy", "embajada" },
            { "fire_station", "estación de bomberos" },
            { "florist", "floristería" },
            { "funeral_home", "funeraria" },
            { "furniture_store", "tienda de muebles" },
            { "gas_station", "gasolinera" },
            { "gym", "gimnasio" },
            { "hair_care", "cuidado del cabello" },
            { "hardware_store", "ferretería" },
            { "hindu_temple", "templo hindú" },
            { "home_goods_store", "tienda de artículos para el hogar" },
            { "hospital", "hospital" },
            { "insurance_agency", "agencia de seguros" },
            { "jewelry_store", "joyería" },
            { "laundry", "lavandería" },
            { "lawyer", "abogado" },
            { "library", "biblioteca" },
            { "light_rail_station", "estación de tren ligero" },
            { "liquor_store", "licorería" },
            { "local_government_office", "oficina de gobierno local" },
            { "locksmith", "cerrajero" },
            { "lodging", "alojamiento" },
            { "meal_delivery", "entrega de comida" },
            { "meal_takeaway", "comida para llevar" },
            { "mosque", "mezquita" },
            { "movie_rental", "alquiler de películas" },
            { "movie_theater", "cine" },
            { "moving_company", "empresa de mudanzas" },
            { "museum", "museo" },
            { "night_club", "club nocturno" },
            { "painter", "pintor" },
            { "park", "parque" },
            { "parking", "estacionamiento" },
            { "pet_store", "tienda de mascotas" },
            { "pharmacy", "farmacia" },
            { "physiotherapist", "fisioterapeuta" },
            { "plumber", "plomero" },
            { "police", "policía" },
            { "post_office", "oficina de correos" },
            { "primary_school", "escuela primaria" },
            { "real_estate_agency", "agencia inmobiliaria" },
            { "restaurant", "restaurante" },
            { "roofing_contractor", "contratista de techos" },
            { "rv_park", "parque para casas rodantes" },
            { "school", "escuela" },
            { "secondary_school", "escuela secundaria" },
            { "shoe_store", "zapatería" },
            { "shopping_mall", "centro comercial" },
            { "spa", "spa" },
            { "stadium", "estadio" },
            { "storage", "almacenamiento" },
            { "store", "tienda" },
            { "subway_station", "estación de metro" },
            { "supermarket", "supermercado" },
            { "synagogue", "sinagoga" },
            { "taxi_stand", "parada de taxis" },
            { "tourist_attraction", "atracción turística" },
            { "train_station", "estación de tren" },
            { "transit_station", "estación de transporte" },
            { "travel_agency", "agencia de viajes" },
            { "university", "universidad" },
            { "veterinary_care", "cuidado veterinario" },
            { "zoo", "zoológico" }
        };
        string tipominu=typeTranslations[Sesion.CreandoPlan.TipoLugar];
        tipominu=char.ToUpper(tipominu[0]) + tipominu.Substring(1);
        ViewBag.preferencia=tipominu;
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        Planes plan = BD.PlanXID(idPlan);
        ViewBag.Plan=plan;
        List<Usuario> participantes=Sesion.ListarParticipantesPlan(idPlan);
        ViewBag.Participantes=participantes;
        //ViewBag.tieneDireccion=Sesion.TieneDireccion(idPlan);
        ViewBag.yo=Sesion.ParticipanteYo(idPlan);
        ViewBag.estadoPlan=plan.IdEstado;
        return View();
    }
    public IActionResult CerrarPlan(int idPlan){
        BD.SacarNoUnidos(idPlan);
        Sesion.CambiarEstadoPlan(idPlan, 3);
         ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.logueado=Sesion.EstaLogeado;
        string[] promCoords=Sesion.IniciarVotacion(idPlan);
        ViewBag.coords=promCoords;
        ViewBag.type=BD.PlanXID(idPlan).TipoLugar;
        ViewBag.idPlan=idPlan;
        return View("redirect");
    }
    /*public ActionResult EmpezarVotacion(int idPlan){
        double[] promCoords=Sesion.IniciarVotacion(idPlan);
        ViewBag.coords=promCoords;
        return RedirectToAction("redirect");
    }*/
    public ActionResult EmpezarVotacion(int idPlan){
         ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.logueado=Sesion.EstaLogeado;
        Sesion.CambiarEstadoPlan(idPlan, 2);

        /*lo de mandar notis para votar*/

        return RedirectToAction("DashPlan");
    }
    public ActionResult LugaresElegidos(int idPlan, string id1, string id2, string id3){
        string lugares=id1+"/"+id2+"/"+id3;
        BD.IngresarOpcionesVotacion(idPlan,lugares);
        return RedirectToAction("DashPlan");
    }


    public IActionResult Privacy()
    {
        return View();
    }
    
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
