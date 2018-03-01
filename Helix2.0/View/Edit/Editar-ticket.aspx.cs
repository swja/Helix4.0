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
        public int identificador;
        public string flujo;
        public int id_Usuario;
        public int id_Cliente;
        public string fecha = DateTime.Now.ToString("dd/MM/yyyy");
        public class Conexion
        {
            public static SqlConnection ObtenerConexion()
            {
                return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["HelixConnectionString"].ConnectionString);
            }
        }
        protected void carga_Comentarios()
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "SELECT ID_COMENTARIO AS #, COMENTARIO AS 'Comentario', FECHA_COMENTARIO AS 'Fecha', CONCAT(HELIX_USUARIO.NOMBRE, ' ', HELIX_USUARIO.APELLIDO) AS 'Usuario' FROM HELIX_COMENTARIO INNER JOIN HELIX_USUARIO ON HELIX_COMENTARIO.ID_USUARIO = HELIX_USUARIO.ID_USUARIO WHERE ID_TICKET = '" +identificador + "'";
                SqlCommand cmd = new SqlCommand(query, conexion);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvComentario.DataSource = dt;
                gvComentario.DataBind();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            identificador = Convert.ToInt32(Application["identidad"]);
            id_Usuario = Convert.ToInt32(Session["id"]);
            id_Cliente = Convert.ToInt32(Application["id_Cliente"]);
            if (IsPostBack == false) 
            {
                //recojo el valor del nombre de usuario que etsa en sesion para ponerlo en los comentarios
                //no se debe recoger el nombre de usuario sino el ID, al igual que el ID del cliente
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
                carga_Comentarios();
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
                modificar.Parameters.AddWithValue("@id", identificador);
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

        protected void Bt_agregar_comentario_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "INSERT INTO HELIX_COMENTARIO (ID_CLIENTE,ID_USUARIO,ID_TICKET,COMENTARIO,FECHA_COMENTARIO) VALUES (@cliente,@usuario,@ticket,@comentario,@fechaC)";
                SqlCommand insertar = new SqlCommand(query, conexion);
                insertar.Parameters.AddWithValue("@cliente", id_Cliente);
                insertar.Parameters.AddWithValue("@usuario", id_Usuario);
                insertar.Parameters.AddWithValue("@comentario", txt_Comentario.Text);
                insertar.Parameters.AddWithValue("@ticket", identificador);
                insertar.Parameters.AddWithValue("@fechaC", Convert.ToDateTime(fecha));
                conexion.Open();
                try
                {
                    insertar.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Comentario ingresado correctamente.');", true);
                    conexion.Close();
                    txt_Comentario.Text = "";
                    carga_Comentarios();
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