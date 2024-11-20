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
        return View();
    }
    public IActionResult Personalizado(){
        Sesion.IniciarCreacionPlan();
        return View();
    }
    public IActionResult AgregarParticipantes(){
        return View();
    }
    public IActionResult FinalizarPlan(){
        return View();
    }
    public IActionResult PlanCreado(){
        return View("PlanCreado");
    }
    public void TomarParticipantes(string[] participantes){
        
    }
    [HttpGet]
    public List<Usuario> ListaAmigos(){
        Console.WriteLine(Sesion.ListarAmigos(Sesion.userActual.idUsuario));
        return Sesion.ListarAmigos(Sesion.userActual.idUsuario);
    }
    public IActionResult Privacy()
    {
        return View();
    }
    public void InsertarTypeLugar(string type){
        Sesion.CreandoPlan.TipoLugar=type;
        Console.WriteLine(Sesion.CreandoPlan.TipoLugar);
    }
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
