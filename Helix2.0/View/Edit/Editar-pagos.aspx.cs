using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View.Edit
{
    public partial class Editar_pagos : System.Web.UI.Page
    {
        public string identificador;
        public class Conexion
        {
            public static SqlConnection ObtenerConexion()
            {
                return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["HelixConnectionString"].ConnectionString);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            identificador = Application["identidad"].ToString();
            if(IsPostBack == false)
            {
                txt_Pago.Text = Application["pago"].ToString();
            }
        }

        protected void Bt_editar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "UPDATE HELIX_FORMA_PAGO SET FORMA_PAGO = @pago WHERE ID_FORMAPAGO = @id";
                SqlCommand modificar = new SqlCommand(query, conexion);
                modificar.Parameters.AddWithValue("@pago", txt_Pago.Text);
                modificar.Parameters.AddWithValue("@id", Convert.ToInt32(identificador));
                conexion.Open();
                try
                {
                    modificar.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro ingresado correctamente.');", true);
                    Response.Redirect("/View/Pagos.aspx", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Ocurrio un error:')" + ex.Message, true);
                    conexion.Close();
                }
                conexion.Close();
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            txt_Pago.Text = "";
            Response.Redirect("/View/Pagos.aspx", true);
        }
    }
}