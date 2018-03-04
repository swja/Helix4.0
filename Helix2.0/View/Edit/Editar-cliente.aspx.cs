using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View.Edit
{
    public partial class Editar_cliente : System.Web.UI.Page
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
                txt_Nombres.Text = Application["nombres"].ToString();
                txt_Direccion.Text = Application["direccion"].ToString();
                txt_Email.Text = Application["email"].ToString();
                txt_Telefono.Text = Application["telefono"].ToString();
                dl_Ciudad.SelectedValue = Application["ciudad"].ToString();
                dl_Industria.SelectedValue = Application["industria"].ToString();
            }
        }
        protected void Bt_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Clientes.aspx", true);
        }

        protected void Bt_editar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "UPDATE HELIX_CLIENTE SET ID_CIUDAD = @ciudad,ID_TIPOINDUSTRIA = @industria,NOMBRES = @nombres,DIRECCION = @direccion,TELEFONO = @telefono,EMAIL = @email WHERE ID_CLIENTE = @id";
                SqlCommand modificar = new SqlCommand(query, conexion);
                modificar.Parameters.AddWithValue("@id", Convert.ToInt32(identificador));
                modificar.Parameters.AddWithValue("@ciudad", dl_Ciudad.SelectedValue);
                modificar.Parameters.AddWithValue("@industria", dl_Industria.SelectedValue);
                modificar.Parameters.AddWithValue("@nombres", txt_Nombres.Text);
                modificar.Parameters.AddWithValue("@direccion", txt_Direccion.Text);
                modificar.Parameters.AddWithValue("@telefono", txt_Telefono.Text);
                modificar.Parameters.AddWithValue("@email", txt_Email.Text);
                conexion.Open();
                try
                {
                    modificar.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro ingresado correctamente.');", true);
                    Response.Redirect("/View/Clientes.aspx", true);
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