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
        int identidad;
        string nombres, direccion, telefono, email, industria, ciudad;
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Add/Agregar-cliente.aspx", true);
        }

        protected void gvClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvClientes.SelectedRow;
            identidad = Convert.ToInt32(gvClientes.DataKeys[row.RowIndex].Values["#"]);
            nombres = Convert.ToString(gvClientes.DataKeys[row.RowIndex].Values["Nombres"]);
            direccion = Convert.ToString(gvClientes.DataKeys[row.RowIndex].Values["Dirección"]);
            telefono = Convert.ToString(gvClientes.DataKeys[row.RowIndex].Values["Telefono"]);
            email = Convert.ToString(gvClientes.DataKeys[row.RowIndex].Values["Email"]);
            industria = Convert.ToString(gvClientes.DataKeys[row.RowIndex].Values["Tipo de Industria"]);
            ciudad = Convert.ToString(gvClientes.DataKeys[row.RowIndex].Values["Ciudad"]);
            Response.Redirect("/View/Edit/Editar-cliente.aspx?"+"id="+identidad+"&nom="+nombres+"&dir="+direccion+"&tele="+telefono+"&mail="+email+"&indus="+industria+"&ciu="+ciudad, true);
        }
    }
}