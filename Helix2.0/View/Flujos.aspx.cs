using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View
{
    public partial class Flujos : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Add/Agregar-flujo.aspx", true);
        }

        protected void gvFlujo_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvFlujo.SelectedRow;
            Application["identidad"] = Convert.ToInt32(gvFlujo.DataKeys[row.RowIndex].Values["#"]);
            Application["nombre"] = Convert.ToString(gvFlujo.DataKeys[row.RowIndex].Values["Nombre del Flujo"]);
            Application["descripcion"] = Convert.ToString(gvFlujo.DataKeys[row.RowIndex].Values["Descripción"]);
            Response.Redirect("/View/Edit/Editar-flujo.aspx", true);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                gvFlujo.Visible = true;
                GridView1.Visible = false;
            }
            else
            {
                Label18.Text = TextBox1.Text + "%";
                gvFlujo.Visible = false;
                GridView1.Visible = true;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Application["identidad"] = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values["#"]);
            Application["nombre"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["Nombre del Flujo"]);
            Application["descripcion"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["Descripción"]);
            Response.Redirect("/View/Edit/Editar-flujo.aspx", true);
        }
    }
}