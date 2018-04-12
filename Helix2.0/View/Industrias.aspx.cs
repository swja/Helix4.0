using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View
{
    public partial class Industrias : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Add/Agregar-industria.aspx", true);
        }

        protected void gvIndustria_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvIndustria.SelectedRow;
            Application["identidad"] = Convert.ToInt32(gvIndustria.DataKeys[row.RowIndex].Values["#"]);
            Application["industria"] = Convert.ToString(gvIndustria.DataKeys[row.RowIndex].Values["Tipo de Industria"]);
            Response.Redirect("/View/Edit/Editar-industria.aspx", true);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Application["identidad"] = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values["#"]);
            Application["industria"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["Tipo de Industria"]);
            Response.Redirect("/View/Edit/Editar-industria.aspx", true);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                gvIndustria.Visible = true;
                GridView1.Visible = false;
            }
            else
            {
                Label2.Text = TextBox1.Text + "%";
                gvIndustria.Visible = false;
                GridView1.Visible = true;
            }
        }
    }
}