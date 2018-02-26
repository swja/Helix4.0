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
        protected void Bt_editar_Click(object sender, EventArgs e)
        {

        }
    }
}