using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using JuntifyApp.Models;

namespace JuntifyApp.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private IWebHostEnvironment Environment;

    public HomeController(ILogger<HomeController> logger, IWebHostEnvironment environment)
    {
        _logger = logger;
        Environment=environment;
    } 

    public IActionResult Index()
    {
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.logeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult AboutUs()
    {
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        return View();
    }
    public IActionResult EliminarAmigo(){
        return View("Amigos");
    }
    public IActionResult Amigos(){
        List<Usuario> ListaAmigos=BD.ListarAmigos(Sesion.userActual.idUsuario);
        ViewBag.CantAmigos=ListaAmigos.Count();
        ViewBag.Amigos=ListaAmigos;
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.logeado=Sesion.EstaLogeado;
        return View();
    }
    //Login y registro
    public IActionResult register()
    {
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.logeado = Sesion.EstaLogeado;
        
        return View();
    }
    [HttpPost]
    public IActionResult RegistrarUsuario(string nombre, string nick, string mail, string confirmaContra, string contra){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.logeado = Sesion.EstaLogeado;
        bool coincide=false;
        if (contra==confirmaContra){
            Usuario user = new Usuario(nombre,nick,contra,mail);
            List<Usuario> usuarios=BD.Seleccionar("SP_ListarUsuarios");
            foreach(Usuario usu in usuarios){
                if(usu.Nick==user.Nick||usu.GetMail()==user.GetMail()){
                    coincide=true;
                } 
            }
            if (!coincide){
                ViewBag.error="";
                user.idUsuario = BD.CrearUsuario(user);
                Sesion.SetearSesion(user);  
                return RedirectToAction("Home");
            } else{
                ViewBag.error=FormatearError("ERROR_001_YaExisteNickoMail");
                return View("register");
            }
        } else{
            ViewBag.error=FormatearError("ERROR_002_ContraNoCoincide");
            return View("register");
        }
        
    }
    public IActionResult AgregarDireccion(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.logeado = Sesion.EstaLogeado;
        return View();
    }
    public ActionResult Direccion(string nombre, string direccion, string coordenadas){
        BD.AgregarDireccion(Sesion.userActual.idUsuario,nombre,direccion,coordenadas);
        return RedirectToAction("Home");
    }
    public IActionResult IniciarSesion(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.logeado=Sesion.EstaLogeado;
        return View("IniciarSesion");
    }
    public IActionResult LogearUsuario(string mail, string contra){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        bool coincide=false;
        List<Usuario> usuarios=BD.Seleccionar("SP_ListarUsuarios");
        foreach(Usuario usu in usuarios){
            if(usu.GetMail()==mail){
                coincide=true;  
            } 
        }
        if(coincide){
            if(contra==BD.SeleccionarXMail($"SP_ListarUsuariosXMail", mail)[0].GetContrasena()){
                Sesion.SetearSesion(BD.SeleccionarXMail($"SP_ListarUsuariosXMail", mail)[0]);
                ViewBag.logeado=Sesion.EstaLogeado;
                ViewBag.usuario=BD.SeleccionarXMail($"SP_ListarUsuariosXMail", mail)[0];
                return RedirectToAction("Home");
            }else{
                ViewBag.error=FormatearError("ERROR_003_ContraIncorrecta");
                Console.WriteLine("HOLA");
                return View("login");
            }
        } else{
            ViewBag.error=FormatearError("ERROR_005_MailIncorrecto");
            Console.WriteLine("CHAU");
            return View("login");
        }
    }
    public IActionResult ConfigurarPerfil(){
        ViewBag.Nick=Sesion.userActual.Nick;
        ViewBag.Biografia=Sesion.userActual.Biografia;
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.logeado=Sesion.EstaLogeado;
        return View();
        
    }
    public IActionResult Perfil(){
        ViewBag.Direcciones=BD.ListarDirecciones(Sesion.userActual.idUsuario);
        ViewBag.Biografia=Sesion.userActual.Biografia;
        ViewBag.Nick=Sesion.userActual.Nick;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.IdUsuario=Sesion.userActual.idUsuario;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        return View();
    }
    public IActionResult ActualizarUsuario(IFormFile archivo, string nombre, string nick, string biografia){
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        bool seCambio=Sesion.userActual.CambiarFoto(archivo, Environment);
        string foto=Sesion.userActual.FotoPerfil;
        Usuario.ActualizarPerfilUsuario(nombre, nick, biografia, foto);
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        if(seCambio){
            
            return RedirectToAction("Home");
        }else{
            ViewBag.error=FormatearError("ERROR_004_SinArchivo");
            return View("setearfotoperfil");
        }
        
    }
    private string FormatearError(string error)
    {
        Dictionary<string, string> ErroresAMensajes = new();
        ErroresAMensajes["ERROR_001_YaExisteNickoMail"] = "Ya existe un usuario con ese nick o mail.";
        ErroresAMensajes["ERROR_002_ContraNoCoincide"] = "Las contraseñas no coinciden.";
        ErroresAMensajes["ERROR_003_ContraIncorrecta"] = "La contraseña es incorrecta.";
        ErroresAMensajes["ERROR_004_SinArchivo"] = "No has ingresado ningún archivo!";
        ErroresAMensajes["ERROR_005_MailIncorrecto"] = "El mail ingresado es incorrecto.";

        string mensaje = ErroresAMensajes[error];

        return "<div class='alert alert-danger alert-dismissible' role='alert'><div>"+ mensaje + "</div>   <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>";
    }
    //Fin login y registro

    public IActionResult Home(){
        ViewBag.FotoUsuario=Sesion.userActual.FotoPerfil;
        ViewBag.logeado=Sesion.EstaLogeado;
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        return View("Home");
    }
    public IActionResult PruebaMaps(){
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        return View();
    }

    public IActionResult CrearPlan(){
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;        
        ViewBag.logeado=Sesion.EstaLogeado;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        return View();
    }

    public IActionResult DetalleLugar(string idLugarMaps){
        ViewBag.NombreUsuario=Sesion.userActual.Nombre;
        ViewBag.logeado=Sesion.EstaLogeado;
        ViewBag.Notificaciones=BD.ListarNotis(Sesion.userActual.idUsuario);
        ViewBag.idLugarMaps=idLugarMaps;
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
