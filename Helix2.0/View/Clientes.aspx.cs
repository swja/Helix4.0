using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View
{
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Add/Agregar-cliente.aspx", true);
        }

        protected void gvClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvClientes.SelectedRow;
            Application["identidad"] = Convert.ToInt32(gvClientes.DataKeys[row.RowIndex].Values["#"]);
            Application["nombres"] = Convert.ToString(gvClientes.DataKeys[row.RowIndex].Values["NOMBRES"]);
            Application["apellidos"] = Convert.ToString(gvClientes.DataKeys[row.RowIndex].Values["APELLIDOS"]);
            Application["direccion"] = Convert.ToString(gvClientes.DataKeys[row.RowIndex].Values["Dirección"]);
            Application["telefono"] = Convert.ToString(gvClientes.DataKeys[row.RowIndex].Values["Telefono"]);
            Application["email"] = Convert.ToString(gvClientes.DataKeys[row.RowIndex].Values["Email"]);
            Application["industria"] = Convert.ToString(gvClientes.DataKeys[row.RowIndex].Values["ID_TIPOINDUSTRIA"]);
            Application["ciudad"] = Convert.ToString(gvClientes.DataKeys[row.RowIndex].Values["ID_CIUDAD"]);
            Response.Redirect("/View/Edit/Editar-cliente.aspx", true);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                gvClientes.Visible = true;
                GridView1.Visible = false;
            }
            else
            {
                Label2.Text = TextBox1.Text + "%";
                gvClientes.Visible = false;
                GridView1.Visible = true;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Application["identidad"] = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values["#"]);
            Application["nombres"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["NOMBRES"]);
            Application["apellidos"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["APELLIDOS"]);
            Application["direccion"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["Dirección"]);
            Application["telefono"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["Telefono"]);
            Application["email"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["Email"]);
            Application["industria"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["ID_TIPOINDUSTRIA"]);
            Application["ciudad"] = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["ID_CIUDAD"]);
            Response.Redirect("/View/Edit/Editar-cliente.aspx", true);
        }
    }
}