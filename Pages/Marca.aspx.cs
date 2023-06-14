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
    public partial class Marca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetMarcas();
        }
        
        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;Port=5432;Database=sertinf;Userid=postgres;Password=qwerty");

        void GetMarcas()
        {
            conn.Open();
            string datosmarcas = "Select * from servicio.marca";
            NpgsqlDataAdapter datamarcas = new NpgsqlDataAdapter(datosmarcas, conn);
            DataTable dt = new DataTable();
            datamarcas.Fill(dt);
            gvmarcas.DataSource = dt;
            gvmarcas.DataBind();
            conn.Close();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            conn.Open();
            string insertQuery = "INSERT INTO servicio.marca (marcanom) VALUES ('" + inputmarca.Text + "')";
            NpgsqlCommand prueba = new NpgsqlCommand(insertQuery, conn);
            NpgsqlDataReader drm = prueba.ExecuteReader();
            drm.Read();
            inputmarca.Text = String.Empty;
            conn.Close();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }
    }
}