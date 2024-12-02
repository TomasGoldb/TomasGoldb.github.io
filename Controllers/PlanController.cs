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
        return View();
    }
    /*public ActionResult EmpezarVotacion(int idPlan){
        double[] promCoords=Sesion.IniciarVotacion(idPlan);
        ViewBag.coords=promCoords;
        return RedirectToAction("redirect");
    }*/
    public IActionResult EmpezarVotacion(int idPlan){
         ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.logueado=Sesion.EstaLogeado;
        string[] promCoords=Sesion.IniciarVotacion(idPlan);
        ViewBag.coords=promCoords;
        ViewBag.type=BD.PlanXID(idPlan).TipoLugar;
        return View("redirect");
    }
    public IActionResult DashPlan2(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.logueado=Sesion.EstaLogeado;
        return View();
    }
    public ActionResult LugaresElegidos(string id1, string id2, string id3){
        /*falta hacer la logica aca*/
        return IActionResult("DashPlan");
    }
    public IActionResult DashPlan3(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.logueado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult DashPlan4(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.logueado=Sesion.EstaLogeado;
        return View();
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
