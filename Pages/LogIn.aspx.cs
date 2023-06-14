using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing.Imaging;
using System.EnterpriseServices;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Runtime.Serialization.Configuration;
using System.Security.RightsManagement;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Windows.Forms.VisualStyles;
using System.Xml.Linq;

namespace Tesis.Pages
{

    public partial class LogIn: System.Web.UI.Page
    {
        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;Port=5432;Database=sertinf;Userid=postgres;Password=qwerty");

        
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarListempresa();
        }

        public void LlenarListempresa()
        {
            conn.Open();
            NpgsqlCommand cmdempresa = new NpgsqlCommand("SELECT codigo_emp, nombre FROM public.empresas", conn);
            NpgsqlDataAdapter daempresa = new NpgsqlDataAdapter(cmdempresa);
            DataSet dsempresa = new DataSet();
            daempresa.Fill(dsempresa);

            ComboBox1.DataSource = dsempresa;
            ComboBox1.DataTextField = "nombre";
            ComboBox1.DataValueField = "codigo_emp";
            ComboBox1.DataBind();
            conn.Close();   
        }
        
      
        public void Button1_Click(object sender, EventArgs e)
        {
            conn.Open();
            NpgsqlCommand comando = new NpgsqlCommand("SELECT usuario_nom, usuario_password, usuario_cod, union_emp_id_union, idemp FROM usuario where activador_ac_cod=1 and usuario_nom='" + TextBox1.Text +"' and usuario_password='"+ TextBox2.Text + "' and idemp='" + ComboBox1.SelectedValue + "'", conn);
           
            NpgsqlDataReader lector= comando.ExecuteReader();
            
            if (lector.Read())
            {
             
              Session["loginusuario"] = lector["usuario_cod"];
                Session["loginempresa"] = lector["idemp"];
                Response.Redirect("Home.aspx");
                
            }
            else
            {
                Label1.Text = "Usuario o Contraseña Incorrectos";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            conn.Close();
        }
    }
}