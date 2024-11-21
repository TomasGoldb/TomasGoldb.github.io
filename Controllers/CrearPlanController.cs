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
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult Personalizado(){
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        Sesion.IniciarCreacionPlan();
        return View();
    }
    public IActionResult AgregarParticipantes(){
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult FinalizarPlan(){
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        List<int> ides = Sesion.idUsuariosPlan;
        List<Usuario> listaParticipantes=new List<Usuario>();
        for(int i=0;i<ides.Count;i++){
            listaParticipantes[i]=Sesion.UsuarioXID(Sesion.idUsuariosPlan[i]);
        }
        ViewBag.ListaParticipantes=listaParticipantes;
        return View();
    }
    public IActionResult PlanCreado(){
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View("PlanCreado");
    }
    public void TomarParticipantes(string[] participantes){
        
    }
    [HttpGet]
    public List<Usuario> ListaAmigos(){
        Console.WriteLine(Sesion.ListarAmigos(Sesion.userActual.idUsuario));
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return Sesion.ListarAmigos(Sesion.userActual.idUsuario);
    }
    public IActionResult Privacy()
    {
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }
    public void InsertarTypeLugar(string type){
        Sesion.CreandoPlan.TipoLugar=type;
    }
    public void IngresarParticipantes(List<int> idUsuarios){
        Sesion.idUsuariosPlan=idUsuarios;
    }
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
