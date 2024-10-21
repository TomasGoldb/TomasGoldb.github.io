namespace JuntifyApp.Models;

public class Sesion
{
    public static bool EstaLogeado = false;
        public static bool EstaJugando = false;
        public static Usuario userActual = new Usuario();


        public static void SetearSesion(Usuario use){
            userActual = use;
            EstaLogeado = true;
        }

        public static void LogOut(){
            EstaLogeado = false;
            userActual = new Usuario();
        }

    }
