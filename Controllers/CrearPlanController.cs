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

    public IActionResult Privacy()
    {
        return View();
    }
    public JsonResult ObtenerLugares(){
        string[] a ={"hola","como","te","va"};
        return Json(new {Lista=a});
    }
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
