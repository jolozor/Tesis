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
    public partial class Cliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetClientes();
        }

        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;Port=5432;Database=sertinf;Userid=postgres;Password=qwerty");


        void GetClientes()
        {
            conn.Open();
            string datosclientes = "Select * from caja.cliente";
            NpgsqlDataAdapter dataclientes = new NpgsqlDataAdapter(datosclientes, conn);
            DataTable dt = new DataTable();
            dataclientes.Fill(dt);
            gvclientes.DataSource = dt;
            gvclientes.DataBind();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            conn.Open();
            string insertQuery = "INSERT INTO caja.cliente (clie_ruc, clie_ci, clie_dir, clie_nom, denominacion, clie_celular, activador_ac_cod, usuario_usuario_cod, modif_usu, union_emp_id_union, tipoiden) VALUES ('" + inputruc.Text + "', '" + inputdocumento.Text + "', '" + inputdireccion.Text + "', '" + inputnombre.Text + "', '" + inputdenominacion.Text + "', '" + inputcelular.Text + "', 1,1,1,1,1 )";
            NpgsqlCommand prueba = new NpgsqlCommand(insertQuery, conn);
            NpgsqlDataReader drm = prueba.ExecuteReader();
            drm.Read();
            inputdocumento.Text = String.Empty;
            inputcelular.Text = String.Empty;
            inputdenominacion.Text= String.Empty;
            inputdireccion.Text = String.Empty;
            inputruc.Text = String.Empty;
            inputnombre.Text = String.Empty;
            conn.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }
    }
}