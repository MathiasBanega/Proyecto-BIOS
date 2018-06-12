using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using EntidadesCompartidas;

public partial class frmMantenimientoUtilitarios : System.Web.UI.Page
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

        txtAño.Enabled = true;
        txtMatricula.Enabled = true;
        txtCosto.Enabled = true;
        txtMarca.Enabled = true;
        txtModelo.Enabled = true;
        txtPuertas.Enabled = true;
        txtCapacidad.Enabled = true;
        lblError.Text = "";

    }
    private void ActivarAlta()
    {
        btnAgregar.Enabled = true;
        btnBuscar.Enabled = false;
        btnEliminar.Enabled = false;
        btnLimpiar.Enabled = true;
        btnModificar.Enabled = false;

        txtAño.Enabled = true;
        txtMatricula.Enabled = true;
        txtCosto.Enabled = true;
        txtMarca.Enabled = true;
        txtModelo.Enabled = true;
        txtPuertas.Enabled = true;
        txtCapacidad.Enabled = true;

    }
    private void Limpiar()
    {
        btnAgregar.Enabled = false;
        btnBuscar.Enabled = true;
        btnEliminar.Enabled = false;
        btnLimpiar.Enabled = false;
        btnModificar.Enabled = false;

        txtAño.Enabled = false;
        txtMatricula.Enabled = true;
        txtCosto.Enabled = false;
        txtMarca.Enabled = false;
        txtModelo.Enabled = false;
        txtPuertas.Enabled = false;
        rblTipo.Items[0].Selected = true;
        rblTipo.Items[1].Selected = false;
        txtCapacidad.Enabled = false;

        txtAño.Text = "";
        txtCosto.Text = "";
        txtMarca.Text = "";
        txtMatricula.Text = "";
        txtModelo.Text = "";
        txtPuertas.Text = "";
        lblError.Text = "";
        txtCapacidad.Text = "";

    }

    protected void TextBox7_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        Limpiar();
    }
    protected void rbtFurgoneta_CheckedChanged(object sender, EventArgs e)
    {
       
    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            string matricula = txtMatricula.Text;

            Vehiculos v = LVehiculo.Buscar(matricula);

            if (v == null)
            {
                ActivarAlta();
                Session["Vehiculo"] = v;
                lblError.Text = "No existe el vehiculo.";

            }

            else if (v is Autos)
                throw new Exception("El Vehiculo no es utilitario.");

            else
            {
                ActivarBajaModificacion();
                Session["Vehiculo"] = v;

                txtAño.Text = Convert.ToString(v.Año);
                txtCosto.Text = v.Costo.ToString();
                txtMarca.Text = v.Marca;
                txtMatricula.Text = v.Matricula;
                txtModelo.Text = v.Modelo;
                txtPuertas.Text = v.Puertas.ToString();
                txtCapacidad.Text = ((Utilitarios)v).Capacidad.ToString(); ;
                if (((Utilitarios)v).Furgoneta_pickup == "Furgoneta")
                {
                    rblTipo.Items[0].Selected = true;
                    rblTipo.Items[1].Selected = false;
                }
                else if (((Utilitarios)v).Furgoneta_pickup == "Pick Up")
                {
                    rblTipo.Items[0].Selected = false;
                    rblTipo.Items[1].Selected = true;
                }

            }
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < txtAño.Text.Length; i++)
            {
                if (!char.IsNumber(Convert.ToChar(txtAño.Text.Substring(i, 1))))
                    throw new Exception("Error en año del vehiculo.");

            }

            for (int i = 0; i < txtPuertas.Text.Length; i++)
            {
                if (!char.IsNumber(Convert.ToChar(txtPuertas.Text.Substring(i, 1))))
                    throw new Exception("Error en Puertas del vehiculo.");

            }

            for (int i = 0; i < txtCosto.Text.Length; i++)
            {

                if (!char.IsNumber(Convert.ToChar(txtCosto.Text.Substring(i, 1))))
                    if (!char.IsPunctuation(Convert.ToChar(txtCosto.Text.Substring(i, 1))))
                        throw new Exception("Error en Costo del vehiculo.");

            }

            for (int i = 0; i < txtCapacidad.Text.Length; i++)
            {
                if (!char.IsNumber(Convert.ToChar(txtCapacidad.Text.Substring(i, 1))))
                    throw new Exception("Error en capacidad del vehiculo.");

            }

            Utilitarios v = new Utilitarios(txtMatricula.Text, txtMarca.Text, txtModelo.Text, Convert.ToInt32(txtAño.Text), Convert.ToInt32(txtPuertas.Text),
                                Convert.ToDecimal(txtCosto.Text), Convert.ToInt32(txtCapacidad.Text), rblTipo.SelectedItem.Text);

            LVehiculo.Agregar(v);

            ActivarBajaModificacion();
            Limpiar();
            lblError.Text = "Se dio de alta el Vehiculo.";
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }
    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < txtAño.Text.Length; i++)
            {
                if (!char.IsNumber(Convert.ToChar(txtAño.Text.Substring(i, 1))))
                    throw new Exception("Error en año del vehiculo.");

            }

            for (int i = 0; i < txtPuertas.Text.Length; i++)
            {
                if (!char.IsNumber(Convert.ToChar(txtPuertas.Text.Substring(i, 1))))
                    throw new Exception("Error en Puertas del vehiculo.");

            }

            for (int i = 0; i < txtCosto.Text.Length; i++)
            {
                
                if (!char.IsNumber(Convert.ToChar(txtCosto.Text.Substring(i, 1))))
                    if (!char.IsPunctuation(Convert.ToChar(txtCosto.Text.Substring(i, 1))))
                        throw new Exception("Error en Costo del vehiculo.");

            }

            for (int i = 0; i < txtCapacidad.Text.Length; i++)
            {
                if (!char.IsNumber(Convert.ToChar(txtCapacidad.Text.Substring(i, 1))))
                    throw new Exception("Error en capacidad del vehiculo.");

            }

            Utilitarios v = new Utilitarios(txtMatricula.Text, txtMarca.Text, txtModelo.Text, Convert.ToInt32(txtAño.Text), Convert.ToInt32(txtPuertas.Text),
                                Convert.ToDecimal(txtCosto.Text), Convert.ToInt32(txtCapacidad.Text), rblTipo.SelectedItem.Text);
            LVehiculo.Modificar(v);
            Limpiar();
            lblError.Text = "Modificado correctamente.";
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            Vehiculos v = (Vehiculos)Session["Vehiculo"];
            LVehiculo.Eliminar(v);
            Limpiar();
            lblError.Text = "Eliminado correctamente.";
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }
}