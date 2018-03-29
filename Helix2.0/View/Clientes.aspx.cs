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
    }
}