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
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult Personalizado(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        Sesion.IniciarCreacionPlan();
        return View();
    }
    public IActionResult AgregarParticipantes(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        return View();
    }
     public IActionResult Amigos(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
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
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult PlanCreado(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        if(Sesion.idUsuariosPlan.Count==0){

        } else{
        return View("PlanCreado");
        }
    }
    public void TomarParticipantes(string[] participantes){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
    }
    [HttpGet]
    public List<Usuario> ListaAmigos(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
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
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        Sesion.CreandoPlan.TipoLugar=type;
    }
    public void IngresarParticipantes(List<int> idUsuarios){
        Console.WriteLine(idUsuarios[0]);
        Sesion.idUsuariosPlan=idUsuarios;
    }
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        ViewBag.logeado=Sesion.EstaLogeado;
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
