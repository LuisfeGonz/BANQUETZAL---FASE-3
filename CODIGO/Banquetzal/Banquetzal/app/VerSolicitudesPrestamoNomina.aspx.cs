using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class VerSolicitudesPrestamoNomina : System.Web.UI.Page
    {
        ServicioWeb.ServicioWeb swjava;
        SWFase3.Fase3 swjavaf3;
        ListItem item;
        SWFase3.prestamo[] listaPrestamos;
        SWFase3.estadoPrestamo[] listaEstadosP;

        public VerSolicitudesPrestamoNomina()
        {
            swjava = new ServicioWeb.ServicioWeb();
            swjavaf3 = new SWFase3.Fase3();            
        }

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

            if (IsPostBack)
            {
                listaPrestamos = (SWFase3.prestamo[])Session["listaPrestamos"];
            }

            if (!IsPostBack)
            {
                //Nominas 
                int[] listaNominas = swjava.mostrarNominas(cui);
                if (listaNominas == null)
                {
                    Response.Redirect("ClienteSinPermisos.aspx");
                }
                else
                {
                    item = new ListItem("--seleccionar--", "-1");
                    nominas.Items.Add(item);
                    ddlSolicitantes.Items.Add(item);
                    ddlEstados.Items.Add(item);

                    for (int i = 0; i < listaNominas.Length; i++)
                    {
                        item = new ListItem(listaNominas[i].ToString(), listaNominas[i].ToString());
                        nominas.Items.Add(item);
                    }
                }
            }
        }

        protected void nominas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (nominas.SelectedIndex != 0)
            {
                ddlSolicitantes.Items.Clear();
                ddlEstados.Items.Clear();

                int nomina = Convert.ToInt32(nominas.SelectedValue);
                estado.Text = nominas.SelectedValue;
                item = new ListItem("--seleccionar--", "-1");
                ddlSolicitantes.Items.Add(item);
                ddlEstados.Items.Add(item);

                listaPrestamos = swjavaf3.mostrarPrestamosCliente(nomina);
                Session["listaPrestamos"] = listaPrestamos;
                listaEstadosP = swjavaf3.mostrarEstadosPrestamos();

                //lista de prestamos
                for (int i = 0; i < listaPrestamos.Length; i++)
                {
                    item = new ListItem(listaPrestamos[i].solicitante, listaPrestamos[i].id.ToString());
                    ddlSolicitantes.Items.Add(item);
                }
                //lista de estados
                for (int i = 0; i < listaEstadosP.Length; i++)
                {
                    item = new ListItem(listaEstadosP[i].nombre, listaEstadosP[i].id.ToString());
                    ddlEstados.Items.Add(item);
                }
            }
            else
            {
                estado.Text = "Seleccione una nomina";
            }
        }

        protected void ddlSolicitantes_SelectedIndexChanged(object sender, EventArgs e)
        {
            SWFase3.prestamo prestamo = null;

            for (int i = 0; i < listaPrestamos.Length; i++)
            {
                if (listaPrestamos[i].id.ToString().Equals(ddlSolicitantes.SelectedValue))
                {
                    prestamo = listaPrestamos[i];
                    break;
                }
            }

            if (ddlSolicitantes.SelectedIndex != 0)
            {
                monto.Text = prestamo.monto.ToString();
                saldo.Text = prestamo.saldo.ToString();
                tipo.Text = prestamo.tipo;
                modalidad.Text = prestamo.modalidad;

                ddlEstados.SelectedValue = prestamo.idestado.ToString();
                ddlEstados.Enabled = true;

                if (!ddlEstados.SelectedItem.ToString().Equals("Finalizado"))
                {
                    Confirmar.Enabled = true;
                }
            }
            else
            {
                monto.Text = "";
                saldo.Text = "";
                tipo.Text = "";
                modalidad.Text = "";

                ddlEstados.SelectedValue = "-1";
                ddlEstados.Enabled = false;

                Confirmar.Enabled = false;
            }
        }

        protected void ddlEstados_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Confirmar_Click(object sender, EventArgs e)
        {
            if (!ddlSolicitantes.SelectedValue.Equals("-1"))
            {
                if (ddlEstados.SelectedIndex == 2 || ddlEstados.SelectedIndex == 3)
                {
                    int idprestamo = Convert.ToInt32(ddlSolicitantes.SelectedValue);
                    int idestado = Convert.ToInt32(ddlEstados.SelectedValue);

                    estado.Text = swjavaf3.cambiarEstadoPrestamo(idprestamo, idestado);
                }
                else
                {
                    estado.Text = "No puede realizar esta accion.";
                }
            }
            else
            {
                estado.Text = "Seleccione una solicitud.";
            }
        }
    }
}