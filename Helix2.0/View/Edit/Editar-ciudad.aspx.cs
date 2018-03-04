using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Helix2._0.View.Edit
{
    public partial class Editar_ciudad : System.Web.UI.Page
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
                txt_Ciudad.Text = Application["ciudad"].ToString();
            }
        }

        protected void Bt_editar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "UPDATE HELIX_CIUDAD SET CIUDAD = @ciudad WHERE ID_CIUDAD = @id";
                SqlCommand modificar = new SqlCommand(query, conexion);
                modificar.Parameters.AddWithValue("@ciudad", txt_Ciudad.Text);
                modificar.Parameters.AddWithValue("@id", Convert.ToInt32(identificador));
                conexion.Open();
                try
                {
                    modificar.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro actualizado correctamente.');", true);
                    Response.Redirect("/View/Ciudades.aspx", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Ocurrio un error:')" + ex.Message, true);
                    conexion.Close();
                }
                conexion.Close();
            }
        }

        protected void bt_cancelar_Click(object sender, EventArgs e)
        {
            txt_Ciudad.Text = "";
            Response.Redirect("/View/Ciudades.aspx", true);
        }
    }
}