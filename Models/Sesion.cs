using System.Collections.Generic;
using System.Globalization;

namespace JuntifyApp.Models;

public class Sesion
{
    public static bool EstaLogeado = false;
        public static Usuario userActual = new Usuario();
        public static Planes CreandoPlan;
        public static int[] idUsuariosPlan;


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
            List<Usuario> amigos =BD.ListarAmigos(idUsuario);
            List<Usuario> amigosSinYo = new List<Usuario>();
            foreach(Usuario user in amigos){
                if(user.idUsuario!=userActual.idUsuario){
                    amigosSinYo.Add(user);
                }
            }
            return amigosSinYo;
        }
        public static Usuario UsuarioXID(int idUsuario){
            return BD.UsuarioXID(idUsuario);
        }
        public static bool CrearPlan(){
            int idPlan=BD.CrearPlan(CreandoPlan.TipoLugar, Sesion.userActual.idUsuario);
            CreandoPlan.IdPlan=idPlan;
            BD.AceptarInvitacion(userActual.idUsuario,CreandoPlan.IdPlan);
            bool a=idPlan!=-1;
            return a;
        }

        public static void AgregarParticipantes(int idPlan){
            if(idUsuariosPlan.Length!=0){
                foreach(int participante in idUsuariosPlan){
                    BD.AgregarParticipantePlan(participante,idPlan);
                    int idNoti=AgregarNotificacion(participante);
                    BD.AgregarTextoNoti(idNoti, $"¡{Sesion.userActual.Nombre} te ha invitado a unite a su plan! <a href='/Plan/AceptarPlan?idPlan={idPlan}&idNoti={idNoti}'>Ver plan</a>");
                }
            } else{
                Console.WriteLine("error"); 
            }
    }
    public static void SacarNotificacion(int idNoti){
        BD.SacarNoti(idNoti);
    }
    
        public static List<Usuario> ListarParticipantesPlan(int idPlan){
            return BD.ListarParticipantes(idPlan);
        }
        public static int AgregarNotificacion(int idUsuario){
            return BD.AgregarNoti(idUsuario);

        }
        public static List<Direcciones> listarDirecciones(int idUsuario){
            return BD.ListarDirecciones(idUsuario);
        }
        public static void AceptarInvitacion(int direccion, int idPlan){
            BD.AgregarDireccionPlan(userActual.idUsuario,direccion,idPlan);
            BD.AceptarInvitacion(userActual.idUsuario,idPlan);
        }
        public static string[] IniciarVotacion(int idPlan){
            BD.CambiarEstadoPlan(idPlan, 2);
            List<string> coordenadas = BD.ListarCoordenadas(idPlan);
            // Variables para almacenar la suma de latitudes y longitudes
            double sumaLat = 0;
            double sumaLon = 0;
            int totalCoordenadas = 0;

            foreach (string coordenada in coordenadas)
            {
                // Dividir la string en latitud y longitud
                var partes = coordenada.Split('/');

                // Convertir a números
                // Parsear las coordenadas usando el formato correcto
            double lat = double.Parse(partes[0], CultureInfo.InvariantCulture);
            double lon = double.Parse(partes[1], CultureInfo.InvariantCulture);

                // Sumar latitudes y longitudes
                sumaLat += lat;
                sumaLon += lon;

                totalCoordenadas++;
            }

            // Calcular los promedios
            string promedioLat = (sumaLat / totalCoordenadas).ToString(CultureInfo.InvariantCulture);
            string promedioLon = (sumaLon / totalCoordenadas).ToString(CultureInfo.InvariantCulture);
            string[] prom = {promedioLat,promedioLon};
        
            return prom;
            }
        public static Usuario ParticipanteYo(int idPlan){
            List<Usuario> participants=BD.ListarParticipantes(idPlan);
            Usuario parti=new Usuario();
            foreach(Usuario u in participants){
                if(u.idUsuario==userActual.idUsuario){
                    parti=u;
                }
            }
            return parti;
        }
        public static void CambiarEstadoPlan(int idPlan, int nuevoEstado){
            BD.CambiarEstadoPlan(idPlan,nuevoEstado);
        }
}
    