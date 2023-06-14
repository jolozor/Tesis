using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;
using System.Data;
using System.Reflection.Emit;
using System.Windows.Forms;

namespace Tesis
{
    public partial class MP : System.Web.UI.MasterPage
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
        }

        protected void salir_click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("LogIn.aspx");
        }
    }
}