namespace JuntifyApp.Models;

public class TipoSubOpcion
{
    public int IdTipoSubOpcion;
    public string ContenidoSub;
    public TipoSubOpcion(int idtiposubopcion, string contenidosub){
        this.IdTipoSubOpcion=idtiposubopcion;
        this.ContenidoSub=contenidosub;
    }
}
