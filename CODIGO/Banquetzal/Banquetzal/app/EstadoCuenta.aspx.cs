using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class EstadoCuenta : System.Web.UI.Page
    {
        DataTable tablaAux = new DataTable();
        DataColumn columna = new DataColumn();
        DataRow fila;

        ServicioWeb.ServicioWeb swjava;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Verificar usuario loggeado

            int rol = Convert.ToInt32(Session["rol"]);
            if (rol < 0)
            {
                Response.Redirect("InicioCliente.aspx");
            }
            else if (rol == 0)
            {
                Response.Redirect("PaginaInicio.aspx");
            }
            else if (rol < 4)
            {
                Response.Redirect("TrabajadorSinPermisos.aspx");
            }
        }

        public EstadoCuenta()
        {
            tablaAux = new DataTable();

            columna = new DataColumn();
            columna.ColumnName = "DEBE";
            tablaAux.Columns.Add(columna);

            columna = new DataColumn();
            columna.ColumnName = "HABER";
            tablaAux.Columns.Add(columna);

            columna = new DataColumn();
            columna.ColumnName = "OPERACION";
            tablaAux.Columns.Add(columna);

            columna = new DataColumn();
            columna.ColumnName = "FECHA";
            tablaAux.Columns.Add(columna);

            swjava = new ServicioWeb.ServicioWeb();
        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            PDF.Enabled = true;
            int idcuenta = Convert.ToInt32(this.cuenta.Text);
            string fechainicio = this.fechainicio.Text;
            string fechafin = this.fechafin.Text;


            ServicioWeb.estadoCuenta[] listaEstado = swjava.mostrarEstadoCuenta(idcuenta, fechainicio, fechafin, "debe");

            for (int i = 0; i < listaEstado.Length; i++)
            {
                this.fila = tablaAux.NewRow();
                fila["DEBE"] = listaEstado[i].monto;
                fila["HABER"] = "";
                fila["OPERACION"] = listaEstado[i].operacion;
                fila["FECHA"] = listaEstado[i].fecha;
                tablaAux.Rows.Add(fila);
            }

            listaEstado = swjava.mostrarEstadoCuenta(idcuenta, fechainicio, fechafin, "haber");

            for (int i = 0; i < listaEstado.Length; i++)
            {
                this.fila = tablaAux.NewRow();
                fila["DEBE"] = "";
                fila["HABER"] = listaEstado[i].monto;
                fila["OPERACION"] = listaEstado[i].operacion;
                fila["FECHA"] = listaEstado[i].fecha;
                tablaAux.Rows.Add(fila);
            }

            tablaEstado.DataSource = tablaAux;
            tablaEstado.DataBind();
        }

        protected void PDF_Click(object sender, EventArgs e)
        {
        }
    }
}