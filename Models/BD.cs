namespace JuntifyApp.Models;
using Dapper;
using System.Data.SqlClient;
using System.Data;
class BD
{
    private static string _connectionString = @"Server =TOMIGOLD24\SQLEXPRESS; Database = Juntify; Trusted_Connection = True;";
    public static List<Usuario> Seleccionar(string sql){
        List<Usuario> listaUsuario = new List<Usuario>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            listaUsuario = db.Query<Usuario>(sql).ToList();
        }
        return listaUsuario;
    }
    public static List<Usuario> SeleccionarXMail(string sql, string mail){
        List<Usuario> listaUsuario = new List<Usuario>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            listaUsuario = db.Query<Usuario>(sql, new{ @Mail = mail }).ToList();
        }
        return listaUsuario;
    }
    public static List<ResenasXUsuario> ListarResenasXLugar(int idlug){
        List<ResenasXUsuario> lista = new List<ResenasXUsuario>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql="SP_ListarResenasXLugar";
            lista = db.Query<ResenasXUsuario>(sql, new{ @idlugar = idlug }).ToList();
        }
        return lista;
    }
    public static List<Usuario> ListarAmigos(int idUsuario){
        List<Usuario> lista =  new List<Usuario>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql="SP_ListarAmigos";
            lista = db.Query<Usuario>(sql, new{ @idUsuario = idUsuario }).ToList();
        }
        return lista;
    }
    public static List<int> ListarIDParticipantes(int idPlan){
        List<int> lista =  new List<int>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql="SP_ListarParticipantesPlan";
            lista = db.Query<int>(sql, new{ @idPlan = idPlan }).ToList();
        }
        return lista;
    }
    public static List<Direcciones> ListarDirecciones(int idUsuario){
        List<Direcciones> lista =  new List<Direcciones>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql="SP_ListarDirecciones";
            lista = db.Query<Direcciones>(sql, new{ @idUsuario=idUsuario }).ToList();
        }
        return lista;
    }
    
        public static int CrearUsuario(Usuario objeto){
        int idUsuario;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SP_CrearUsuario";
            db.Execute(sql, new {contra=objeto.GetContrasena(),nick=objeto.Nick,nombre=objeto.Nombre,mail=objeto.GetMail()});
            sql = "SP_ObtenerIdUsuario";
            idUsuario = db.QueryFirstOrDefault<Usuario>(sql).idUsuario;
        }
        return idUsuario;
    }
    public static void UpdateFotoPerfil(Usuario objeto){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = $"UPDATE usuario SET FotoPerfil='{objeto.FotoPerfil}' where mail='{objeto.GetMail()}'";
            db.Execute(sql);
        }
    }
  

    public static void AgregarAmigo(int idUsuario1, int idUsuario2){
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SP_AgregarAmigo";
            db.Execute(sql, new {@idUsuario1=idUsuario1, @idUsuario2 = idUsuario2});
        }
    }
    public static void AgregarDireccion(int idUsuario, string calle, int altura, double coordenada){
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_AgregarDireccion";
            db.Execute(sql,new{@idUsuario=idUsuario, @calle=calle,@altura=altura, @coordenada=coordenada});
        }
    }
    public static void AgregarDireccionPlan(int idUsuario, int idDireccion, int idPlan){
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_AgregarDireccionParticipante";
            db.Execute(sql,new{@idUsuario=idUsuario, @idDireccion=idDireccion, @idPlan=idPlan});
        }
    }
    public static void AceptarInvitacion(int idUsuario,int idPlan){
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_AceptarInvitacion";
            db.Execute(sql,new{@idPlan=idPlan, @idUsuario=idUsuario});
        }
    }
    public static void AgregarParticipantePlan(int idUsuario, int idPlan){
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_AgregarParticipantePlan";
            db.Execute(sql,new{@idUsuario=idUsuario, @idPlan=idPlan});
        }
    }
    public static void CambiarEstadoPlan(int idPlan , int idEstado){
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_CambiarEstadoPlan";
            db.Execute(sql,new{@idPlan=idPlan, @idEstado=idEstado});
        }
    }
    public static int CrearPlan(string tipoLugar){
        int idPlan=-1;
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_CrearPlan";
            idPlan=db.QueryFirstOrDefault<int>(sql, new{@tipoLugar=tipoLugar});
        }
        Console.WriteLine(idPlan);
        return idPlan;
        }
    public static void EliminarAmigo(int idUsuario1, int idUsuario2){
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_EliminarAmigo";
            db.Execute(sql,new{@idUsuario1=idUsuario1, @idUsuario2=idUsuario2});
        }
    }
    public static void AgregarNoti(int idUsuario, string msg){
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_AgregarNotificacion";
            db.Execute(sql,new{@idUsuario=idUsuario, @texto=msg});
        }
    }
      public static List<Usuario> ListarUsuarios(){
        List<Usuario> ListaUsuarios;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SP_ListarUsuarios";
            ListaUsuarios = db.Query<Usuario>(sql).ToList();
        }
        return ListaUsuarios;
    }
    public static int ObtenerIdUSuario(){
        int idUsuario; 
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SP_ObtenerIdUsuario";
            idUsuario= db.QueryFirstOrDefault<int>(sql);
        }
        return idUsuario;
    }
    public static Usuario UsuarioXID(int idUsuario){
        Usuario user=new Usuario();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SP_ObtenerUsuario";
            user= db.QueryFirstOrDefault<Usuario>(sql,new{@idUsuario=idUsuario});
        }
        return user;
    }
    
    public static List<Notificaciones> ListarNotis(int idUsuario){
        List<Notificaciones> notis =new List<Notificaciones>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SP_ListarNotificaciones";
            notis = db.Query<Notificaciones>(sql, new{@idUsuario=idUsuario}).ToList();
        }
        return notis;
    }
    public static Planes PlanXID(int idPlan){
        Planes plan=new Planes();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SP_PlanXID";
            plan= db.QueryFirstOrDefault<Planes>(sql,new{@idPlan=idPlan});
        }
        return plan;
    }
}



/*
Devolver un unico valor:
 public static Categorias ObtenerIDDeCategoria(string nombreCategoria){
        Categorias cat= new Categorias();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SP_ObtenerIDDeCategoria";
            cat= db.QueryFirstOrDefault<Categorias>(sql,new { Categoria = nombreCategoria });
        }
        return cat;
    }
Devolver una lista:
public static List<Respuestas> ObtenerRespuestas(int preguntaId){
        List<Respuestas> respuestas;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SP_ListarRespuestas";
            respuestas = db.Query<Respuestas>(sql, new { PreguntaId = preguntaId }).ToList();
        }
        return respuestas;
    }
Un void:
public static void ReiniciarCantidadCorona(int idUsuario, int idPartida){
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SP_ReiniciarCantidadCorona";
            db.Execute(sql, new {@IdUsuario=idUsuario, @IdPartida = idPartida});
        }
    }


*/