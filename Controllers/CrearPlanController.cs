using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using JuntifyApp.Models;

namespace JuntifyApp.Controllers;

public class CrearPlanController : Controller
{
    private readonly ILogger<CrearPlanController> _logger;

    public CrearPlanController(ILogger<CrearPlanController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult Personalizado(){
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        Sesion.IniciarCreacionPlan();
        return View();
    }
    public IActionResult AgregarParticipantes(){
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult FinalizarPlan(){
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult PlanCreado(){
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        return View("PlanCreado");
    }
    public void TomarParticipantes(string[] participantes){
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
    }
    [HttpGet]
    public List<Usuario> ListaAmigos(){
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        Console.WriteLine(Sesion.ListarAmigos(Sesion.userActual.idUsuario));
        ViewBag.logeado=Sesion.EstaLogeado;
        return Sesion.ListarAmigos(Sesion.userActual.idUsuario);
    }
    public IActionResult Privacy()
    {
        ViewBag.logeado=Sesion.EstaLogeado;
        return View();
    }
    public void InsertarTypeLugar(string type){
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        Sesion.CreandoPlan.TipoLugar=type;
        Console.WriteLine(Sesion.CreandoPlan.TipoLugar);
    }
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        ViewBag.logeado=Sesion.EstaLogeado;
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
