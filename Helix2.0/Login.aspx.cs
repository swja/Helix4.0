using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0
{
    public partial class Login : System.Web.UI.Page
    {
        string password;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
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
                string query = "SELECT HELIX_USUARIO.ID_ROL,HELIX_ROL.ROL, concat(NOMBRE,' ',APELLIDO) as Nombres from HELIX_USUARIO INNER JOIN HELIX_ROL on HELIX_USUARIO.ID_ROL = HELIX_ROL.ID_ROL WHERE NOMBRE_USUARIO = '" + txt_user.Text + "' and PASSWORD ='" + password +"'";
                SqlCommand cmd = new SqlCommand(query, conexion);
                SqlDataReader Reader1;
                Reader1 = cmd.ExecuteReader();
                if (Reader1.Read())
                {
                    //getInt32 para obtener los valores numericos para comparacion y getValue para obtener el valor de la celda y no comparar
                    if (Reader1.GetInt32(0) == 1)
                    {
                        //perfil = Convert.ToString(Reader1.GetValue(1));
                        //nombres = Convert.ToString(Reader1.GetValue(2));
                        Session["Perfil"] = Convert.ToString(Reader1.GetValue(1));
                        Session["Nombres"] = Convert.ToString(Reader1.GetValue(2));
                        Response.Redirect("/View/Tickets.aspx", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Incorrecto');", true);
                }
                conexion.Close();
            }
        }
    }
}