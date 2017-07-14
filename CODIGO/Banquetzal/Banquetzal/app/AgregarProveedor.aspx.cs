using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class AgregarProveedor : System.Web.UI.Page
    {
        SWFase3.Fase3 swjava;

        public AgregarProveedor()
        {
            swjava = new SWFase3.Fase3();
        }

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
            else if (rol > 1)
            {
                Response.Redirect("InicioTrabajador.aspx");
            }
        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            string nombre = this.nombre.Text;
            string direccion = this.direccion.Text;
            estado.Text = swjava.agregarProveedor(nombre, direccion);
        }
    }
}