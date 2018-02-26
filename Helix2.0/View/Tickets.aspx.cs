using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

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
        protected void busqueda(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "select * from helix.usuario where nombre ='" + txt_Busqueda.Text+"'";
                SqlCommand cmd = new SqlCommand(query, conexion);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvTickets.DataSource = dt;
                gvTickets.DataBind();
            }
        }

        protected void Bt_nuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Add/Agregar-ticket.aspx", true);
        }

        protected void gvTickets_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvTickets.SelectedRow;
            Application["identidad"] = Convert.ToInt32(gvTickets.DataKeys[row.RowIndex].Values["#"]);
            Application["cliente"] = Convert.ToString(gvTickets.DataKeys[row.RowIndex].Values["Cliente"]);
            Application["usuario"] = Convert.ToString(gvTickets.DataKeys[row.RowIndex].Values["Usuario Asignado"]);
            Application["nombre"] = Convert.ToString(gvTickets.DataKeys[row.RowIndex].Values["Nombre Ticket"]);
            Application["descripción"] = Convert.ToString(gvTickets.DataKeys[row.RowIndex].Values["Descripción"]);
            Application["flujo"] = Convert.ToString(gvTickets.DataKeys[row.RowIndex].Values["ID_FLUJO"]);
            Application["etapa"] = Convert.ToString(gvTickets.DataKeys[row.RowIndex].Values["ID_ETAPAFLUJO"]);
            Application["pago"] = Convert.ToString(gvTickets.DataKeys[row.RowIndex].Values["ID_FORMAPAGO"]);
            Application["fechaE"] = Convert.ToDateTime(gvTickets.DataKeys[row.RowIndex].Values["Fecha de Entrega"]);
            Application["fechaF"] = Convert.ToDateTime(gvTickets.DataKeys[row.RowIndex].Values["Fecha de Facturación"]);
            Response.Redirect("/View/Edit/Editar-ticket.aspx", true);
        }
    }
}