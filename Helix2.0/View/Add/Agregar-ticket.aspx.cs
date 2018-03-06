using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View.Add
{
    public partial class Agregar_ticket : System.Web.UI.Page
    {
        public class Conexion
        {
            public static SqlConnection ObtenerConexion()
            {
                return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["HelixConnectionString"].ConnectionString);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            dl_Estado.Items.Insert(0, " - Primero seleccione un Flujo - ");
        }

        protected void Bt_agregar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "INSERT INTO HELIX_TICKET (ID_CLIENTE,ID_USUARIO,ID_FLUJO,ID_ETAPAFLUJO,ID_FORMAPAGO,NOMBRE_TICKET,DESCRIPCION_TICKET,FECHA_ENTREGA,FECHA_FACTURA) VALUES (@cliente,@usuario,@flujo,@etapa,@pago,@nombre,@descripcion,@fechaE,@fechaF)";
                SqlCommand insertar = new SqlCommand(query, conexion);
                insertar.Parameters.AddWithValue("@cliente", dl_Cliente.SelectedValue);
                insertar.Parameters.AddWithValue("@usuario", dl_Responsable.SelectedValue);
                insertar.Parameters.AddWithValue("@flujo", dl_Flujo.SelectedValue);
                insertar.Parameters.AddWithValue("@etapa", dl_Estado.SelectedValue);
                insertar.Parameters.AddWithValue("@pago", dl_Pago.SelectedValue);
                insertar.Parameters.AddWithValue("@nombre", txt_Nombre_Ticket.Text);
                insertar.Parameters.AddWithValue("@descripcion", txt_Descripcion.Text);
                insertar.Parameters.AddWithValue("@fechaE", fecha_Entrega.SelectedDate);
                insertar.Parameters.AddWithValue("@fechaF", fecha_Pago.SelectedDate);
                conexion.Open();
                try
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro ingresado correctamente.');", true);
                    insertar.ExecuteNonQuery();
                    conexion.Close();
                    Response.Redirect("/View/Tickets.aspx", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Ocurrio un error:')" + ex.Message, true);
                    conexion.Close();
                }
                conexion.Close();
            }
        }
        protected void Carga_etapas(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "SELECT ID_ETAPAFLUJO, NOMBRE_ETAPA FROM HELIX_ETAPA_FLUJO WHERE ID_FLUJO ='"+dl_Flujo.SelectedValue +"'";
                SqlCommand etapas = new SqlCommand(query, conexion);
                SqlDataAdapter sDa = new SqlDataAdapter(etapas);
                DataSet ds = new DataSet();
                sDa.Fill(ds);
                dl_Estado.DataSource = ds;
                dl_Estado.DataTextField = "NOMBRE_ETAPA";
                dl_Estado.DataValueField = "ID_ETAPAFLUJO";
                dl_Estado.DataBind();
            }
        }
    }
}