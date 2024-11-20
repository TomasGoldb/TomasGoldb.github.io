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
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult VerPlan(){
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult Votar(){
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }

    public IActionResult PostVoto(){
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }

    public IActionResult DashPlan(){
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult DashPlan2(){
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }
    
    public IActionResult DashPlan3(){
        ViewBag.EstaLogeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult DashPlan4(){
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
