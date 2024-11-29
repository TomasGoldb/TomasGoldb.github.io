namespace JuntifyApp.Models;

public class Direcciones
{
    public  int IdDireccion;
    public  int IdUsuario;
    public  string Calle;
    public string Coordenada;
    public string Nombre;

    public  Direcciones (int iddireccion, int idusuario, string calle,  string coordenada){
        this.IdDireccion=iddireccion;    
        this.IdUsuario=idusuario;
        this.Calle=calle;
        this.Coordenada=coordenada;
           }
           public Direcciones(){}
}
