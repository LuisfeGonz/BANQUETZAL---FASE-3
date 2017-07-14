using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class AgregarEmpleadoNomina : System.Web.UI.Page
    {

        ServicioWeb.ServicioWeb swjava = new ServicioWeb.ServicioWeb();
        protected void Page_Load(object sender, EventArgs e)
        {

            //Verificar usuario logged
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
                int[] listaNominas = swjava.mostrarNominas(cui);
                if (listaNominas == null)
                {
                    Response.Redirect("ClienteSinPermisos.aspx");
                }
                else
                {
                    ListItem item = new ListItem("--seleccionar--", "0");
                    nominas.Items.Add(item);
                    for (int i = 0; i < listaNominas.Length; i++)
                    {
                        item = new ListItem(listaNominas[i].ToString(), (i + 1).ToString());
                        nominas.Items.Add(item);
                    }
                }
            }
        }

        protected void nuevaCuenta_CheckedChanged(object sender, EventArgs e)
        {
            if (nuevaCuenta.Checked)
            {
                this.cuentaElegida.Text = "";
                this.cuentaElegida.Enabled = false;
            }
            else
            {
                this.cuentaElegida.Enabled = true;
            }
        }

        protected void crear_Click(object sender, EventArgs e)
        {
            if (!nominas.SelectedValue.Equals("0"))
            {
                long cui = Convert.ToInt64(this.cuiCliente.Text);
                long salario = Convert.ToInt64(this.salario.Text);
                int nomina = Convert.ToInt32(this.nominas.SelectedItem.ToString());
                

                if (nuevaCuenta.Checked)
                {
                    estado.Text = swjava.crearCuentaIndividualNomina(cui, salario, nomina);
                }
                else
                {
                    int cuentaElegida = Convert.ToInt32(this.cuentaElegida.Text);
                    estado.Text = swjava.asignarClienteCuentaMonetaria(cui, cuentaElegida, salario, nomina);
                }
            }
            else
            {
                estado.Text = "Seleccione la nomina a la que desea agregar el empleado.";
            }
        }
    }
}