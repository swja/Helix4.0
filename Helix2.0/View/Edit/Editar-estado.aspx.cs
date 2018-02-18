using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View.Edit
{
    public partial class Editar_estado : System.Web.UI.Page
    {
        public string identificador;
        public class Conexion
        {
            public static SqlConnection ObtenerConexion()
            {
                return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["HelixConnectionString"].ConnectionString);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            identificador = Application["identidad"].ToString();
            if (IsPostBack == false)
            {
                string nombre = Application["nombre"].ToString();
                string descripcion = Application["descripcion"].ToString();
                string flujo = Application["flujo"].ToString();
                txt_descripcion.Text = descripcion;
                txt_nombre.Text = nombre;
                lb_flujo.Text = flujo;
            }
        }
        protected void bt_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Estados.aspx", true);
        }

        protected void Bt_editar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "UPDATE HELIX_ETAPA_FLUJO SET ID_FLUJO = @flujo, NOMBRE_ETAPA = @nombre, DESCRIPCION_ETAPA = @descripcion WHERE ID_ETAPAFLUJO = @id";
                SqlCommand modificar = new SqlCommand(query, conexion);
                modificar.Parameters.AddWithValue("@flujo", Dl_flujo.SelectedValue);
                modificar.Parameters.AddWithValue("@nombre", txt_nombre.Text);
                modificar.Parameters.AddWithValue("@descripcion", txt_descripcion.Text);
                modificar.Parameters.AddWithValue("@id", Convert.ToInt32(identificador));
                conexion.Open();
                try
                {
                    modificar.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro actualizado correctamente.');", true);
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
    }
}