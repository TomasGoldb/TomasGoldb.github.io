namespace JuntifyApp.Models;

public class Planes
{
    public int IdPlan;
    public string Nombre;
    public int IdLugar;
    public DateTime FechaYHora;
    public int IdEstado;
    public int IdTipoLugar;
    public int IdTipoSubOpcion;
    public string Link;
    public string QR;

    public Planes(int idplan, string nombre, int idlugar, DateTime fechayhora, int idestado, int idtipolugar, int idtiposubopcion, string link, string qr){
        this.IdPlan=idplan;
        this.Nombre=nombre;
        this.IdLugar=idlugar;
        this.FechaYHora=fechayhora;
        this.IdEstado=idestado;
        this.IdTipoLugar=idtipolugar;
        this.IdTipoSubOpcion=idtiposubopcion;
        this.Link=link;
        this.QR=qr;
    }
    public Planes(){}


}
