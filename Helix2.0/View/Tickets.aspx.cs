using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Helix2._0
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class Conexion
        {
            public static SqlConnection ObtenerConexion()
            {
                return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["HelixConnectionString"].ConnectionString);
            }
        }

        // ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Hola desde el grid');", true);

        protected void Paso_Parametros(object sender, EventArgs e)
        {
            //Label17.Visible = false;
            //Panel1.Visible = true;
            //txt_nombre.Text = GridView3.SelectedRow.Cells[2].Text;
        }
        protected void busqueda(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "select * from helix.usuario where nombre ='" + TextBox1.Text+"'";
                SqlCommand cmd = new SqlCommand(query, conexion);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView5.DataSource = dt;
                GridView5.DataBind();
               // GridView3.Visible = false;
                if(TextBox1.Text == "")
                {
                //    GridView3.Visible = true;
                }
            }
        }

        protected void Bt_nuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Add/Agregar-ticket.aspx", true);
        }
    }
}