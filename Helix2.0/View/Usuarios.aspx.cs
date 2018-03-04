using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Bt_agregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Add/Agregar-usuario.aspx", true);
        }

        protected void gvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvUsuarios.SelectedRow;
            Application["identidad"] = Convert.ToInt32(gvUsuarios.DataKeys[row.RowIndex].Values["#"]);
            Application["nombre"] = Convert.ToString(gvUsuarios.DataKeys[row.RowIndex].Values["Nombre"]);
            Application["apellido"] = Convert.ToString(gvUsuarios.DataKeys[row.RowIndex].Values["Apellido"]);
            Application["cargo"] = Convert.ToString(gvUsuarios.DataKeys[row.RowIndex].Values["Cargo"]);
            Application["email"] = Convert.ToString(gvUsuarios.DataKeys[row.RowIndex].Values["Email"]);
            Application["usuario"] = Convert.ToString(gvUsuarios.DataKeys[row.RowIndex].Values["Nombre de Usuario"]);
            Application["rol"] = Convert.ToString(gvUsuarios.DataKeys[row.RowIndex].Values["ID_ROL"]);
            Application["telefono"] = Convert.ToString(gvUsuarios.DataKeys[row.RowIndex].Values["Telefono"]);
            Application["password"] = Convert.ToString(gvUsuarios.DataKeys[row.RowIndex].Values["Contraseña"]);
            Response.Redirect("/View/Edit/Editar-usuario.aspx", true);
        }
    }
}