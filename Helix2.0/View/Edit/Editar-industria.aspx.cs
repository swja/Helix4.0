using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Helix2._0.View.Edit
{
    public partial class Editar_industria : System.Web.UI.Page
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
            string industria = Application["industria"].ToString();
            Label3.Text = industria;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            txt_Industria.Text = "";
            Response.Redirect("/View/Industrias.aspx", true);
        }

        protected void Bt_editar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "UPDATE HELIX_TIPO_INDUSTRIA SET TIPO_INDUSTRIA = @industria WHERE ID_TIPOINDUSTRIA = @id";
                SqlCommand modificar = new SqlCommand(query, conexion);
                modificar.Parameters.AddWithValue("@industria", txt_Industria.Text);
                modificar.Parameters.AddWithValue("@id", Convert.ToInt32(identificador));
                conexion.Open();
                try
                {
                    modificar.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro ingresado correctamente.');", true);
                    Response.Redirect("/View/Industrias.aspx", true);
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