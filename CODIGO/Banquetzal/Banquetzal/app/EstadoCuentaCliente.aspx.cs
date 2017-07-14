using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class EstadoCuentaCliente : System.Web.UI.Page
    {
        ServicioWeb.ServicioWeb swjava;
        ListItem item;

        public EstadoCuentaCliente()
        {
            item = new ListItem();
            swjava = new ServicioWeb.ServicioWeb();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Verificar usuario loggeado
            int rol = Convert.ToInt32(Session["rol"]);
            if (rol > 0)
            {
                Response.Redirect("InicioTrabajador.aspx");
            }
            else if (rol == 0)
            {
                Response.Redirect("PaginaInicio.aspx");
            }
            //---------------------------

            if (!IsPostBack)
            {
                //cargar tipos de operaciones
                //string[] listaCuentas = swjava.mostrarCuentas(cui);

                //item = new ListItem("--Seleccionar", "-1");
                //this.ddlCuentas.Items.Add(item);
                //for (int i = 0; i < listaCuentas.Length; i++)
                //{
                //    item = new ListItem(listaCuentas[i].ToString());
                //    this.ddlCuentas.Items.Add(item);
                //}
                //----------------------------

                //Modalidades de estado de cuenta
                item = new ListItem("--Seleccionar", "-1");
                ddlTemporada.Items.Add(item);
                item = new ListItem("Hoy", "1");
                ddlTemporada.Items.Add(item);
                item = new ListItem("Ayer", "2");
                ddlTemporada.Items.Add(item);
                item = new ListItem("Esta semana", "3");
                ddlTemporada.Items.Add(item);
                item = new ListItem("Semana anterior", "4");
                ddlTemporada.Items.Add(item);
                item = new ListItem("Ultimos 7 dias", "5");
                ddlTemporada.Items.Add(item);
                item = new ListItem("Mes anterior", "6");
                ddlTemporada.Items.Add(item);
                item = new ListItem("Ultimos 2 meses", "7");
                ddlTemporada.Items.Add(item);
                item = new ListItem("Ultimos 3 meses", "8");
                ddlTemporada.Items.Add(item);
                item = new ListItem("Este mes", "9");
                ddlTemporada.Items.Add(item);
                item = new ListItem("Ultimos 5 movimientos", "10");
                ddlTemporada.Items.Add(item);
                //-----------------------------
            }
        }

        protected void verReporte_Click(object sender, EventArgs e)
        {
            if (!ddlTemporada.SelectedValue.Equals("-1"))
            {

            }
            else
            {
                estado.Text = "Elija un periodo";
            }
        }
    }
}