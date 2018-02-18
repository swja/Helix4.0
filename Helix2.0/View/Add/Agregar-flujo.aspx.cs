using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View.Add
{
    public partial class Agregar_Flujo : System.Web.UI.Page
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
            Response.Redirect("/View/Flujos.aspx", true);
        }

        protected void Bt_agregar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "INSERT INTO HELIX_FLUJO (DESCRIPCION_FLUJO, NOMBRE_FLUJO) VALUES (@descripcion, @nombre)";
                SqlCommand insertar = new SqlCommand(query, conexion);
                insertar.Parameters.AddWithValue("@nombre", txt_nombre.Text);
                insertar.Parameters.AddWithValue("@descripcion", txt_descripcion.Text);
                conexion.Open();
                try
                {
                    insertar.ExecuteNonQuery();
                    conexion.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro ingresado correctamente.');", true);
                    Response.Redirect("/View/Flujos.aspx", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Ocurrio un error:')" + ex.Message, true);
                    limpiar();
                    conexion.Close();
                }
                conexion.Close();
            }
        }

        public void limpiar()
        {
            txt_descripcion.Text = "";
            txt_nombre.Text = "";
        }
    }
}