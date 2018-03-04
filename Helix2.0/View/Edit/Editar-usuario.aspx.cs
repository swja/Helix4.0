using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View.Edit
{
    public partial class Editar_usuario : System.Web.UI.Page
    {
        public string identificador;
        public class Encriptar
        {
            public static string GetMD5(string str)
            {
                MD5 md5 = MD5CryptoServiceProvider.Create();
                ASCIIEncoding encoding = new ASCIIEncoding();
                byte[] stream = null;
                StringBuilder sb = new StringBuilder();
                stream = md5.ComputeHash(encoding.GetBytes(str));
                for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
                return sb.ToString();
            }
        }
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
                txt_nombre.Text = Application["nombre"].ToString();
                txt_apellido.Text = Application["apellido"].ToString();
                txt_cargo.Text = Application["cargo"].ToString();
                txt_email.Text = Application["email"].ToString();
                txt_usuario.Text = Application["usuario"].ToString();
                dl_Cargo.SelectedValue = Application["rol"].ToString();
                txt_telefono.Text = Application["telefono"].ToString();
            } 
        }

        protected void Bt_editar_Click(object sender, EventArgs e)
        {
            string passC = Encriptar.GetMD5(txt_pass.Text);
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                if (txt_pass.Text == "")
                {
                    string query = "UPDATE HELIX_USUARIO SET ID_ROL = @rol, NOMBRE = @nombre, APELLIDO = @apellido, NOMBRE_USUARIO = @usuario, PASSWORD = @pass, MAIL = @mail, TELEFONO = @telefono, CARGO = @cargo WHERE ID_USUARIO = @id";
                    SqlCommand modificar = new SqlCommand(query, conexion);
                    modificar.Parameters.AddWithValue("@rol", dl_Cargo.SelectedValue);
                    modificar.Parameters.AddWithValue("@nombre", txt_nombre.Text);
                    modificar.Parameters.AddWithValue("@apellido", txt_apellido.Text);
                    modificar.Parameters.AddWithValue("@usuario", txt_usuario.Text);
                    modificar.Parameters.AddWithValue("@pass", Application["password"].ToString());
                    modificar.Parameters.AddWithValue("@mail", txt_email.Text);
                    modificar.Parameters.AddWithValue("@telefono", txt_telefono.Text);
                    modificar.Parameters.AddWithValue("@cargo", txt_cargo.Text);
                    modificar.Parameters.AddWithValue("@id", Convert.ToInt32(identificador));
                    conexion.Open();
                    try
                    {
                        modificar.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro actualizado correctamente.');", true);
                        Response.Redirect("/View/Usuarios.aspx", true);
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Ocurrio un error:')" + ex.Message, true);
                        conexion.Close();
                    }
                    conexion.Close();
                }
                else
                {
                    string query = "UPDATE HELIX_USUARIO SET ID_ROL = @rol, NOMBRE = @nombre, APELLIDO = @apellido, NOMBRE_USUARIO = @usuario, PASSWORD = @pass, MAIL = @mail, TELEFONO = @telefono, CARGO = @cargo WHERE ID_USUARIO = @id";
                    SqlCommand modificar = new SqlCommand(query, conexion);
                    modificar.Parameters.AddWithValue("@rol", dl_Cargo.SelectedValue);
                    modificar.Parameters.AddWithValue("@nombre", txt_nombre.Text);
                    modificar.Parameters.AddWithValue("@apellido", txt_apellido.Text);
                    modificar.Parameters.AddWithValue("@usuario", txt_usuario.Text);
                    modificar.Parameters.AddWithValue("@pass", passC);
                    modificar.Parameters.AddWithValue("@mail", txt_email.Text);
                    modificar.Parameters.AddWithValue("@telefono", txt_telefono.Text);
                    modificar.Parameters.AddWithValue("@cargo", txt_cargo.Text);
                    modificar.Parameters.AddWithValue("@id", Convert.ToInt32(identificador));
                    conexion.Open();
                    try
                    {
                        modificar.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro actualizado correctamente.');", true);
                        Response.Redirect("/View/Usuarios.aspx", true);
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
        protected void Bt_cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("/View/Usuarios.aspx", true);
        }
    }
}