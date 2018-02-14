using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View.Add
{
    public partial class Agregar_industria : System.Web.UI.Page
    {
        public class Conexion
        {
            public static SqlConnection ObtenerConexion()
            {
                return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["HelixConnectionString"].ConnectionString);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Industrias.aspx", true);
        }

        protected void Bt_agregarIndustria_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "INSERT INTO HELIX_TIPO_INDUSTRIA (TIPO_INDUSTRIA) VALUES (@industria)";
                SqlCommand insertar = new SqlCommand(query, conexion);
                insertar.Parameters.AddWithValue("@industria", txt_Industria.Text);
                conexion.Open();
                try
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro ingresado correctamente.');", true);
                    insertar.ExecuteNonQuery();
                    conexion.Close();
                    Response.Redirect("/View/Industrias.aspx", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Ocurrio un error:')" + ex.Message, true);
                    txt_Industria.Text = "";
                    conexion.Close();
                }
            }
        }
    }
}