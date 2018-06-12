using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;

public partial class frmTotalRecaudadoporVehiculo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {

    }
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {

            lstAlquileres.Items.Clear();
            List<Alquiler> Lista = LAlquiler.ListarAlquiler(txtmatricula.Text);
            if (Lista.Count==0)
                lblError.Text = "No existe el vehiculo o no tiene alquileres relacionados.";
            else
            {
                for (int i = 0; i < Lista.Count; i++)
                {
                    lstAlquileres.Items.Add("---------------------------------------------------------------------------------------------------------------------------------------");
                    lstAlquileres.Items.Add(Lista[i].ToString());

                }


                lblError.Text = "Total recaudado por el vehiculo: " + LAlquiler.TotalRecaudado(txtmatricula.Text).ToString();
            }
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }
}