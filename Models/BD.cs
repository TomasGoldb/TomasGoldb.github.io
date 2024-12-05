namespace JuntifyApp.Models;
using Dapper;
using System.Data.SqlClient;
using System.Data;
class BD
{
    private static string _connectionString = @"Server =A-PHZ2-CIDI-15; Database = Juntify; Trusted_Connection = True;";
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
    public static List<string> ListarCoordenadas(int idUsuario){
        List<string> lista =  new List<string>();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql="SP_ListarCoordenadas";
            lista = db.Query<string>(sql, new{ @idPlan=idUsuario }).ToList();
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
  
    public static void ActualizarPerfilBD(string nombre, string nick, string biografia, string fotoPerfil, int idUsuario){
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SP_ActualizarPerfil";
            db.Execute(sql, new {@nombre=nombre, @nick=nick, @biografia=biografia, @foto=fotoPerfil, @id=idUsuario});
        }
    }
    public static void AgregarAmigo(int idUsuario1, int idUsuario2){
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SP_AgregarAmigo";
            db.Execute(sql, new {@idUsuario1=idUsuario1, @idUsuario2 = idUsuario2});
        }
    }
    public static void SacarNoUnidos(int idPlan){
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SP_BorrarNoUnidos";
            db.Execute(sql, new {@idPlan=idPlan});
        }
    }
    public static void AgregarDireccion(int idUsuario, string nombre, string calle, string coordenada){
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_AgregarDireccion";
            db.Execute(sql,new{@idUsuario=idUsuario, @nombre=nombre,@calle=calle, @coordenada=coordenada});
        }
    }
    public static void IngresarOpcionesVotacion(int idPlan, string opciones){
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_IngresarOpcionesVotacion";
            db.Execute(sql,new{@idPlan=idPlan,@opciones=opciones});
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
            db.Execute(sql,new{@idUsuario=idUsuario, @idPlan=idPlan});
        }
    }
    public static void SacarNoti(int idNoti){
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_SacarNoti";
            db.Execute(sql,new{@idNoti=idNoti});
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
    public static int CrearPlan(string tipoLugar, int idUsuario){
        int idPlan;
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_CrearPlan";
            idPlan=db.QueryFirstOrDefault<int>(sql, new{@tipoLugar=tipoLugar, @idUsuario=idUsuario});
        }
        return idPlan;
        }
    public static void EliminarAmigo(int idUsuario1, int idUsuario2){
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_EliminarAmigo";
            db.Execute(sql,new{@idUsuario1=idUsuario1, @idUsuario2=idUsuario2});
        }
    }
    public static int AgregarNoti(int idUsuario){
        int idNoti;
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_AgregarNotificacion";
            idNoti = db.QuerySingle<int>(sql, new { idUsuario }, commandType: CommandType.StoredProcedure);
        }
        return idNoti;
    }
    public static void AgregarTextoNoti(int idNoti, string texto){
        using(SqlConnection db=new SqlConnection(_connectionString)){
            string sql="SP_AgregarTextoNoti";
            db.Execute(sql,new{@idNoti=idNoti, @txt=texto});
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
    
    public static List<Usuario> ListarParticipantes(int idPlan){
        List<Usuario> user=new List<Usuario>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SP_ParticipanteXID";
            user= db.Query<Usuario>(sql,new{@idPlan=idPlan}).ToList();
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