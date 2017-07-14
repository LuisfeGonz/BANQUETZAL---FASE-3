using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            ServicioWeb.ServicioWeb swjava = new ServicioWeb.ServicioWeb();

            string nombreRol = swjava.Login(usuario.Text, contrasena.Text);

            if (nombreRol.Length > 0)
            {
                string[] datos = nombreRol.Split(',');
                Session["cui"] = datos[0];
                Session["nombres"] = datos[1];
                Session["apellidos"] = datos[2];
                Session["rol"] = datos[3];
                Session["usuario"] = usuario.Text;
                Session["contrasena"] = contrasena.Text;

                /*
                Site1.bienvenidaNombre.Text = Session["nombres"].ToString();
                Site1.bienvenidaRol.Text = Session["rol"].ToString();
                Site2.bienvenidaNombre.Text = Session["nombres"].ToString();
                Site2.bienvenidaRol.Text = Session["rol"].ToString();
                */

                if (datos[3].Equals("-1"))
                {
                    Response.Redirect("InicioCliente.aspx");
                }
                else
                {
                    Response.Redirect("InicioTrabajador.aspx");
                }

            }
            else
            {
                estado_login.Text = "Usuario|Contrasena invalidx";
            }
        }
    }
}