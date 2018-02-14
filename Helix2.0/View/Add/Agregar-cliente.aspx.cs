using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Helix2._0.View.Add
{
    public partial class Agregar_cliente : System.Web.UI.Page
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
                string query = "INSERT INTO HELIX_CLIENTE (ID_CIUDAD,ID_TIPOINDUSTRIA,NOMBRES,DIRECCION,TELEFONO,EMAIL) VALUES (@id_Ciudad,@id_Industria,@nombres,@direccion,@telefono,@email)";
                SqlCommand insertar = new SqlCommand(query, conexion);
                insertar.Parameters.AddWithValue("@nombres", txt_nombre.Text);
                insertar.Parameters.AddWithValue("@direccion", txt_direccion.Text);
                insertar.Parameters.AddWithValue("@telefono", txt_telefono.Text);
                insertar.Parameters.AddWithValue("@email", txt_email.Text);
                insertar.Parameters.AddWithValue("@id_Ciudad", drop_ciudad.SelectedValue);
                insertar.Parameters.AddWithValue("@id_Industria", drop_industria.SelectedValue);
                conexion.Open();
                try
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro ingresado correctamente.');", true);
                    insertar.ExecuteNonQuery();
                    conexion.Close();
                    Response.Redirect("/View/Clientes.aspx", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Ocurrio un error:')" + ex.Message, true);
                    conexion.Close();
                }
                limpiar();
            }
        }

        protected void Bt_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Clientes.aspx", true);
        }

        public void limpiar()
        {
            txt_direccion.Text = "";
            txt_email.Text = "";
            txt_nombre.Text = "";
            txt_telefono.Text = "";
        }
    }
}