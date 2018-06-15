using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;

public partial class frmMantenimientoClientes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            this.Limpiar();

    }

    private void ActivarBajaModificacion()
    {
        btnAgregar.Enabled = false;
        btnBuscar.Enabled = false;
        btnEliminar.Enabled = true;
        btnLimpiar.Enabled = true;
        btnModificar.Enabled = true;

        txtDireccion.Enabled = true;
        txtFechaN.Enabled = true;
        txtNombre.Enabled = true;
        txtTarjeta.Enabled = true;
        txtTelefono.Enabled = true;
        txtCedula.Enabled = true;
        
    }
    private void ActivarAlta()//si no existe el cliente
    {
        btnAgregar.Enabled = true;
        btnBuscar.Enabled = false;
        btnEliminar.Enabled = false;
        btnLimpiar.Enabled = true;
        btnModificar.Enabled = false;

        txtDireccion.Enabled = true;
        txtFechaN.Enabled = true;
        txtNombre.Enabled = true;
        txtTarjeta.Enabled = true;
        txtTelefono.Enabled = true;

      
    }
    private void Limpiar()
    {
        btnAgregar.Enabled = false;
        btnBuscar.Enabled = true;
        btnEliminar.Enabled = false;
        btnLimpiar.Enabled = false;
        btnModificar.Enabled = false;
        
        txtDireccion.Enabled = false;
        txtFechaN.Enabled = false;
        txtNombre.Enabled = false;
        txtTarjeta.Enabled = false;
        txtTelefono.Enabled = false;
        txtCedula.Enabled = true;

        txtCedula.Text = "";
        txtDireccion.Text = "";
        txtFechaN.Text = "";
        txtNombre.Text = "";
        txtTarjeta.Text = "";
        txtTelefono.Text = "";
        lblError.Text = "";
 
    }

    protected void txtFechaN_TextChanged(object sender, EventArgs e)
    {
        
    }
    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        Limpiar();
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            
            int cedula = Convert.ToInt32(txtCedula.Text);
            
            Clientes c = LCliente.Buscar(cedula);

            if (c == null)
            {
                this.ActivarAlta();
                Session["Cliente"] = c;

                lblError.Text = "No existe el cliente.";

            }

            else
            {
                ActivarBajaModificacion();
                Session["Cliente"] = c;

                txtCedula.Text = c.Cedula.ToString();
                txtDireccion.Text = c.Direccion;
                txtFechaN.Text = c.FechaN.ToShortDateString();
                txtNombre.Text = c.Nombre;
                txtTarjeta.Text = c.Tarjeta.ToString(); ;
                txtTelefono.Text = c.Telefono.ToString();
                lblError.Text = "";
            }
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < txtTarjeta.Text.Length; i++)
            {
                if (!char.IsNumber(Convert.ToChar(txtTarjeta.Text.Substring(i, 1))))
                    throw new Exception("Error en numero de tarjeta.");

            }

            for (int i = 0; i < txtTelefono.Text.Length; i++)
            {
                if (!char.IsNumber(Convert.ToChar(txtTelefono.Text.Substring(i, 1))))
                    throw new Exception("Error en numero de telefono.");

            }

            Clientes c = new Clientes(Convert.ToInt32(txtCedula.Text), Convert.ToInt32(txtTarjeta.Text), txtNombre.Text,
                                      Convert.ToInt32(txtTelefono.Text), txtDireccion.Text, Convert.ToDateTime(txtFechaN.Text));

            LCliente.Agregar(c);
            ActivarBajaModificacion();
            Limpiar();
            lblError.Text = "Se dio de alta el cliente.";

        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }

    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            Clientes c = (Clientes)Session["Cliente"];
            LCliente.Eliminar(c);
            Limpiar();
            lblError.Text = "Eliminado Correctamente";
            
        }
        catch (Exception ex)
        { lblError.Text=ex.Message; }
    }
    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < txtTarjeta.Text.Length; i++)
            {
                if (!char.IsNumber(Convert.ToChar(txtTarjeta.Text.Substring(i, 1))))
                    throw new Exception("Error en numero de tarjeta.");

            }

            for (int i = 0; i < txtTelefono.Text.Length; i++)
            {
                if (!char.IsNumber(Convert.ToChar(txtTelefono.Text.Substring(i, 1))))
                    throw new Exception("Error en numero de telefono.");

            }

            Clientes c = new Clientes(Convert.ToInt32(txtCedula.Text), Convert.ToInt32(txtTarjeta.Text), txtNombre.Text,
                                     Convert.ToInt32(txtTelefono.Text), txtDireccion.Text, Convert.ToDateTime(txtFechaN.Text));
            LCliente.Modificar(c);
            Limpiar();
            lblError.Text = "Modificado Correctamente";
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }
}