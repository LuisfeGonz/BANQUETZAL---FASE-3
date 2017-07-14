using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class OperacionesTrabajador : System.Web.UI.Page
    {
        ServicioWeb.ServicioWeb swjava;
        ListItem item;

        public OperacionesTrabajador()
        {
            swjava = new ServicioWeb.ServicioWeb();
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

            if (!IsPostBack)
            {
                //cargar tipos de operaciones
                string[] listaOperaciones = swjava.mostrarTiposOperacion();

                item = new ListItem("--Seleccionar--", "-1");
                this.listaTipoOperacion.Items.Add(item);
                for (int i = 0; i < listaOperaciones.Length; i++)
                {
                    this.listaTipoOperacion.Items.Add(listaOperaciones[i]);
                }
            }



        }

        protected void listaTipoOperacion_SelectedIndexChanged(object sender, EventArgs e)
        {
            int indice = listaTipoOperacion.SelectedIndex;

            if (indice ==1)
            {
                Response.Redirect("NuevaCuenta.aspx");
            }
            if (indice == 2)
            {
                Response.Redirect("CambiarEstadoCuentaTrabajador.aspx");
            }
            else if (indice == 3)
            {
                Response.Redirect("SolicitarChequera.aspx");
            }
            else if (indice == 4)
            {
                //Response.Redirect("CambiarEstadoChequera.aspx");
            }
            else if (indice == 5)
            {
                Response.Redirect("SolicitarPrestamoTrabajador.aspx");
            }
            else if (indice == 6)
            {
                Response.Redirect("Retiro.aspx");
            }
            else if (indice == 7)
            {
                Response.Redirect("CambiarCheque.aspx");
            }
            else if (indice == 8)
            {
                Response.Redirect("Depositar.aspx");
            }
            else if (indice == 9)
            {
                //Response.Redirect("TransferenciaTrabajador.aspx");
            }
            else if (indice == 10)
            {
                Response.Redirect("AsociacionCuenta.aspx");
            }
            else if (indice == 11)
            {

            }
            else if (indice == 12)
            {

            }
            else if (indice == 13)
            {

            }
            else if (indice == 14)
            {

            }
            else if (indice == 15)
            {

            }
            else if (indice == 16)
            {

            }
            else if (indice == 17)
            {
                
            }
            else if (indice == 18)
            {
                
            }
            else if (indice == 19)
            {

            }
        }
    }
}