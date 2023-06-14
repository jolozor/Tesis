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
    public partial class tipoequipo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GettipoEquipo();
        }

        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;Port=5432;Database=sertinf;Userid=postgres;Password=qwerty");

        void GettipoEquipo()
        {
            conn.Open();
            string datostipoequipos = "Select * from servicio.equipo";
            NpgsqlDataAdapter datatipoequipos = new NpgsqlDataAdapter(datostipoequipos, conn);
            DataTable dt = new DataTable();
            datatipoequipos.Fill(dt);
            gvtipoequipo.DataSource = dt;
            gvtipoequipo.DataBind();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            conn.Open();
            string insertQuery = "INSERT INTO servicio.equipo(equiponom) VALUES ('" + inputtipoequipo.Text + "');";
            NpgsqlCommand prueba = new NpgsqlCommand(insertQuery, conn);
            NpgsqlDataReader drm = prueba.ExecuteReader();
            drm.Read();
            inputtipoequipo.Text = String.Empty;
            conn.Close();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click1(object sender, EventArgs e)
        {

        }
    }
}