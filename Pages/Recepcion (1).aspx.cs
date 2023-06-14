using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows.Forms;
using Microsoft.VisualBasic.ApplicationServices;
using System.Web.Services.Description;
using Microsoft.VisualC.StlClr;
using System.Security.Cryptography;
using System.Security.RightsManagement;
using System.Windows.Controls;
using System.Drawing;
using System.Web.UI.MobileControls;
using System.Web.DynamicData;

namespace Tesis.Pages
{
    public partial class Recepcion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            LlenarListmarca();
            LlenarListtipoequipo();
            GetRecepcion();


        }

        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;Port=5432;Database=sertinf;Userid=postgres;Password=qwerty");
        

        protected void Btnnewmarca_click(Object sender, EventArgs e)
        {
            Response.Redirect("Marca.aspx");
        }

        protected void Btnnewtipo_click(Object sender, EventArgs e)
        {
            Response.Redirect("tipoequipo.aspx");
        }

        public void cargarcliente()
        {

        }

        public void LlenarListmarca()
        {
            conn.Open();
            NpgsqlCommand cmdmarca = new NpgsqlCommand("SELECT idmar, marcanom FROM servicio.marca", conn);
            NpgsqlDataAdapter damarca = new NpgsqlDataAdapter(cmdmarca);
            DataSet dsmarca = new DataSet();
            damarca.Fill(dsmarca);

            ComboBox1.DataSource = dsmarca;
            ComboBox1.DataTextField = "marcanom";
            ComboBox1.DataValueField = "idmar";
            ComboBox1.DataBind();
            conn.Close();

        }

        public void LlenarListtipoequipo()
        {
            conn.Open();

            NpgsqlCommand cmdtipo = new NpgsqlCommand("SELECT idequi, equiponom FROM servicio.equipo", conn);
            NpgsqlDataAdapter datipo = new NpgsqlDataAdapter(cmdtipo);
            DataSet dstipo = new DataSet();
            datipo.Fill(dstipo);

            ComboBox2.DataSource = dstipo;
            ComboBox2.DataTextField = "equiponom";
            ComboBox2.DataValueField = "idequi";
            ComboBox2.DataBind();
            conn.Close();

        }

        protected void btnguardarmodal_Click(object sender, ImageClickEventArgs e)
        {
            conn.Open();
            string insertQuery = "INSERT INTO servicio.marca (marcanom) VALUES ('" + inputmarca.Text + "')";
            NpgsqlCommand prueba = new NpgsqlCommand(insertQuery, conn);
            NpgsqlDataReader drm = prueba.ExecuteReader();
            drm.Read();
            inputmarca.Text = String.Empty;
            conn.Close();
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            conn.Open();

            string insertQuery = "INSERT INTO servicio.marca (marcanom) VALUES ('" + inputmarca.Text + "')";
            NpgsqlCommand prueba = new NpgsqlCommand(insertQuery, conn);
            NpgsqlDataReader drm = prueba.ExecuteReader();
            drm.Read();
            inputmarca.Text = String.Empty;
            conn.Close();
            LlenarListmarca();
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            conn.Open();

            string insertQuery = "INSERT INTO servicio.equipo(equiponom) VALUES ('" + inputtipoequipo.Text + "');";
            NpgsqlCommand prueba = new NpgsqlCommand(insertQuery, conn);
            NpgsqlDataReader drm = prueba.ExecuteReader();
            drm.Read();
            inputtipoequipo.Text = String.Empty;
            conn.Close();
            LlenarListtipoequipo();
            conn.Close();

        }

        protected void btnbuscar2_Click(object sender, ImageClickEventArgs e)
        {
            conn.Open();

            Int32 clieci = Convert.ToInt32(txtdoccliente.Text);
            NpgsqlCommand cmdcliente = new NpgsqlCommand("SELECT clie_cod, clie_ruc, clie_nom FROM caja.cliente where clie_ci= '" + clieci + "'", conn);
            NpgsqlDataReader drm = cmdcliente.ExecuteReader();
            drm.Read();
            
            Inputnombre.Text = drm["clie_nom"].ToString();
            txtcodcliente.Text = drm["clie_cod"].ToString();
            txtruc.Text = drm["clie_ruc"].ToString();
            conn.Close();

        }

        protected void btnuscar1_Click(object sender, EventArgs e)
        {
            conn.Open();
            int nuevo;
            NpgsqlCommand nuevoservicio = new NpgsqlCommand("SELECT MAX(servi)+1 FROM servicio.cabecera_servicio;", conn);
            NpgsqlDataReader newservice = nuevoservicio.ExecuteReader();
            newservice.Read();
            nuevo = Int32.Parse(newservice[0].ToString());

            codrecepcion.Text = nuevo.ToString();
            conn.Close();
        }

        
        
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            conn.Open();
            
            NpgsqlCommand nuevarecepcion = new NpgsqlCommand("INSERT INTO servicio.cabecera_servicio (fecha, fechahora, usuario_cod, union_emp_id_union, codclie, estado) VALUES (now(), now(), 1, 1, '" + txtcodcliente.Text + "', 'ACTIVO') RETURNING servi;", conn);
            NpgsqlDataReader newrecepcion = nuevarecepcion.ExecuteReader();
            newrecepcion.Read();

            int recepcioncod = Convert.ToInt16(newrecepcion["servi"]);
            MessageBox.Show(Convert.ToString(recepcioncod));

            Label1.Text = Convert.ToString(newrecepcion["servi"]);
            if (recepcioncod > 0)
            {
                newrecepcion.Close();
                
                NpgsqlCommand detallerecepcion = new NpgsqlCommand("INSERT INTO servicio.detalle_recepcion(servi, fecha, comentario, idequi, idmar) VALUES('" + Label1.Text + "', now(), '" + txtdetallesr.Text + "', '" + ComboBox2.SelectedValue+ "', '" + ComboBox1.SelectedValue+ "') returning idrece;", conn);
                NpgsqlDataReader newdetalle = detallerecepcion.ExecuteReader();
                newdetalle.Read();
                int detallecod = Convert.ToInt16(newdetalle["idrece"]);
                if (detallecod > 0)
                {
                    MessageBox.Show("Recepcion Grabada");
                    
                }
               


            }
            Response.Redirect("Recepcion.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Recepcion.aspx");
        }


        void GetRecepcion()
        {
            conn.Open();
            string datosrecepcion = "SELECT cs.servi AS Nro_Servicio, cs.fecha as FECHA, u.usuario_nom as Usuario, cl.clie_cod as Codigo_cliente, cl.clie_ci as CI_Cliente, cl.clie_nom as Cliente, cl.clie_ruc as RUC_Cliente, " +
                "dr.idrece as Recepcion_Nro, eq.equiponom as Nombre_Equipo, ma.marcanom as Equipo_Marca, dr.comentario as Comentario " +
                "FROM servicio.cabecera_servicio cs, usuario u, caja.cliente cl, servicio.detalle_recepcion dr, servicio.equipo eq, servicio.marca ma " +
                "WHERE cs.usuario_cod=u.usuario_cod and cs.codclie=cl.clie_cod and cs.servi=dr.servi and dr.idequi=eq.idequi and dr.idmar=ma.idmar ORDER BY cs.servi DESC";
            NpgsqlDataAdapter datarecepcion = new NpgsqlDataAdapter(datosrecepcion, conn);
            DataTable dt = new DataTable();
            datarecepcion.Fill(dt);
            gvrecepcion.DataSource = dt;
            gvrecepcion.DataBind();
            conn.Close();

        }
     

        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvrecepcion, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e) 
        {
            conn.Open();
            if (e.CommandName == "Select")
            {
                Int32 rowindex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvrecepcion.Rows[rowindex];
                codrecepcion.Text = row.Cells[1].Text;
                txtcodcliente.Text= row.Cells[4].Text;
                txtdoccliente.Text= row.Cells[5].Text;
                Inputnombre.Text= row.Cells[6].Text;
                txtruc.Text= row.Cells[7].Text;
                
                txtdetallesr.Text = row.Cells[11].Text;

                Label2.Text = Convert.ToString(row.Cells[1].Text);
                Int32 nroservi= Convert.ToInt32(Label2.Text);

                NpgsqlCommand selectcommand = new NpgsqlCommand("Select idequi, idmar from servicio.detalle_recepcion where servi='" + nroservi + "';", conn);
                
                NpgsqlDataReader selectadapter = selectcommand.ExecuteReader();
                selectadapter.Read();
                Int32 selectedvalueequi = Convert.ToInt32(selectadapter["idequi"]) -1;
                Int32 selectedvaluemarca = Convert.ToInt32(selectadapter["idmar"]) -1;

                ComboBox1.SelectedIndex = selectedvaluemarca;
                ComboBox2.SelectedIndex = selectedvalueequi;

            }
            conn.Close();
        }

        protected void btnsalir_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}
