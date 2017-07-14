using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class CambiarCheque : System.Web.UI.Page
    {
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
            else if (rol != 3)
            {
                Response.Redirect("TrabajadorSinPermisos.aspx");
            }
        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            ServicioWeb.ServicioWeb swjava = new ServicioWeb.ServicioWeb();

            int cuenta = Convert.ToInt32(this.cuenta.Text);
            long cheque = Convert.ToInt64(this.cheque.Text);
            string transaccionista = this.transaccionista.Text;
            long monto = Convert.ToInt64(this.monto.Text);
            long cuiTrabajador = Convert.ToInt64(Session["cui"].ToString());

            estado_cambio.Text = swjava.cambiarCheque(cuenta, cheque, monto, transaccionista, cuiTrabajador);

        }
    }
}