using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class OpcionesNomina : System.Web.UI.Page
    {
        ListItem item;

        public OpcionesNomina()
        {
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Verificar rol logged
            int rol = Convert.ToInt32(Session["rol"]);
            long cui = Convert.ToInt64(Session["cui"]);

            if (rol == 0)
            {
                Response.Redirect("PaginaInicio.aspx");
            }
            else if (rol > 0)
            {
                Response.Redirect("InicioTrabajador.aspx");
            }

            if (!IsPostBack)
            {
                item = new ListItem("--Seleccionar--", "-1");
                ddlPagina.Items.Add(item);

                item = new ListItem("Agregar Empleado a Nomina", "AgregarEmpleadoNomina.aspx");
                ddlPagina.Items.Add(item);

                item = new ListItem("Pago de Salarios", "PagarSalarioNomina.aspx");
                ddlPagina.Items.Add(item);

                item = new ListItem("Solicitudes de prestamo", "VerSolicitudesPrestamoNomina.aspx");
                ddlPagina.Items.Add(item);
            }

        }

        protected void listaTipoOperacion_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Convert.ToInt32(ddlPagina.SelectedValue);
                estado.Text = "Seleccione una operacion";
            }
            catch (Exception)
            {
                Response.Redirect(ddlPagina.SelectedValue);
            }
        }
    }
}