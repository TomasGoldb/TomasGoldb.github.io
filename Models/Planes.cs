namespace JuntifyApp.Models;

public class Planes
{
    public int IdPlan;
    public string Nombre;
    public int IdLugar;
    public DateTime FechaYHora;
    public int IdEstado;
    public string TipoLugar;
    public int IdTipoSubOpcion;
    public string Link;
    public string QR;
    public string OpcionesVotacion;

    public Planes(int idplan, string nombre, int idlugar, DateTime fechayhora, int idestado, string tipolugar, int idtiposubopcion, string link, string qr, string opcionesVotacion){
        this.IdPlan=idplan;
        this.Nombre=nombre;
        this.IdLugar=idlugar;
        this.FechaYHora=fechayhora;
        this.IdEstado=idestado;
        this.TipoLugar=tipolugar;
        this.IdTipoSubOpcion=idtiposubopcion;
        this.Link=link;
        this.QR=qr;
        this.OpcionesVotacion=opcionesVotacion;
    }
    public Planes(){}

}
