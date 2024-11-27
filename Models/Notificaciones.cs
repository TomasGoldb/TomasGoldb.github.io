namespace JuntifyApp.Models;

public class Notificaciones
{
    public int idUsuario;
    public int idNotificacion;
    public string Texto;
    public string Foto;
public Notificaciones(int idusuario, int idNotificacion, string texto, string foto){
    this.idUsuario=idusuario;
    this.idNotificacion=idNotificacion;
    this.Texto=texto;
    this.Foto=foto;
}
public Notificaciones(){}

    
}
