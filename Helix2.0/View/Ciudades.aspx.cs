using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View
{
    public partial class Ciudades : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Add/Agregar-ciudad.aspx", true);
        }
        protected void gvCiudad_SelectedindexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridCiudades.SelectedRow;
            Application["identidad"] = Convert.ToInt32(GridCiudades.DataKeys[row.RowIndex].Values["#"]);
            Application["ciudad"] = Convert.ToString(GridCiudades.DataKeys[row.RowIndex].Values["Ciudad"]);
            Response.Redirect("/View/Edit/Editar-ciudad.aspx", true);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                GridCiudades.Visible = true;
                GridView1.Visible = false;
            }
            else
            {
                Label2.Text = TextBox1.Text + "%";
                GridCiudades.Visible = false;
                GridView1.Visible = true;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Application["identidad"] = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values["#"]);
            Application["ciudad"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["Ciudad"]);
            Response.Redirect("/View/Edit/Editar-ciudad.aspx", true);
        }
    }
}