namespace JuntifyApp.Models;

public class Sesion
{
    public static bool EstaLogeado = false;
        public static bool EstaJugando = false;
        public static Usuario userActual = new Usuario();
        public static Planes CreandoPlan;


        public static void SetearSesion(Usuario use){
            userActual = use;
            EstaLogeado = true;
        }

        public static void LogOut(){
            EstaLogeado = false;
            userActual = new Usuario();
        }
        public static void IniciarCreacionPlan(){
            CreandoPlan=new Planes();
        }
        public static List<ResenasXUsuario> ListarResenasUsuario(int idlugar){
            return BD.ListarResenasXLugar(idlugar);
        }
        public static double[] promedioCoordenadas(double[] coordsX, double[] coordsY){
            double sumaX=0, sumaY=0;
            double[] coords={0,0};
            for(int i=0;i<coordsX.Length;i++){
                sumaX+=coordsX[i];
            }
            coords[0]=sumaX/coordsX.Length;
            for(int i=0;i<coordsY.Length;i++){
                sumaY+=coordsY[i];
            }
            coords[1]=sumaY/coordsY.Length;
            return coords;
        }
        public static List<Usuario> ListarAmigos(int idUsuario){
            return BD.ListarAmigos(idUsuario);
        }

    }
