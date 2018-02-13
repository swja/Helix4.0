using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View.Add
{
    public partial class Agregar_ciudad : System.Web.UI.Page
    {
        public class Conexion
        {
            public static SqlConnection ObtenerConexion()
            {
                return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["HelixConnectionString"].ConnectionString);
            }
        }

        public void Limpiar()
        {
            txt_ciudad.Text = "";
        }

        protected void Bt_agregar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "INSERT INTO HELIX_CIUDAD (CIUDAD) VALUES (@ciudad)";
                SqlCommand insertar = new SqlCommand(query, conexion);
                insertar.Parameters.AddWithValue("@ciudad", txt_ciudad.Text);
                conexion.Open();
                try
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro ingresado correctamente.');", true);
                    insertar.ExecuteNonQuery();
                    conexion.Close();
                    Response.Redirect("/View/Ciudades.aspx", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Ocurrio un error:')"+ex.Message, true);
                    Limpiar();
                    conexion.Close();
                }
                conexion.Close();
            }
        }

        protected void Bt_cancelar_Click(object sender, EventArgs e)
        {
            Limpiar();
            Response.Redirect("/View/Ciudades.aspx", true);
        }

    }
}