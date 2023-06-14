using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tesis.Pages
{
    public partial class Usuario : System.Web.UI.Page
    {

        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;Port=5432;Database=sertinf;Userid=postgres;Password=qwerty");

        void GetUsuarios()
        {
            conn.Open();
            string datosusuarios = "Select * from usuario";
            NpgsqlDataAdapter datausuarios = new NpgsqlDataAdapter(datosusuarios, conn);
            DataTable dt = new DataTable();
            datausuarios.Fill(dt);
            gvusuarios.DataSource = dt;
            gvusuarios.DataBind();
            conn.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            GetUsuarios();
        }


        protected void Button1_Click(object sender, ImageClickEventArgs e)
        {
            DateTime fecha = DateTime.Today;
            NpgsqlCommand prueba = new NpgsqlCommand("INSERT INTO public.usuario(usuario_nom, usuario_password, fecha_creacion, activador_ac_cod, usuario_cod, usuario, m_usuario, union_emp_id_union, idemp) VALUES ('" + txtusuario.Text + "','" + txtpassword.Text + "', @fecha, '1', '1', '1', null, '1', null)", conn);
            NpgsqlDataReader dr = prueba.ExecuteReader();
            dr.Read();
            conn.Close();
        }

        protected void btnModificar_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void Button2_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}