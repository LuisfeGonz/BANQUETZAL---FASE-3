using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class PagarSalarioNomina : System.Web.UI.Page
    {
        ServicioWeb.ServicioWeb swjava;

        public PagarSalarioNomina()
        {
            swjava = new ServicioWeb.ServicioWeb();
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

        protected void pagar_Click(object sender, EventArgs e)
        {

        }
    }
}