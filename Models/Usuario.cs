namespace JuntifyApp.Models;

public class Usuario
{
    public int idUsuario{get;set;}
        public string Nombre {get;set;}
        public string Nick {get;set;}
        private string Contrasena {get;set;}
        public string Mail {set; private get;}
        public int Edad {set;get;}
        public string Biografia {get;set;}
        public string FotoPerfil {get;set;}
        


        
        public Usuario(){}

        public Usuario(string nombre, string nick,string contrasena, string mail){
            this.Nombre = nombre;
            this.Nick = nick;
            this.Contrasena = contrasena;
            this.Mail = mail;
            this.FotoPerfil = "/fotosPerfil/fotoDefault.png";
        }
        public bool CheckContra (string contrasenaPosible){
            if (contrasenaPosible==this.Contrasena){
                return true;
            }
            return false;
        }
        public string GetContrasena (){
            return Contrasena;
        }
        public string GetMail(){
            return Mail;
        }
        public bool CambiarFoto(IFormFile archivo, IWebHostEnvironment environment){
            if(archivo.Length>0){
            string wwwRootLocal=environment.ContentRootPath+@"\wwwroot\fotosPerfil\"+archivo.FileName;
            Sesion.userActual.FotoPerfil=@"\fotosPerfil\"+archivo.FileName;
            BD.UpdateFotoPerfil(Sesion.userActual);
            using(var stream=System.IO.File.Create(wwwRootLocal)){
                archivo.CopyToAsync(stream);
            }
            
            return true;
        } else{
            
            return false;
        }
        }

}
