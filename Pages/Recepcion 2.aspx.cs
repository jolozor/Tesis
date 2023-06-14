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
using System.Windows;
using MessageBox = System.Windows.MessageBox;
using System.IdentityModel.Tokens;

namespace Tesis.Pages
{
    public partial class Recepcion_2 : System.Web.UI.Page
    {
        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;Port=5432;Database=sertinf;Userid=postgres;Password=qwerty");
        protected void Page_Load(object sender, EventArgs e)
        {
            GetRecepcion2();
        }

        void GetRecepcion2()
        {
            conn.Open();
            string datosrecepcion2 = "SELECT cs.servi AS Nro_Servicio, cs.fecha as FECHA, u.usuario_nom as Usuario, cl.clie_cod as Codigo_cliente, cl.clie_ci as CI_Cliente, cl.clie_nom as Cliente, cl.clie_ruc as RUC_Cliente, " +
                "dr.idrece as Recepcion_Nro, eq.equiponom as Nombre_Equipo, ma.marcanom as Equipo_Marca, dr.comentario as Comentario " +
                "FROM servicio.cabecera_servicio cs, usuario u, caja.cliente cl, servicio.detalle_recepcion dr, servicio.equipo eq, servicio.marca ma " +
                "WHERE cs.usuario_cod=u.usuario_cod and cs.codclie=cl.clie_cod and cs.servi=dr.servi and dr.idequi=eq.idequi and dr.idmar=ma.idmar";
            
            NpgsqlDataAdapter datarecepcion2 = new NpgsqlDataAdapter(datosrecepcion2, conn);
            DataTable dt2 = new DataTable();
            datarecepcion2.Fill(dt2);
            gvrecepcion2.DataSource = dt2;
            gvrecepcion2.DataBind();
            conn.Close();
        }

       

        protected void BtnCancelarbusqueda_Click(object sender, EventArgs e)
        {
            GetRecepcion2();
            Busquedainteractiva2.Text = "";
        }

        protected void Busquedainteractiva2_TextChanged(object sender, EventArgs e)
        {
            string Textbusqueda = Busquedainteractiva2.Text;
            conn.Open();
            string datosrecepcion3 = "SELECT cs.servi AS Nro_Servicio, cs.fecha as FECHA, u.usuario_nom as Usuario, cl.clie_cod as Codigo_cliente, cl.clie_ci as CI_Cliente, cl.clie_nom as Cliente, cl.clie_ruc as RUC_Cliente, " +
                    "dr.idrece as Recepcion_Nro, eq.equiponom as Nombre_Equipo, ma.marcanom as Equipo_Marca, dr.comentario as Comentario " +
                    "FROM servicio.cabecera_servicio cs, usuario u, caja.cliente cl, servicio.detalle_recepcion dr, servicio.equipo eq, servicio.marca ma " +
                    "WHERE cs.usuario_cod=u.usuario_cod and cs.codclie=cl.clie_cod and cs.servi=dr.servi and dr.idequi=eq.idequi and dr.idmar=ma.idmar and cl.clie_nom ILIKE '%" + @Textbusqueda + "%';";
            NpgsqlDataAdapter datarecepcion3 = new NpgsqlDataAdapter(datosrecepcion3, conn);
            
            DataTable dt3 = new DataTable();
            datarecepcion3.Fill(dt3);
            gvrecepcion2.DataSource = dt3;
            gvrecepcion2.DataBind();
            conn.Close();
        }
    }
}