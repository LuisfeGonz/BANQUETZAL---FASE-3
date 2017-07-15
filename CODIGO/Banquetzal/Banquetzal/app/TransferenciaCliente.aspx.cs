using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class TransferenciaCliente : System.Web.UI.Page
    {
        SWFase3.Fase3 swjava;
        ListItem item;
        SWFase3.cuenta[] listaCuenta;
        SWFase3.cuenta[] listaCuentaAsociada;

        public TransferenciaCliente()
        {
            item = new ListItem();
            swjava = new SWFase3.Fase3();
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

            //llenar listas de cuentas

            if (!IsPostBack)
            {
                listaCuenta = swjava.mostrarCuentasCliente(cui);
                listaCuentaAsociada = swjava.mostrarCuentasAsociadas(cui);


                item = new ListItem("--Seleccionar--", "-1");
                ddlOrigen.Items.Add(item);
                ddlDestino.Items.Add(item);

                for (int i = 0; i < listaCuenta.Length; i++)
                {
                    item = new ListItem(listaCuenta[i].id.ToString(), listaCuenta[i].id.ToString());
                    ddlOrigen.Items.Add(item);
                }

                for (int i = 0; i < listaCuentaAsociada.Length; i++)
                {
                    item = new ListItem(listaCuentaAsociada[i].id.ToString(), listaCuentaAsociada[i].id.ToString());
                    ddlDestino.Items.Add(item);
                }
            }
        }

        protected void transferir_Click(object sender, EventArgs e)
        {
            int cuentaOrigen = Convert.ToInt32(ddlOrigen.SelectedValue);
            int cuentaDestino = Convert.ToInt32(ddlDestino.SelectedValue);
            long monto = Convert.ToInt64(this.monto.Text);
            long cuitrabajador = Convert.ToInt64(Session["cui"].ToString());
            estado.Text = swjava.transferir(cuentaOrigen, cuentaDestino, monto, cuitrabajador);
        }
    }
}