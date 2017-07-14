using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class OperacionesCliente : System.Web.UI.Page
    {
        SWFase3.Fase3 swjava;
        ListItem item;
        public OperacionesCliente()
        {
            swjava = new SWFase3.Fase3();

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

            if (!IsPostBack)
            {
                //cargar tipos de operaciones
                item = new ListItem("--Seleccionar--", "-1");
                this.ddlOperacion.Items.Add(item);

                item = new ListItem("Estado de cuenta", "EstadoCuentaCliente.aspx");
                this.ddlOperacion.Items.Add(item);

                item = new ListItem("Transferencia", "TransferenciaCliente.aspx");
                this.ddlOperacion.Items.Add(item);

                item = new ListItem("Mis Puntos y Productos", "PuntosCanje.aspx");
                this.ddlOperacion.Items.Add(item);

            }
        }

        protected void listaTipoOperacion_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Convert.ToInt32(ddlOperacion.SelectedValue);
                estado.Text = "Seleccione una operacion.";
            }
            catch (Exception)
            {
                Response.Redirect(ddlOperacion.SelectedValue);
            }
        }
    }
}