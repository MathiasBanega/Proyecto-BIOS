using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;

public partial class frmMantenimientoAutos : System.Web.UI.Page
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
        rblAnclaje.Items[0].Selected = true;
        rblAnclaje.Items[1].Selected = false;
        rblAnclaje.Items[2].Selected = false;

        txtAño.Text = "";
        txtCosto.Text = "";
        txtMarca.Text = "";
        txtMatricula.Text = "";
        txtModelo.Text = "";
        txtPuertas.Text = "";
        lblError.Text = "";

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

            else if (v is Utilitarios)
               throw new Exception("El Vehiculo pertenece a Utilitarios.");

            else//si existe el auto
            {
                ActivarBajaModificacion();
                Session["Vehiculo"] = v;

                txtAño.Text = Convert.ToString(v.Año);
                txtCosto.Text = v.Costo.ToString();
                txtMarca.Text = v.Marca;
                txtMatricula.Text = v.Matricula;
                txtModelo.Text = v.Modelo;
                txtPuertas.Text = v.Puertas.ToString();
                if (((Autos)v).Anclaje == "Cinturon")
                {
                    rblAnclaje.Items[0].Selected = true;
                    rblAnclaje.Items[1].Selected = false;
                    rblAnclaje.Items[2].Selected = false;
                }
                else if (((Autos)v).Anclaje == "ISOFIX")
                {
                    rblAnclaje.Items[0].Selected = false;
                    rblAnclaje.Items[1].Selected = false;
                    rblAnclaje.Items[2].Selected = true;
                }
                else if (((Autos)v).Anclaje == "Latch")
                {
                    rblAnclaje.Items[0].Selected = false;
                    rblAnclaje.Items[1].Selected = true;
                    rblAnclaje.Items[2].Selected = false;
                }
            }
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }

    }
    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        Limpiar();
    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < txtAño.Text.Length; i++)
            {
                if(!char.IsNumber(Convert.ToChar(txtAño.Text.Substring(i,1))))
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
                    throw new Exception("Error en Costo del vehiculo.");

            }

            Autos v = new Autos(txtMatricula.Text, txtMarca.Text, txtModelo.Text, Convert.ToInt32(txtAño.Text), Convert.ToInt32(txtPuertas.Text),
                                Convert.ToDecimal(txtCosto.Text), rblAnclaje.SelectedItem.Text);

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

            Autos a = new Autos(txtMatricula.Text, txtMarca.Text, txtModelo.Text, Convert.ToInt32(txtAño.Text), Convert.ToInt32(txtPuertas.Text),
                                    Convert.ToDecimal(txtCosto.Text), rblAnclaje.SelectedItem.Text);
            LVehiculo.Modificar(a);
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