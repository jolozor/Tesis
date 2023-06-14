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

namespace Tesis.Pages
{
    class Busquedaviewmodel
    {
        public string Nro_Servico { get; set; }
        public string Fecha { get; set; }
        public string Usuario { get; set; }
        public string Cod_Cliente { get; set; }
        public string CI_Cliente { get; set; }
        public string Cliente { get; set; }
        public string RUC_Cliente { get; set; }
        public string Nro_Recepcion { get; set; }
        public string Tipo_Equipo { get; set; }
        public string Marca_Equipo { get; set; }
        public string Comentario { get; set; }


    }
}