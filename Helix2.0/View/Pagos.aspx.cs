using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View
{
    public partial class Pagos : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Add/Agregar-pago.aspx", true);
        }

        protected void gvPagos_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvPagos.SelectedRow;
            Application["identidad"] = Convert.ToInt32(gvPagos.DataKeys[row.RowIndex].Values["#"]);
            Application["pago"] = Convert.ToString(gvPagos.DataKeys[row.RowIndex].Values["Forma de Pago"]);
            Response.Redirect("/View/Edit/Editar-pago.aspx", true);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                gvPagos.Visible = true;
                GridView1.Visible = false;
            }
            else
            {
                Label2.Text = TextBox1.Text + "%";
                gvPagos.Visible = false;
                GridView1.Visible = true;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Application["identidad"] = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values["#"]);
            Application["pago"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["Forma de Pago"]);
            Response.Redirect("/View/Edit/Editar-pago.aspx", true);
        }
    }
}
