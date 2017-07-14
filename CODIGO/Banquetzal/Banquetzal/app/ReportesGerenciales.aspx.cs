using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class ReportesGerenciales : System.Web.UI.Page
    {
        ListItem item;

        protected void Page_Load(object sender, EventArgs e)
        {
            //verificar usuario loggeado
            int rol = Convert.ToInt32(Session["rol"]);

            if (rol == -1)
            {
                Response.Redirect("InicioCliente.aspx");
            }
            else if (rol == 0)
            {
                Response.Redirect("PaginaInicio.aspx");
            }
            else if (rol != 1 && rol != 2)
            {
                Response.Redirect("InicioTrabajador.aspx");
            }

            if (!IsPostBack)
            {
                item = new ListItem("--Seleccionar--", "-1");
                ddlAlcance.Items.Add(item);
                item = new ListItem("Esta agencia", "ReportesGerentesAgencia.aspx");
                ddlAlcance.Items.Add(item);
                item = new ListItem("Todas las agencias", "ReportesGerentesGenerales.aspx");
                ddlAlcance.Items.Add(item);
            }
        }

        protected void ddlAlcance_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Convert.ToInt32(ddlAlcance.SelectedValue);
                estado.Text = "Seleccione una opcion.";
            }
            catch (Exception)
            {
                Response.Redirect(ddlAlcance.SelectedValue);
            }
        }
    }
}