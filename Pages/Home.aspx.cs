using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tesis.Pages
{
    public partial class Home : System.Web.UI.Page
    {
        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;Port=5432;Database=sertinf;Userid=postgres;Password=qwerty");

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["loginusuario"] == null)
                {
                    Response.Redirect("LogIn.aspx");

                }
            }
            //string vusuario = Session["Loginusuario"].ToString();
            //conn.Open();
            //NpgsqlCommand comando = new NpgsqlCommand("SELECT usuario_nom FROM usuario where usuario_cod= '" + vusuario + "'", conn);

            //NpgsqlDataReader lector = comando.ExecuteReader();
            //lector.Read();
            //Label1.Text = lector["usuario_nom"].ToString();

        }

    }
}