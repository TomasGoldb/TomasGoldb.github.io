namespace JuntifyApp.Models;

public class Direcciones
{
    public  int IdDireccion;
    public  int IdUsuario;
    public  string Calle;
    public  double Coordenada;

    public  Direcciones (int iddireccion, int idusuario, string calle,  double coordenada){
        this.IdDireccion=iddireccion;    
        this.IdUsuario=idusuario;
        this.Calle=calle;
        this.Coordenada=coordenada;
           }
           public Direcciones(){}
}
