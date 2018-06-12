using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;

public partial class frmListadodeVehiculosDisponibles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            LstDisponibles.Items.Clear();
            List<Vehiculos> disponibles = LVehiculo.ListarDisponibles(Convert.ToDateTime(txtFechaI.Text), Convert.ToDateTime(txtFechaF.Text));
            //recorre la lista y agrega los datos 
            for (int i = 0; i < disponibles.Count; i++)
            {
                LstDisponibles.Items.Add("---------------------------------------------------------------------------------------------------------------------------------------");
                LstDisponibles.Items.Add(disponibles[i].ToString());
            }
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}