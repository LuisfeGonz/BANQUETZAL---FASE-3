using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class NuevaCuenta : System.Web.UI.Page
    {
        ServicioWeb.ServicioWeb swjava = new ServicioWeb.ServicioWeb();
        string[] listaTipoCuenta;

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

            if (!IsPostBack)
            {
                listaTipoCuenta = swjava.mostrarTiposCuenta();

                for (int i = 0; i < listaTipoCuenta.Length; i++)
                {
                    listaTipo.Items.Add(listaTipoCuenta[i]);
                }
            }

        }

        protected void crear_Click(object sender, EventArgs e)
        {
            int idcuenta = -1;
            double fondos = Convert.ToDouble(monto.Text);


            if (nomina.Checked)
            {
                //NOMINA
                long cuiP = Convert.ToInt64(boxPresidente.Text);
                long cuiV = Convert.ToInt64(boxVice.Text);
                long cuiC = Convert.ToInt64(boxContador.Text);
                double sueldoP = Convert.ToDouble(sueldoPresidente.Text);
                double sueldoV = Convert.ToDouble(sueldoVice.Text);
                double sueldoC = Convert.ToDouble(sueldoContador.Text);
                long cuitrabajador = Convert.ToInt64(Session["cui"].ToString());

                idcuenta = swjava.insertarNomina(fondos, cuiP, cuiV, cuiC, sueldoP, sueldoV, sueldoC, cuitrabajador);

                if (idcuenta > -1)
                {
                    boxContador.Text = "";
                    boxPresidente.Text = "";
                    boxVice.Text = "";
                    sueldoContador.Text = "";
                    sueldoPresidente.Text = "";
                    sueldoVice.Text = "";
                    estado.Text = "La cuenta ha sido creada con ID: " + idcuenta + ".";
                }
                else
                {
                    estado.Text = "Ha ocurrido un error al tratar de crear la cuenta.";
                }
            }
            else
            {
                //INDIVIDUAL   
                long cuiCliente = Convert.ToInt64(this.cuiCliente.Text);
                int tipoCuenta = listaTipo.SelectedIndex + 1;
                long cuitrabajador = Convert.ToInt64(Session["cui"].ToString());

                idcuenta = swjava.crearCuentaIndividual(cuiCliente, fondos, tipoCuenta, cuitrabajador);

                if (idcuenta > -1)
                {
                    this.cuiCliente.Text = "";
                    monto.Text = "";
                    estado.Text = "La cuenta ha sido creada con ID: " + idcuenta + ".";
                }
                else
                {
                    estado.Text = "Ha ocurrido un error al tratar de crear la cuenta.";
                }
            }
        }

        protected void nomina_CheckedChanged(object sender, EventArgs e)
        {
            if (nomina.Checked)
            {
                //boxCUIs Encargados
                boxPresidente.Text = "";
                boxVice.Text = "";
                boxContador.Text = "";
                boxPresidente.Enabled = true;
                boxVice.Enabled = true;
                boxContador.Enabled = true;
                //boxSueldo Encargados
                sueldoPresidente.Enabled = true;
                sueldoVice.Enabled = true;
                sueldoContador.Enabled = true;
                //listaTipoCuenta
                listaTipo.SelectedIndex = 0;
                listaTipo.Enabled = false;
                //boxCUI Cliente
                cuiCliente.Text = "";
                cuiCliente.Enabled = false;
            }
            else
            {
                //boxCUIs Encargados
                boxPresidente.Enabled = false;
                boxVice.Enabled = false;
                boxContador.Enabled = false;
                //boxSueldo Encargados
                sueldoPresidente.Enabled = false;
                sueldoVice.Enabled = false;
                sueldoContador.Enabled = false;
                //listaTipoCuenta
                listaTipo.Enabled = true;
                cuiCliente.Enabled = true;
            }
        }
    }
}