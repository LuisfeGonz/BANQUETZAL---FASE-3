using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class PuntosCanje : System.Web.UI.Page
    {
        //datos servicioweb
        SWFase3.Fase3 swjava;
        SWFase3.stock[] stock;
        //item
        ListItem item;

        public PuntosCanje()
        {
            //item
            item = new ListItem();
            //datos servicio web
            swjava = new SWFase3.Fase3();
            stock = swjava.mostrarStock();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Verificar usuario loggeado
            int rol = Convert.ToInt32(Session["rol"]);
            long cui = Convert.ToInt64(Session["cui"]);

            if (rol > 0)
            {
                Response.Redirect("InicioTrabajador.aspx");
            }
            else if (rol == 0)
            {
                Response.Redirect("PaginaInicio.aspx");
            }
            //---------------------------

            if (!IsPostBack)
            {
                //mostrar productos
                item = new ListItem("--Seleccionar--", "-1");
                ddlProductos.Items.Add(item);

                for (int i = 0; i < stock.Length; i++)
                {
                    item = new ListItem(stock[i].producto + "; " + stock[i].proveedor + "; " + stock[i].puntos + " puntos", stock[i].id.ToString());
                    ddlProductos.Items.Add(item);
                }

                puntosCliente.Text = swjava.puntosCliente(cui).ToString();

            }
        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            int selecc = Convert.ToInt32(ddlProductos.SelectedValue);
            if (selecc > 0)
            {
                long cui = Convert.ToInt64(Session["cui"]);
                estado.Text = swjava.canjearProducto(cui, Convert.ToInt32(ddlProductos.SelectedValue));
                puntosCliente.Text = swjava.puntosCliente(cui).ToString();
            }
            else
            {
                estado.Text = "Seleccione algun producto.";
            }

        }

        protected void cuentaDestino_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}