namespace JuntifyApp.Models;

    public class UsuarioXAmigos
{
    public int IdUsuario1;
    public int IdUsuario2;
    public UsuarioXAmigos(int idusuario1, int idusuario2){
        this.IdUsuario1=idusuario1;
        this.IdUsuario2=idusuario2;
    }
}
