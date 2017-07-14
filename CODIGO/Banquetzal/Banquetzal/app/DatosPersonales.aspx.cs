using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class DatosPersonales : System.Web.UI.Page
    {
        ServicioWeb.ServicioWeb swjava = new ServicioWeb.ServicioWeb();
        protected void Page_Load(object sender, EventArgs e)
        {
            int rol = Convert.ToInt32(Session["rol"]);
            long cui = Convert.ToInt64(Session["cui"]);

            if (rol == 0)
            {
                Response.Redirect("PaginaInicio.aspx");
            }
            else if (rol != -1)
            {
                Response.Redirect("InicioTrabajador.aspx");
            }

            if (!IsPostBack)
            {
                ServicioWeb.cliente cliente = swjava.mostrarDatosCliente(cui);
                this.cui.Text = cliente.cui.ToString();
                usuario.Text = cliente.usuario;
                nombres.Text = cliente.nombre;
                apellidos.Text = cliente.apellido;
                nacimiento.Text = cliente.nacimiento;
                puntos.Text = cliente.puntos.ToString();
            }

        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            long cui = Convert.ToInt64(this.cui.Text);
            string usuario = this.usuario.Text;
            string nombres = this.nombres.Text;
            string apellidos = this.apellidos.Text;
            string nacimiento = this.nacimiento.Text;

            estado_actualizacion.Text = swjava.actualizarDatosCliente(cui, usuario, nombres, apellidos, nacimiento);

        }
    }
}