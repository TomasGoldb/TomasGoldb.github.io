namespace JuntifyApp.Models;

public class Sesion
{
    public static bool EstaLogeado = false;
        public static bool EstaJugando = false;
        public static Usuario userActual = new Usuario();
        public static Planes CreandoPlan = new Planes();


        public static void SetearSesion(Usuario use){
            userActual = use;
            EstaLogeado = true;
        }

        public static void LogOut(){
            EstaLogeado = false;
            userActual = new Usuario();
        }
        public static List<ResenasXUsuario> ListarResenasUsuario(int idlugar){
            return BD.ListarResenasXLugar(idlugar);
        }

    }
