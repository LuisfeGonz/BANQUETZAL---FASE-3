using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class ReportesGerentesGenerales : System.Web.UI.Page
    {
        DataTable tablaAux;
        DataColumn columna;
        DataRow fila;

        ListItem item;

        SWFase3.Fase3 swjava;

        public ReportesGerentesGenerales()
        {
            swjava = new SWFase3.Fase3();
        }

        public void tablaNueva(int tiporeporte)
        {
            tablaAux = new DataTable();

            //reporte de proveedores mas solicitados
            if (tiporeporte == 1)
            {
                //Titulos columnas
                columna = new DataColumn();
                columna.ColumnName = "ID";
                tablaAux.Columns.Add(columna);

                columna = new DataColumn();
                columna.ColumnName = "NOMBRE";
                tablaAux.Columns.Add(columna);

                columna = new DataColumn();
                columna.ColumnName = "DIRECCION";
                tablaAux.Columns.Add(columna);

                columna = new DataColumn();
                columna.ColumnName = "CANJES SOLICITADOS";
                tablaAux.Columns.Add(columna);

                reporteProveedores();
            }
            //Reporte de Productos mas solicitados
            else if (tiporeporte == 2)
            {
                //Titulos columnas
                columna = new DataColumn();
                columna.ColumnName = "ID";
                tablaAux.Columns.Add(columna);

                columna = new DataColumn();
                columna.ColumnName = "NOMBRE";
                tablaAux.Columns.Add(columna);

                columna = new DataColumn();
                columna.ColumnName = "VALOR (EN PUNTOS)";
                tablaAux.Columns.Add(columna);

                columna = new DataColumn();
                columna.ColumnName = "CANJES SOLICITADOS";
                tablaAux.Columns.Add(columna);

                reporteProductos();
            }
            //Reporte de Actividad de agencias
            else
            {
                //Titulos columnas
                columna = new DataColumn();
                columna.ColumnName = "ID";
                tablaAux.Columns.Add(columna);

                columna = new DataColumn();
                columna.ColumnName = "NOMBRE";
                tablaAux.Columns.Add(columna);
                //SEMANALES
                columna = new DataColumn();
                columna.ColumnName = "INGRESOS";
                tablaAux.Columns.Add(columna);

                columna = new DataColumn();
                columna.ColumnName = "RETIROS";
                tablaAux.Columns.Add(columna);
                reporteAgencias();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //Verificar usuario loggeado
            int rol = Convert.ToInt32(Session["rol"]);
            if (rol == -1)
            {
                Response.Redirect("InicioCliente.aspx");
            }
            else if (rol == 0)
            {
                Response.Redirect("PaginaInicio.aspx");
            }
            else if (rol > 1)
            {
                Response.Redirect("InicioTrabajador.aspx");
            }

            if (!IsPostBack)
            {
                item = new ListItem("--Seleccionar--", "-1");
                ddlReporte.Items.Add(item);
                item = new ListItem("Proveedores mas solicitados", "1");
                ddlReporte.Items.Add(item);
                item = new ListItem("Productos mas solicitados", "2");
                ddlReporte.Items.Add(item);
                item = new ListItem("Actividad de agencias", "3");
                ddlReporte.Items.Add(item);
            }
        }

        protected void verReporte_Click(object sender, EventArgs e)
        {
            int tiporeporte = Convert.ToInt32(ddlReporte.SelectedValue);

            if (tiporeporte != -1)
            {
                tablaNueva(tiporeporte);
            }
            else
            {
                estado.Text = "Seleccione un tipo de reporte.";
            }
        }

        protected void reporteProveedores()
        {
            SWFase3.proveedor[] listaProveedor = swjava.mostarProveedoresMasSolicitados();

            for (int i = 0; i < listaProveedor.Length; i++)
            {
                this.fila = tablaAux.NewRow();
                fila["ID"] = listaProveedor[i].id;
                fila["NOMBRE"] = listaProveedor[i].nombre;
                fila["DIRECCION"] = listaProveedor[i].direccion;
                fila["CANJES SOLICITADOS"] = listaProveedor[i].canjes;
                tablaAux.Rows.Add(fila);
            }

            tablaReporte.DataSource = tablaAux;
            tablaReporte.DataBind();
        }

        protected void reporteProductos()
        {
            SWFase3.producto[] listaProducto = swjava.mostarProductosMasSolicitados();

            for (int i = 0; i < listaProducto.Length; i++)
            {
                this.fila = tablaAux.NewRow();
                fila["ID"] = listaProducto[i].id;
                fila["NOMBRE"] = listaProducto[i].nombre;
                fila["VALOR (EN PUNTOS)"] = listaProducto[i].valor;
                fila["CANJES SOLICITADOS"] = listaProducto[i].canjes;
                tablaAux.Rows.Add(fila);
            }

            tablaReporte.DataSource = tablaAux;
            tablaReporte.DataBind();
        }

        protected void reporteAgencias()
        {

        }
    }
}