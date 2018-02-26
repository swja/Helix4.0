using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View.Edit
{
    public partial class Editar_ticket : System.Web.UI.Page
    {
        public string identificador;
        public string flujo;
        public String usuario;
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
            if (IsPostBack == false) 
            {
                //recojo el valor del nombre de usuario que etsa en sesion para ponerlo en los comentarios
                usuario = Convert.ToString(Session["Nombres"]);
                txt_Cliente.Text = Application["cliente"].ToString();
                txt_Responsable.Text = Application["usuario"].ToString();
                txt_Nombre.Text = Application["nombre"].ToString();
                txt_Descripcion.Text = Application["descripción"].ToString();
                dl_Flujo.SelectedValue = Application["flujo"].ToString();
                flujo = Application["flujo"].ToString();
                dl_Pago.SelectedValue = Application["pago"].ToString();
                fecha_Entrega.SelectedDate = Convert.ToDateTime(Application["fechaE"]);
                fecha_Factura.SelectedDate = Convert.ToDateTime(Application["fechaF"]);
                    using (SqlConnection conexion = Conexion.ObtenerConexion())
                        {
                            string query = "SELECT ID_ETAPAFLUJO, NOMBRE_ETAPA FROM HELIX_ETAPA_FLUJO WHERE ID_FLUJO ='" + flujo + "'";
                            SqlCommand etapas = new SqlCommand(query, conexion);
                            SqlDataAdapter sDa = new SqlDataAdapter(etapas);
                            DataSet ds = new DataSet();
                            sDa.Fill(ds);
                            dl_Etapa.DataSource = ds;
                            dl_Etapa.DataTextField = "NOMBRE_ETAPA";
                            dl_Etapa.DataValueField = "ID_ETAPAFLUJO";
                            dl_Etapa.DataBind();
                            dl_Etapa.SelectedValue = Application["etapa"].ToString();
                        }
            }
        }
        protected void cargar_Etapas(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "SELECT ID_ETAPAFLUJO, NOMBRE_ETAPA FROM HELIX_ETAPA_FLUJO WHERE ID_FLUJO ='" + dl_Flujo.SelectedValue + "'";
                SqlCommand etapas = new SqlCommand(query, conexion);
                SqlDataAdapter sDa = new SqlDataAdapter(etapas);
                DataSet ds = new DataSet();
                sDa.Fill(ds);
                dl_Etapa.DataSource = ds;
                dl_Etapa.DataTextField = "NOMBRE_ETAPA";
                dl_Etapa.DataValueField = "ID_ETAPAFLUJO";
                dl_Etapa.DataBind();
            }
        }
        protected void Bt_editar_Click1(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "UPDATE HELIX_TICKET SET ID_FLUJO = @flujo, ID_ETAPAFLUJO = @etapa, DESCRIPCION_TICKET = @descripcion, FECHA_ENTREGA = @fechaE, FECHA_FACTURA = @fechaF, ID_FORMAPAGO = @pago WHERE ID_TICKET = @id";
                SqlCommand modificar = new SqlCommand(query, conexion);
                modificar.Parameters.AddWithValue("@flujo", dl_Flujo.SelectedValue);
                modificar.Parameters.AddWithValue("@etapa", dl_Etapa.SelectedValue);
                modificar.Parameters.AddWithValue("@descripcion", txt_Descripcion.Text);
                modificar.Parameters.AddWithValue("@fechaE", fecha_Entrega.SelectedDate);
                modificar.Parameters.AddWithValue("@fechaF", fecha_Factura.SelectedDate);
                modificar.Parameters.AddWithValue("@pago", dl_Pago.SelectedValue);
                modificar.Parameters.AddWithValue("@id", Convert.ToInt32(identificador));
                conexion.Open();
                try
                {
                    modificar.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro actualizado correctamente.');", true);
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
    }
}