namespace JuntifyApp.Models;

public class Direcciones
{
    public  int IdDireccion;
    public  int IdUsuario;
    public  string Calle;
    public  int Altura;
    public  double Coordenada;

    public  Direcciones (int iddireccion, int idusuario, string calle, int altura, double coordenada){
        this.IdDireccion=iddireccion;    
        this.IdUsuario=idusuario;
        this.Calle=calle;
        this.Altura=altura;
        this.Coordenada=coordenada;
           }
}
