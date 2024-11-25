namespace JuntifyApp.Models;

public class Sesion
{
    public static bool EstaLogeado = false;
        public static Usuario userActual = new Usuario();
        public static Planes CreandoPlan;
        public static List<int> idUsuariosPlan = new List<int>();


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
        public static Usuario UsuarioXID(int idUsuario){
            return BD.UsuarioXID(idUsuario);
        }
        public static bool CrearPlan(){
            int idPlan=BD.CrearPlan(CreandoPlan.TipoLugar);
            CreandoPlan.IdPlan=idPlan;
            bool a=idPlan!=-1;
            return a;
        }

        public void AgregarParticipantes(int idPlan){
            if(idUsuariosPlan!=new List<int>()){
                foreach(int participante in idUsuariosPlan){
                    BD.AgregarParticipantePlan(participante,idPlan);
                }
            } else{
                Console.WriteLine("error"); 
            }
    }
    }
