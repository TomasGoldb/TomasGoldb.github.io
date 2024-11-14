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
        return View();
    }
    public IActionResult VerPlan(){
        return View();
    }
    public IActionResult Votar(){
        return View();
    }

    public IActionResult PostVoto(){
        return View();
    }

    public IActionResult DashPlan(){
        return View();
    }
    public IActionResult DashPlan2(){
        return View();
    }
    
    public IActionResult DashPlan3(){
        return View();
    }
    public IActionResult DashPlan4(){
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
