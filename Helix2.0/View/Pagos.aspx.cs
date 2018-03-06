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
    }
}
