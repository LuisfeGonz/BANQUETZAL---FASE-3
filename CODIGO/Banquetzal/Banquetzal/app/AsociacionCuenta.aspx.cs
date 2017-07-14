using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class AsociacionCuenta : System.Web.UI.Page
    {
        SWFase3.Fase3 swjava;

        public AsociacionCuenta()
        {
            swjava = new SWFase3.Fase3();
        }

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

        protected void asociar_Click(object sender, EventArgs e)
        {
            long cui = Convert.ToInt64(this.cui.Text);
            int cuenta = Convert.ToInt32(this.cuenta.Text);
            estado.Text = swjava.asociarCuenta(cui, cuenta);
        }
    }
}