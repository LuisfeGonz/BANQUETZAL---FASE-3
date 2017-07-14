using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class CambiarContrasena : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Verificar usuario loggeado

            int rol = Convert.ToInt32(Session["rol"]);
            if (rol == 0)
            {
                Response.Redirect("PaginaInicio.aspx");
            }
        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            ServicioWeb.ServicioWeb swjava = new ServicioWeb.ServicioWeb();

            string actual = this.actual.Text;
            string nueva = this.nueva.Text;
            string verificar = this.verificacion.Text;
            int rol = Convert.ToInt32(Session["rol"]);
            long cui = Convert.ToInt64(Session["cui"]);
            string pass = Session["contrasena"].ToString();

            if (actual.Equals(pass))
            {
                if (nueva.Equals(verificar))
                {
                    bool cambiada = swjava.CambiarContrasena(actual, nueva, cui, rol);

                    if (cambiada)
                    {
                        estado_cambio.Text = "Ha cambiado su contrasena.";
                    }
                    else
                    {
                        estado_cambio.Text = "La contrasena nueva ya esta en uso. \n Ingrese una nueva contrasena.";
                    }
                }
                else
                {
                    estado_cambio.Text = "La verificacion de la contrasena no coincide.";
                }
            }
            else
            {
                estado_cambio.Text = "La contrasena actual es incorrecta.";
            }
        }
    }
}