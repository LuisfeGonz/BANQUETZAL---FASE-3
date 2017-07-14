using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class GestionarEmpleadoBanco : System.Web.UI.Page
    {
        ServicioWeb.ServicioWeb swjava = new ServicioWeb.ServicioWeb();
        string[] roles;
        string[] agencias;
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
            else if (rol > 2)
            {
                Response.Redirect("TrabajadorSinPermisos.aspx");
            }

            if (!IsPostBack)
            {
                roles = swjava.mostrarRoles();
                agencias = swjava.mostrarAgencias();

                for (int i = 0; i < roles.Length; i++)
                {
                    listaRol.Items.Add(roles[i]);
                }

                for (int i = 0; i < agencias.Length; i++)
                {
                    listaAgencia.Items.Add(agencias[i]);
                }
            }
        }

        protected void ingresar_Click(object sender, EventArgs e)
        {
            //datos nuevo trabajador
            long cui = Convert.ToInt64(this.cui.Text);
            string usuario = this.usuario.Text;
            string nombre = nombres.Text;
            string apellido = apellidos.Text;
            int telefono = Convert.ToInt32(this.telefono.Text);
            string direccion = this.direccion.Text;
            int rol = listaRol.SelectedIndex + 1;
            int agencia = listaAgencia.SelectedIndex + 1;

            //verificar permisos
            int rolLogged = Convert.ToInt32(Session["rol"]);

            if ((rolLogged == 2 && rol > 2) || (rolLogged == 1 && rol == 2))
            {
                bool agregado = swjava.agregarTrabajador(cui, usuario, nombre, apellido, telefono, direccion, rol, agencia);

                if (agregado)
                {
                    estado_empleado.Text = "Se agrego un nuevo empleado a la BD";
                }
                else
                {
                    estado_empleado.Text = "Ocurrio un error al conectarse con la BD";
                }
            }
            else
            {
                Response.Redirect("TrabajadorSinPermisos.aspx");
            }
        }
    }
}