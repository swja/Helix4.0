using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace Helix2._0
{
    public partial class Login : System.Web.UI.Page
    {
        string password;
    public class Encriptar
        {
            public static string GetMD5(string str)
            {
                MD5 md5 = MD5CryptoServiceProvider.Create();
                ASCIIEncoding encoding = new ASCIIEncoding();
                byte[] stream = null;
                StringBuilder sb = new StringBuilder();
                stream = md5.ComputeHash(encoding.GetBytes(str));
                for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
                return sb.ToString();
            }
        }
        public class Conexion
        {
            public static SqlConnection ObtenerConexion()
            {
                return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["HelixConnectionString"].ConnectionString);
            }
        }
        protected void button_Click(object sender, EventArgs e)
        {
            password = Encriptar.GetMD5(txt_pass.Text);
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                conexion.Open();
                string query = "SELECT HELIX_USUARIO.ID_ROL,HELIX_ROL.ROL, concat(NOMBRE,' ',APELLIDO) as Nombres,ID_USUARIO from HELIX_USUARIO INNER JOIN HELIX_ROL on HELIX_USUARIO.ID_ROL = HELIX_ROL.ID_ROL WHERE NOMBRE_USUARIO = '" + txt_user.Text + "' and PASSWORD ='" + password +"'";
                SqlCommand cmd = new SqlCommand(query, conexion);
                SqlDataReader Reader;
                Reader = cmd.ExecuteReader();
                if (Reader.Read())
                {
                    //getInt32 para obtener los valores numericos para comparacion y getValue para obtener el valor de la celda y no comparar
                    if (Reader.GetInt32(0) == 1)
                    {
                        Session["Perfil"] = Convert.ToString(Reader.GetValue(1));
                        Session["Nombres"] = Convert.ToString(Reader.GetValue(2));
                        //para ingresar el comentario la persona que ingresa no la que esta asignada
                        Session["Id"] = Convert.ToInt32(Reader.GetValue(3));
                        Response.Redirect("/View/Tickets.aspx", true);
                    }
                    else
                    {
                        Session["Perfil"] = Convert.ToString(Reader.GetValue(1));
                        Session["Nombres"] = Convert.ToString(Reader.GetValue(2));
                        //para ingresar el comentario la persona que ingresa no la que esta asignada
                        Session["Id"] = Convert.ToInt32(Reader.GetValue(3));
                        Response.Redirect("/View/Tickets.aspx", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alerta", "alert('Usuario o Contraseña incorrecto');", true);
                }
                conexion.Close();
            }
        }
    }
}