using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;

public partial class frmRealizarAlquiler : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        
    }
    protected void btnAlquilar_Click(object sender, EventArgs e)
    {
        
        try
        {
            int cedula = Convert.ToInt32(txtCedula.Text);
            Vehiculos v = LVehiculo.Buscar(txtMatricula.Text);
            if (v == null)
                lblError.Text = "No existe el vehiculo.";
            Clientes c = LCliente.Buscar(cedula);
            if (c == null)
                lblError.Text = "No existe el cliente.";


            Alquiler a = new Alquiler(c, v, mvwInicio.SelectedDate, mvwFin.SelectedDate);
            LAlquiler.Alquilar(a);
            lblError.Text = "Se agrego alquiler con exito.";
        }
        catch (Exception ex)
        { lblError.Text = ex.Message; }
        
    }
    protected void btnCosto_Click(object sender, EventArgs e)
    {
        try
        {
            Vehiculos v = LVehiculo.Buscar(txtMatricula.Text);
            if (v == null)
                lblError.Text = "No existe el vehiculo.";
            lblError.Text = "El Costo del alquiler es de " + (mvwFin.SelectedDate.Subtract(mvwInicio.SelectedDate).Days * v.Costo) + " Dolares.";
        }

        catch(Exception ex)
        { lblError.Text = ex.Message; }
    }
    
}