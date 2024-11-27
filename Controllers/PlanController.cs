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
     public IActionResult AceptarPlan(int idPlan)
    {
         ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        ViewBag.idPlan=idPlan;
        ViewBag.Direcciones=Sesion.listarDirecciones(Sesion.userActual.idUsuario);
        return View();
    }
    public IActionResult Unirse(int direccion, int idPlan){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
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
        return View();
    }
    public ActionResult EmpezarVotacion(){
        
        return RedirectToAction("DashPlan2");
    }
    public IActionResult DashPlan2(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }
    
    public IActionResult DashPlan3(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult DashPlan4(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
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
