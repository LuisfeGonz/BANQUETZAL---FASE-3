using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class InicioCliente : System.Web.UI.Page
    {
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

            string nombre = Session["nombres"].ToString();

            nombreLogged.Text = "Hola, " + nombre + ".";

        }
    }
}