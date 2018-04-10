using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Drawing;

namespace Helix2._0
{
    public partial class _Default : Page
    {
        public DateTime fecha_Ticket;
        protected void Page_Load(object sender, EventArgs e)
        {
            foreach(GridViewRow row in gvTickets.Rows)
            {
                fecha_Ticket = DateTime.Parse(row.Cells[8].Text);
                if (fecha_Ticket <= DateTime.Today)
                {
                    row.Cells[8].BackColor = Color.LightPink;
                }
                else
                {
                    if (fecha_Ticket <= DateTime.Today.AddDays(3))
                    {
                        row.Cells[8].BackColor = Color.Beige;
                    }
                    else
                    {
                        row.Cells[8].BackColor = Color.GhostWhite;
                    }
                }
            }
        }
        public class Conexion
        {
            public static SqlConnection ObtenerConexion()
            {
                return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["HelixConnectionString"].ConnectionString);
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
            Application["id_Cliente"] = Convert.ToInt32(gvTickets.DataKeys[row.RowIndex].Values["ID_CLIENTE"]);
            Application["id_Usuario"] = Convert.ToInt32(gvTickets.DataKeys[row.RowIndex].Values["ID_USUARIO"]);
            Response.Redirect("/View/Edit/Editar-ticket.aspx", true);
        }
        protected void txt_Busqueda_AutoPostBack(object sender, EventArgs e)
        {
            if(txt_Busqueda.Text == "")
            {
                gvTickets.Visible = true;
                gvBusqueda.Visible = false;
            }
            else
            {
                consulta.Text = txt_Busqueda.Text + "%";
                gvTickets.Visible = false;
                gvBusqueda.Visible = true;
                foreach (GridViewRow row in gvBusqueda.Rows)
                {
                    fecha_Ticket = DateTime.Parse(row.Cells[8].Text);
                    if (fecha_Ticket <= DateTime.Today)
                    {
                        row.Cells[8].BackColor = Color.LightPink;
                    }
                    else
                    {
                        if (fecha_Ticket <= DateTime.Today.AddDays(3))
                        {
                            row.Cells[8].BackColor = Color.Beige;
                        }
                        else
                        {
                            row.Cells[8].BackColor = Color.GhostWhite;
                        }
                    }
                }
            }
        }

        protected void gvBusqueda_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvBusqueda.SelectedRow;
            Application["identidad"] = Convert.ToInt32(gvBusqueda.DataKeys[row.RowIndex].Values["#"]);
            Application["cliente"] = Convert.ToString(gvBusqueda.DataKeys[row.RowIndex].Values["Cliente"]);
            Application["usuario"] = Convert.ToString(gvBusqueda.DataKeys[row.RowIndex].Values["Usuario Asignado"]);
            Application["nombre"] = Convert.ToString(gvBusqueda.DataKeys[row.RowIndex].Values["Nombre Ticket"]);
            Application["descripción"] = Convert.ToString(gvBusqueda.DataKeys[row.RowIndex].Values["Descripción"]);
            Application["flujo"] = Convert.ToString(gvBusqueda.DataKeys[row.RowIndex].Values["ID_FLUJO"]);
            Application["etapa"] = Convert.ToString(gvBusqueda.DataKeys[row.RowIndex].Values["ID_ETAPAFLUJO"]);
            Application["pago"] = Convert.ToString(gvBusqueda.DataKeys[row.RowIndex].Values["ID_FORMAPAGO"]);
            Application["fechaE"] = Convert.ToDateTime(gvBusqueda.DataKeys[row.RowIndex].Values["Fecha de Entrega"]);
            Application["fechaF"] = Convert.ToDateTime(gvBusqueda.DataKeys[row.RowIndex].Values["Fecha de Facturación"]);
            Application["id_Cliente"] = Convert.ToInt32(gvBusqueda.DataKeys[row.RowIndex].Values["ID_CLIENTE"]);
            Application["id_Usuario"] = Convert.ToInt32(gvBusqueda.DataKeys[row.RowIndex].Values["ID_USUARIO"]);
            Response.Redirect("/View/Edit/Editar-ticket.aspx", true);
        }
    }
}