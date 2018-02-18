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
            Application["flujo"] = Convert.ToString(gvEstados.DataKeys[row.RowIndex].Values["Flujo Maestro"]);
            Response.Redirect("/View/Edit/Editar-estado.aspx", true);
        }
    }
}