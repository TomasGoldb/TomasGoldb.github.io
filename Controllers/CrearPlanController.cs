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
    
    public IActionResult FinalizarPlan(){
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        int[] ides = Sesion.idUsuariosPlan;
        List<Usuario> listaParticipantes=new List<Usuario>();
        for(int i=0;i<ides.Length;i++){
            listaParticipantes.Add(Sesion.UsuarioXID(ides[i]));
        }
        ViewBag.ListaParticipantes=listaParticipantes;
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.preferencia=Sesion.CreandoPlan.TipoLugar;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult PlanCreado(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;

        bool seCreo=Sesion.CrearPlan();
        if(seCreo){
            Sesion.AgregarParticipantes(Sesion.CreandoPlan.IdPlan);
        }
        //if(Sesion.idUsuariosPlan.Length=0){
        //    return View("index");
        //} else{
        return View("PlanCreado");
        //}
    }
    public void TomarParticipantes(string[] participantes){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
    }
    [HttpPost]

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

    public string IngresarParticipantes(string idUsuarios){
        Console.WriteLine(idUsuarios);
        string[] idUsuariosStr=idUsuarios.Split(",");
        int[] idUsuariosInt=new int[idUsuariosStr.Length];
        for(int i=0;i<idUsuariosStr.Length;i++){
            idUsuariosInt[i]=int.Parse(idUsuariosStr[i]);
        }
        Sesion.idUsuariosPlan=idUsuariosInt;
        return "A";
    }
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        ViewBag.logeado=Sesion.EstaLogeado;
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
