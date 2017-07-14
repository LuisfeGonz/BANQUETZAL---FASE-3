using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class GestionarAgencia : System.Web.UI.Page
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
            else if (rol > 1)
            {
                Response.Redirect("TrabajadorSinPermisos.aspx");
            }
        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            ServicioWeb.ServicioWeb swjava = new ServicioWeb.ServicioWeb();

            string nombre = this.nombre.Text;
            string direccion = this.direccion.Text;
            double fondos = Convert.ToDouble(this.fondos.Text);

            bool agregada = swjava.nuevaAgencia(nombre, direccion, fondos);
            int rolLogged = Convert.ToInt32(Session["rol"]);

            if (agregada)
            {

                if (rolLogged == 1)
                {
                    estado_agencia.Text = "Se agrego una nueva agencia a la BD.";
                }
                else
                {
                    Response.Redirect("TrabajadorSinPermisos.aspx");
                }

            }
            else
            {
                estado_agencia.Text = "Ocurrio un error al tratar de conectar con la BD.";
            }
        }
    }
}