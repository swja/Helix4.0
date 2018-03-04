using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Helix2._0.View.Add
{
    public partial class Agregar_pagos : System.Web.UI.Page
    {
        public class Conexion
        {
            public static SqlConnection ObtenerConexion()
            {
                return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["HelixConnectionString"].ConnectionString);
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Pagos.aspx", true);
        }

        protected void Bt_agregarPago_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "INSERT INTO HELIX_FORMA_PAGO (FORMA_PAGO) VALUES (@pago)";
                SqlCommand insertar = new SqlCommand(query, conexion);
                insertar.Parameters.AddWithValue("@pago", txt_Pago.Text);
                conexion.Open();
                try
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro ingresado correctamente.');", true);
                    insertar.ExecuteNonQuery();
                    conexion.Close();
                    Response.Redirect("/View/Pagos.aspx", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Ocurrio un error:')" + ex.Message, true);
                    txt_Pago.Text = "";
                    conexion.Close();
                }
            }
        }
    }
}