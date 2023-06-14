using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Windows.Forms;

namespace Tesis.Pages
{

    public partial class Cargo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetCargos();
        }

        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;Port=5432;Database=sertinf;Userid=postgres;Password=qwerty");
        
        void GetCargos()
        {
            conn.Open();
            string datoscargos = "Select * from cargo";
            NpgsqlDataAdapter datacargos = new NpgsqlDataAdapter(datoscargos, conn);
            DataTable dt = new DataTable();
            datacargos.Fill(dt);
            gvcargos.DataSource = dt;
            gvcargos.DataBind();
            conn.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            conn.Open();
            string insertQuery = "INSERT INTO public.cargo (descripcion) VALUES ('" + inputcargo.Text + "')";
            NpgsqlCommand prueba = new NpgsqlCommand(insertQuery, conn);
            NpgsqlDataReader dr = prueba.ExecuteReader();
            dr.Read();
            inputcargo.Text = String.Empty;
            conn.Close();
            Response.Redirect("Cargo.aspx");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }
    }
}