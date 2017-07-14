using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class CambiarEstadoCuentaTrabajador : System.Web.UI.Page
    {
        ServicioWeb.ServicioWeb swjava = new ServicioWeb.ServicioWeb();
        string[] listaEstado;
        

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

            //cargar lista de estados
            if (!IsPostBack)
            {
                listaEstado = swjava.mostrarEstados();

                for (int i = 0; i < listaEstado.Length; i++)
                {
                    listaEstados.Items.Add(listaEstado[i]);
                }
            }
        }

        protected void cargar_Click(object sender, EventArgs e)
        {
            int idcuenta = Convert.ToInt32(cuenta.Text);

            ServicioWeb.cuenta objCuenta = swjava.mostrarCuentaPropietario(idcuenta);

            cui.Text = objCuenta.cuiPropietario.ToString();
            nombre.Text = objCuenta.propietario;
            listaEstados.SelectedIndex = objCuenta.estado - 1;
            listaEstados.Enabled = true;
            estado.Text = "";
        }

        protected void cambiar_Click(object sender, EventArgs e)
        {
            int nuevoEstado = listaEstados.SelectedIndex + 1;
            int idcuenta = Convert.ToInt32(cuenta.Text);
            bool cambiado = swjava.cambiarEstadoCuenta(idcuenta, nuevoEstado);

            if (cambiado)
            {
                estado.Text = "Se cambio el estado de la cuenta " + idcuenta + ".";
            }
            else
            {
                estado.Text = "Ocurrio un error al consultar la BD.";
            }
        }

        protected void listaEstados_SelectedIndexChanged(object sender, EventArgs e)
        {
            cambiar.Enabled = true;
            estado.Text = "";
        }
    }
}