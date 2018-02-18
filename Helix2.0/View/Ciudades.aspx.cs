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
    }
}