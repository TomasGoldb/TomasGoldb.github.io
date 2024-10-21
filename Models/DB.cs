namespace JuntifyApp.Models;
using Dapper;
using System.Data.SqlClient;
using System.Data;
class BD
{
    private static string _connectionString = @"Server = A-PHZ2-CIDI-23; Database = PreguntadORT; Trusted_Connection = True;";
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
}
