using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Npgsql;

namespace Tesis.Pages
{
    public class Conexion
    {
        NpgsqlConnection conn = new NpgsqlConnection("Server=localhost;Port=5432;Database=sertinf;Userid=postgres;Password=qwerty");

        static void Main(String[] args)
        {
            TestConnection();
            Console.ReadKey();
        }
        private static void TestConnection()
        {
            
            using(NpgsqlConnection con = GetConnection())
            {
                con.Open();
                if (con.State == ConnectionState.Open)
                {
                    
                }
            }
        }
        private static NpgsqlConnection GetConnection()
        {
            return new NpgsqlConnection(@"Server=localhost;Port=5432;User id=postgres;Password=qwerty;Database=sertinf");
        }

        
        public DataSet obtenerinfo(string filtro)
        {
            DataSet ds = new DataSet();
            conn.Open();
            string datosrecepcion = "SELECT cs.servi AS Nro_Servicio, cs.fecha as FECHA, u.usuario_nom as Usuario, cl.clie_cod as Codigo_cliente, cl.clie_ci as CI_Cliente, cl.clie_nom as Cliente, cl.clie_ruc as RUC_Cliente, " +
                "dr.idrece as Recepcion_Nro, eq.equiponom as Nombre_Equipo, ma.marcanom as Equipo_Marca, dr.comentario as Comentario " +
                "FROM servicio.cabecera_servicio cs, usuario u, caja.cliente cl, servicio.detalle_recepcion dr, servicio.equipo eq, servicio.marca ma " +
                "WHERE cs.usuario_cod=u.usuario_cod and cs.codclie=cl.clie_cod and cs.servi=dr.servi and dr.idequi=eq.idequi and dr.idmar=ma.idmar";
            NpgsqlDataAdapter datarecepcion = new NpgsqlDataAdapter(datosrecepcion, conn);
            datarecepcion.Fill(ds);
            conn.Close();
            return ds;

        }

    }

}