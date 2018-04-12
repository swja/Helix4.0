using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View
{
    public partial class Estados : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Add/Agregar-estado.aspx", true);
        }

        protected void gvEstados_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvEstados.SelectedRow;
            Application["identidad"] = Convert.ToInt32(gvEstados.DataKeys[row.RowIndex].Values["#"]);
            Application["nombre"] = Convert.ToString(gvEstados.DataKeys[row.RowIndex].Values["Nombre de la Etapa"]);
            Application["descripcion"] = Convert.ToString(gvEstados.DataKeys[row.RowIndex].Values["Descripción"]);
            Application["flujo"] = Convert.ToString(gvEstados.DataKeys[row.RowIndex].Values["ID_FLUJO"]);
            Response.Redirect("/View/Edit/Editar-estado.aspx", true);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                gvEstados.Visible = true;
                GridView1.Visible = false;
            }
            else
            {
                Label2.Text = TextBox1.Text + "%";
                gvEstados.Visible = false;
                GridView1.Visible = true;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Application["identidad"] = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values["#"]);
            Application["nombre"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["Nombre de la Etapa"]);
            Application["descripcion"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["Descripción"]);
            Application["flujo"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["ID_FLUJO"]);
            Response.Redirect("/View/Edit/Editar-estado.aspx", true);
        }
    }
}