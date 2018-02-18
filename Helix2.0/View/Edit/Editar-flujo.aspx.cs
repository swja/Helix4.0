using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View.Edit
{
    public partial class Editar_flujo : System.Web.UI.Page
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
                txt_descripcion.Text = descripcion;
                txt_nombre.Text = nombre;
            }

            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "SELECT ID_ETAPAFLUJO AS #, NOMBRE_ETAPA AS 'Nombre de la Etapa', DESCRIPCION_ETAPA AS 'Descripción' FROM HELIX_ETAPA_FLUJO WHERE HELIX_ETAPA_FLUJO.ID_FLUJO ='" + identificador + "'";
                SqlCommand cmd = new SqlCommand(query, conexion);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvEtapa.DataSource = dt;
                gvEtapa.DataBind();
            }
        }

        protected void Bt_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Flujos.aspx", true);
        }

        protected void Bt_editar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "UPDATE HELIX_FLUJO SET NOMBRE_FLUJO = @nombre, DESCRIPCION_FLUJO = @descripcion WHERE HELIX_FLUJO.ID_FLUJO = @id";
                SqlCommand modificar = new SqlCommand(query, conexion);
                modificar.Parameters.AddWithValue("@nombre", txt_nombre.Text);
                modificar.Parameters.AddWithValue("@descripcion", txt_descripcion.Text);
                modificar.Parameters.AddWithValue("@id", Convert.ToInt32(identificador));
                conexion.Open();
                try
                {
                    modificar.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro actualizado correctamente.');", true);
                    Response.Redirect("/View/Flujos.aspx", true);
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