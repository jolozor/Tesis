using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Xml.Linq;

namespace Tesis.Pages
{
    public partial class Informes : System.Web.UI.Page
    {
        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;Port=5432;Database=sertinf;Userid=postgres;Password=qwerty");



        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        private void Filtrosinformes(object sender, EventArgs e)
        {
            
        }

        protected void Btngenerar_Click(Object sender, EventArgs e)
        {
            

        }
    }
}