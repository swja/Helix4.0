using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Helix2._0.View.Add
{
    public partial class Agregar_Usuario : System.Web.UI.Page
    {
        string password;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
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
        protected void Bt_agregar_Click(object sender, EventArgs e)
        {
            password = Encriptar.GetMD5(txt_pass.Text);
            using (SqlConnection conexion = Conexion.ObtenerConexion())
            {
                string query = "INSERT INTO HELIX_USUARIO (ID_ROL, NOMBRE, APELLIDO, NOMBRE_USUARIO,PASSWORD, MAIL,TELEFONO,CARGO) VALUES (@rol,@nombre,@apellido,@usuario,@pass,@mail,@telefono,@cargo)";
                SqlCommand insertar = new SqlCommand(query, conexion);
                insertar.Parameters.AddWithValue("@rol", dl_Cargo.SelectedValue);
                insertar.Parameters.AddWithValue("@nombre", txt_nombre.Text);
                insertar.Parameters.AddWithValue("@apellido", txt_apellido.Text);
                insertar.Parameters.AddWithValue("@usuario", txt_usuario.Text);
                insertar.Parameters.AddWithValue("@pass", password);
                insertar.Parameters.AddWithValue("@mail", txt_email.Text);
                insertar.Parameters.AddWithValue("@telefono", txt_telefono.Text);
                insertar.Parameters.AddWithValue("@cargo", txt_cargo.Text);
                conexion.Open();
                try
                {
                    insertar.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Registro ingresado correctamente.');", true);
                    conexion.Close();
                    Response.Redirect("/View/Usuarios.aspx", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Ocurrio un error:')" + ex.Message, true);
                    conexion.Close();
                }
            }
        }
        protected void Bt_cancelar_Click1(object sender, EventArgs e)
        {
            Response.Redirect("/View/Usuarios.aspx", true);
        }
    }
}