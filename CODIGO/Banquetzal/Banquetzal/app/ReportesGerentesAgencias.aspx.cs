using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal
{
    public partial class ReportesGerentesAgencias : System.Web.UI.Page
    {
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
            else if (rol != 2)
            {
                Response.Redirect("InicioTrabajador.aspx");
            }
        }

        protected void verReporte_Click(object sender, EventArgs e)
        {

        }
    }
}