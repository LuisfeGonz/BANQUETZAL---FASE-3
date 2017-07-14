using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class VerSolicitudesPrestamo : System.Web.UI.Page
    {
        SWFase3.Fase3 swjava;
        ListItem item;
        SWFase3.prestamo[] listaPrestamos;
        SWFase3.estadoPrestamo[] listaEstadosP;

        public VerSolicitudesPrestamo()
        {
            swjava = new SWFase3.Fase3();
            listaPrestamos = swjava.mostrarPrestamosTrabajador();
            listaEstadosP = swjava.mostrarEstadosPrestamos();
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
            else if (rol < 4)
            {
                Response.Redirect("TrabajadorSinPermisos.aspx");
            }

            //llenar listas
            if (!IsPostBack)
            {
                //listaPrestamos = swjava.mostrarPrestamos();
                //listaEstadosP = swjava.mostrarEstadosPrestamos();

                item = new ListItem("--Seleccionar--", "-1");
                ddlSolicitantes.Items.Add(item);
                ddlEstados.Items.Add(item);

                for (int i = 0; i < listaPrestamos.Length; i++)
                {
                    item = new ListItem(listaPrestamos[i].solicitante, listaPrestamos[i].id.ToString());
                    ddlSolicitantes.Items.Add(item);
                }

                for (int i = 0; i < listaEstadosP.Length; i++)
                {
                    item = new ListItem(listaEstadosP[i].nombre, listaEstadosP[i].id.ToString());
                    ddlEstados.Items.Add(item);
                }
            }
        }

        protected void Confirmar_Click(object sender, EventArgs e)
        {
            if (!ddlSolicitantes.SelectedValue.Equals("-1"))
            {
                if (ddlEstados.SelectedIndex == 2 || ddlEstados.SelectedIndex == 3)
                {
                    int idprestamo = Convert.ToInt32(ddlSolicitantes.SelectedValue);
                    int idestado = Convert.ToInt32(ddlEstados.SelectedValue);

                    estado.Text = swjava.cambiarEstadoPrestamo(idprestamo, idestado);
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
    }
}