using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class Depositar : System.Web.UI.Page
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
            else if (rol != 3)
            {
                Response.Redirect("TrabajadorSinPermisos.aspx");
            }


            //modos de depositar
            if (!IsPostBack)
            {
                ListItem item = new ListItem("--Seleccionar--", "-1");
                modoDeposito.Items.Add(item);
                item = new ListItem("--Efectivo--", "1");
                modoDeposito.Items.Add(item);
                item = new ListItem("--Cheque--", "2");
                modoDeposito.Items.Add(item);
            }
        }

        protected void modoDeposito_SelectedIndexChanged(object sender, EventArgs e)
        {
            int modo = Convert.ToInt32(modoDeposito.SelectedValue.ToString());

            if (modo > 0)
            {
                //en efectivo
                if (modo == 1)
                {
                    this.idcheque.Text = "";
                    this.cuentacheque.Text = "";
                    this.idcheque.Enabled = false;
                    this.cuentacheque.Enabled = false;

                }
                //con cheque
                else
                {
                    this.idcheque.Enabled = true;
                    this.cuentacheque.Enabled = true;
                }
            }
            else
            {
                estado_deposito.Text = "Seleccione una forma de depositar";
            }
        }

        protected void Ingresar_Click(object sender, EventArgs e)
        {
            int modo = Convert.ToInt32(modoDeposito.SelectedValue.ToString());

            if (modo > 0)
            {
                ServicioWeb.ServicioWeb swjava = new ServicioWeb.ServicioWeb();

                int cuenta = Convert.ToInt32(this.cuenta.Text);
                long monto = Convert.ToInt64(this.monto.Text);
                string transaccionista = this.transaccionista.Text;
                long cuiTrabajador = Convert.ToInt64(Session["cui"].ToString());
                //en efectivo
                if (modo == 1)
                {
                    estado_deposito.Text = swjava.depositar(false, cuenta, -1, -1, monto, transaccionista, cuiTrabajador);
                }
                //con cheque
                else
                {
                    int idcheque = Convert.ToInt32(this.idcheque.Text);
                    int cuentacheque = Convert.ToInt32(this.cuentacheque.Text);
                    estado_deposito.Text = swjava.depositar(true, cuenta, idcheque, cuentacheque, monto, transaccionista, cuiTrabajador);
                }
            }
            else
            {
                estado_deposito.Text = "Seleccione una forma de depositar";
            }
        }
    }
}