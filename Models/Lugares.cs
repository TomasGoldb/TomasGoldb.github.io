namespace JuntifyApp.Models;

public class Lugares
{
    public int IdLugar;
    public string Nombre;
    public string Descripcion;
    public double Coordenada;
    public string Calle;
    public int Altura;
    public int IdTipoLugar;

    public Lugares(int idlugar, string nombre, string descripcion, double coordenada, string calle, int altura, int idtipolugar){
        this.IdLugar=idlugar;
        this.Nombre=nombre;
        this.Descripcion=descripcion;
        this.Coordenada=coordenada;
        this.Calle=calle;
        this.Altura=altura;
        this.IdTipoLugar=idtipolugar;
    }
}