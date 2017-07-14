using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class CerrarSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();            
            Session["cui"] = null;
            Session["nombres"] = null;
            Session["apellidos"] = null;
            Session["rol"] = "0";
            Session["usuario"] = null;
            Session["contrasena"] = null;
        }
    }
}