using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class Retiro : System.Web.UI.Page
    {
        SWFase3.Fase3 swjava;

        public Retiro()
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
            else if (rol != 3)
            {
                Response.Redirect("TrabajadorSinPermisos.aspx");
            }
        }

        protected void retirar_Click(object sender, EventArgs e)
        {
            int cuenta = Convert.ToInt32(this.cuenta.Text);
            long monto = Convert.ToInt64(this.monto.Text);
            estado.Text = swjava.retirar(cuenta, monto);
        }

        protected void verificar_Click(object sender, EventArgs e)
        {
            int cuenta = Convert.ToInt32(this.cuenta.Text);
            SWFase3.cliente cliente = swjava.mostrarPropietarioDeCuenta(cuenta);
            cui.Text = cliente.cui.ToString();
            nombre.Text = cliente.nombre + " " + cliente.apellido;
            retirar.Enabled = true;
        }
    }
}