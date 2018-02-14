using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Perfil"] == null)
            {
                Response.Write("<script>window.alert('No ha iniciado sesión correctamente, intentelo nuevamente.');</script>" + "<script>window.setTimeout(location.href='/Login.aspx', 2000);</script>");
            }
            else
            {
                Perfil.Text = Convert.ToString(Session["Perfil"]);
                Nombre.Text = Convert.ToString(Session["Nombres"]);
            }
        }
    }
}