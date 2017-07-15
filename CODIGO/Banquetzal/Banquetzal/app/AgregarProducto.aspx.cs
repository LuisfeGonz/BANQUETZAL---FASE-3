using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Banquetzal.app
{
    public partial class AgregarProducto : System.Web.UI.Page
    {
        SWFase3.Fase3 swjava;
        SWFase3.proveedor[] listaProveedor;
        SWFase3.producto[] listaProducto;
        ListItem item;

        public AgregarProducto()
        {
            swjava = new SWFase3.Fase3();
            listaProveedor = swjava.mostrarProveedores();
            listaProducto = swjava.mostrarProductos();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //Verificar usuario loggeado
            int rol = Convert.ToInt32(Session["rol"]);
            if (rol == -1)
            {
                Response.Redirect("InicioCliente.aspx");
            }
            else if (rol == 0)
            {
                Response.Redirect("PaginaInicio.aspx");
            }
            else if (rol > 1)
            {
                Response.Redirect("InicioTrabajador.aspx");
            }

            if (!IsPostBack)
            {
                item = new ListItem("--Seleccionar--", "-1");
                ddlProveedor.Items.Add(item);

                for (int i = 0; i < listaProveedor.Length; i++)
                {
                    item = new ListItem(listaProveedor[i].nombre, listaProveedor[i].id.ToString());
                    ddlProveedor.Items.Add(item);
                }

                //productos
                //ddlProducto.Items.Clear();
                //si se agrega un nuevo producto aparece automaticamente en la lista
                item = new ListItem("--Seleccionar--", "-1");
                ddlProducto.Items.Add(item);

                for (int i = 0; i < listaProducto.Length; i++)
                {
                    item = new ListItem(listaProducto[i].nombre, listaProducto[i].id.ToString());
                    ddlProducto.Items.Add(item);
                }
            }
        }

        protected void agregar_Click(object sender, EventArgs e)
        {

            if (!ddlProveedor.SelectedValue.Equals("-1"))
            {
                if (nuevo.Checked)
                {
                    string nombre = this.nombre.Text;
                    int valor = Convert.ToInt32(this.valor.Text);
                    int cantidad = Convert.ToInt32(this.cantidad.Text);
                    int idproveedor = Convert.ToInt32(ddlProveedor.SelectedValue);

                    estado.Text = swjava.agregarProducto(nombre, valor, cantidad, idproveedor, -1, true);

                }
                else if (!ddlProducto.SelectedValue.Equals("-1"))
                {
                    long idproducto = Convert.ToInt64(ddlProducto.SelectedValue);
                    int cantidad = Convert.ToInt32(this.cantidad.Text);
                    int idproveedor = Convert.ToInt32(ddlProveedor.SelectedValue);

                    estado.Text = swjava.agregarProducto("", 0, cantidad, idproveedor, idproducto, false);

                }
                else
                {
                    estado.Text = "Defina un producto.";
                }
            }
            else
            {
                estado.Text = "Seleccione un proveedor.";
            }
        }

        protected void nuevo_CheckedChanged(object sender, EventArgs e)
        {
            if (nuevo.Checked)
            {
                nombre.Enabled = true;
                nombre.Text = "";
                valor.Enabled = true;
                valor.Text = "";
            }
            else
            {
                nombre.Enabled = false;
                nombre.Text = "--Deshabilitado--";
                valor.Enabled = false;
                valor.Text = "--Deshabilitado--";
            }
        }

    }
}