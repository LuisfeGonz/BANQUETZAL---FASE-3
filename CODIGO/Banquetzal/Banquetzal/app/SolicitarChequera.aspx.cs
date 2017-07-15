using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class SolicitarChequera : System.Web.UI.Page
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
            else if (rol < 4)
            {
                Response.Redirect("TrabajadorSinPermisos.aspx");
            }
        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            int cuenta = Convert.ToInt32(this.cuenta.Text);

            ServicioWeb.ServicioWeb swjava = new ServicioWeb.ServicioWeb();
            long cuitrabajador = Convert.ToInt64(Session["cui"].ToString());

            bool chequera = swjava.solicitarChequera(cuenta, cuitrabajador);

            if (chequera)
            {
                estado_chequera.Text = "Se envio la solicitud.";
            }
            else
            {
                estado_chequera.Text = "Error al realizar la solicitud.";
            }
        }
    }
}