using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Alquiler
    {
        
        private int codigo;
        private Clientes cliente;
        private Vehiculos vehiculo;
        private DateTime fechaInicio;
        private DateTime fechaFin;
        


       
        public int Codigo
        {
            get { return codigo; }
            set
            {
                if (value >= 0)
                    codigo = value;
                else
                    throw new Exception("Error: Codigo de alquiler.");
            }
        }

        public Clientes Cliente
        {
            get { return cliente; }
            set
            {
                if (value != null)
                    cliente = value;

                else
                    throw new Exception("Se necesita un cliente.");
            }
        }

        public Vehiculos Vehiculo
        {
            get { return vehiculo; }
            set
            {
                if (value != null)
                    vehiculo = value;
                else
                    throw new Exception("Se necesita un Vehiculo.");
            }
        }

        public DateTime FechaInicio
        {
            get { return fechaInicio; }

            set
            {                
                    fechaInicio = value;
            }

        }

        public DateTime FechaFin
        {
            get { return fechaFin; }
            set
            {
                TimeSpan dif = value.Subtract(FechaInicio);
                if (value >= fechaInicio)
                {
                    if (dif.TotalDays > 0)
                        fechaFin = value;
                    else
                        throw new Exception("Alquiler minimo 1 dia.");
                }

                else
                    throw new Exception("La fecha de devolucion no puede ser menor a la fecha de inicio.");
            }
        }

        public decimal Costo
        {
            get
            {
                int cantDias = (fechaFin.Subtract(fechaInicio)).Days;
                return (this.vehiculo.Costo * cantDias);
            }

        }

        

        public Alquiler(Clientes oCliente, Vehiculos oVehiculo, DateTime Inicio, DateTime Fin)
        {
            Cliente = oCliente;
            Vehiculo = oVehiculo;
            FechaInicio = Inicio;
            FechaFin = Fin;
        }
        
        public Alquiler(Clientes oCliente, Vehiculos oVehiculo, DateTime Inicio, DateTime Fin,int oCodigo)
        {
            Cliente = oCliente;
            Vehiculo = oVehiculo;
            FechaInicio = Inicio;
            FechaFin = Fin;
            Codigo = oCodigo;         
        }

        public override string ToString()
        {
            return "Cod: " + codigo + " Matricula: " + vehiculo.Matricula + " C.I: " + cliente.Cedula + " Inicio: " + FechaInicio.ToShortDateString() + " Fin: " + FechaFin.ToShortDateString() + " Costo: " + Costo;
        }
        
    }
}
