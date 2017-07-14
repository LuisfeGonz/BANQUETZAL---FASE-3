using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class InicioMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            int rol = Convert.ToInt32(Session["rol"]);
            if (rol > 0)
            {
                Response.Redirect("InicioTrabajador.aspx");
            }
            else if (rol < 0)
            {
                Response.Redirect("InicioCliente.aspx");
            }
            */
        }
    }
}