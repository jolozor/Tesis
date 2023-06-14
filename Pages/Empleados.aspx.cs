using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Xml.Linq;

namespace Tesis.Pages
{
    public partial class Empleados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarDropDownList();
            GetEmpleados();
        }

        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;Port=5432;Database=sertinf;Userid=postgres;Password=qwerty");

        void GetEmpleados()
        {
            conn.Open();
            string datosempleados = "Select * from public.empleado";
            NpgsqlDataAdapter dataempleados = new NpgsqlDataAdapter(datosempleados, conn);
            DataTable dt = new DataTable();
            dataempleados.Fill(dt);
            gvempleados.DataSource = dt;
            gvempleados.DataBind();
            conn.Close();

        }

        public void LlenarDropDownList()
        {
            conn.Open();
            NpgsqlCommand cmd = new NpgsqlCommand("SELECT idcargo, descripcion FROM public.cargo", conn);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            ComboBox1.DataSource = ds;
            ComboBox1.DataTextField = "descripcion";
            ComboBox1.DataValueField = "idcargo";
            ComboBox1.DataBind();
            conn.Close();
        }


        protected void Button1_Click(Object sender, EventArgs e)
        {
            conn.Open();
            NpgsqlCommand prueba = new NpgsqlCommand("INSERT INTO public.empleado (ci, nombre, direccion, celular, email, idcargo) VALUES ('" + txtdocumento.Text + "', '" + txtnombre.Text + "', '" + txtdireccion.Text + "', '" + txtcelular.Text + "', '" + txtcorreo.Text + "', '" + ComboBox1.SelectedValue+ "')", conn);
            NpgsqlDataReader drm = prueba.ExecuteReader();
            drm.Read();
            MessageBox.Show(ComboBox1.SelectedValue);            
            txtcelular.Text = String.Empty;
            txtcorreo.Text = String.Empty;
            txtdireccion.Text = String.Empty;
            txtdocumento.Text = String.Empty;
            txtnombre.Text = String.Empty;
            
            conn.Close();
        }

        protected void Button2_Click(Object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);

        }

        protected void Button3_Click(Object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);

        }

        protected void Button4_Click(Object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}