﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;

namespace Helix2._0
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class MiClase
        {
            public static SqlConnection ObtenerConexion()
            {
                return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["HelixConnectionString"].ConnectionString);
            }
        }

        // ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Hola desde el grid');", true);

        protected void paso_Parametros(object sender, EventArgs e)
        {
            Label17.Visible = false;
            Panel1.Visible = true;
            txt_nombre.Text = GridView3.SelectedRow.Cells[2].Text;
        }

        protected void busqueda(object sender)
        {
            using (SqlConnection conexion = MiClase.ObtenerConexion())
            {

            }
        }
    }
}