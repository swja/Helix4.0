using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0
{
    public partial class Login : System.Web.UI.Page
    {
        string perfil;
        protected void Page_Load(object sender, EventArgs e)
        {

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
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                conexion.Open();
                string query = "select * from helix_usuario where NOMBRE_USUARIO ='" + txt_user.Text + "' and PASSWORD ='" + txt_pass.Text +"'";
                SqlCommand cmd = new SqlCommand(query, conexion);
                SqlDataReader Reader1;
                Reader1 = cmd.ExecuteReader();
                if (Reader1.Read())
                {
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Hola desde el grid');", true);
                    //getInt32 para obtener los valores numericos para comparacion y getValue para obtener el valor de la celda y no comparar
                    if (Reader1.GetInt32(1) == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Bienvenido');", true);
                        perfil = Convert.ToString(Reader1.GetValue(1));
                        Response.Redirect("/View/Tickets.aspx", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Incorrecto');", true);
                }
            }
        }
    }
}