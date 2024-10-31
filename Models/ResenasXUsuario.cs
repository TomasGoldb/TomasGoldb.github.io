namespace JuntifyApp.Models;

public class ResenasXUsuario
{
    public string Nombre {get;set;}
    public double Puntaje {get;set;}
    public string Descripcion {get;set;}
    public int IdLugar {get;set;}

    public ResenasXUsuario(string nombre, double puntaje, string descripcion, int idLugar){
        Nombre=nombre;
        Puntaje=puntaje;
        Descripcion=descripcion;
        IdLugar=idLugar;
    }
}
