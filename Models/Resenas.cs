namespace JuntifyApp.Models;

public class Resenas
{
    public int IdLugar;
    public int IdUsuario;
    public int puntaje;
    public string descripcion;
    public Resenas(int idlugar, int idusuario, int puntaje, string descripcion){
        this.IdLugar=IdLugar;
        this.IdUsuario=idusuario;
        this.puntaje=puntaje;
        this.descripcion=descripcion;
    }
}
