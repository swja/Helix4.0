using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View.Add
{
    public partial class Agregar_estado : System.Web.UI.Page
    {
        public class Conexion
        {
            public static SqlConnection ObtenerConexion()
            {
                return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["HelixConnectionString"].ConnectionString);
            }
        }
        protected void Bt_agregar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "INSERT INTO HELIX_ETAPA_FLUJO (ID_FLUJO, NOMBRE_ETAPA, DESCRIPCION_ETAPA) VALUES (@id, @nombre, @descripcion)";
                SqlCommand insertar = new SqlCommand(query, conexion);
                insertar.Parameters.AddWithValue("@nombre", txt_estado.Text);
                insertar.Parameters.AddWithValue("@descripcion", txt_descripcion.Text);
                insertar.Parameters.AddWithValue("@id", Dl_flujos.SelectedValue);
                conexion.Open();
                try
                {
                    insertar.ExecuteNonQuery();
                    conexion.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro ingresado correctamente.');", true);
                    Response.Redirect("/View/Estados.aspx", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Ocurrio un error:')" + ex.Message, true);
                    conexion.Close();
                }
                conexion.Close();
            }
        }

        protected void Bt_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Estados.aspx", true);
        }
    }
}