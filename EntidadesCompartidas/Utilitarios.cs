using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
   public class Utilitarios:Vehiculos
    {
        
        private int capacidad;
        private string furgoneta_pickup;

        
        public int Capacidad
        {
            get { return capacidad; }
            set {
                if (value > 0)
                    capacidad = value;
                else
                    throw new Exception("Error: capacidad de carga");
            }
        }

        public string Furgoneta_pickup
        {
            get { return furgoneta_pickup; }
            set { furgoneta_pickup = value; }
        }

        

        public Utilitarios(string oMatricula, string oMarca, string oModelo, int oAño, int oPuertas, decimal oCosto, int oCapacidad, string oFurgoneta_pickup)
            : base(oMatricula, oMarca, oModelo, oAño, oPuertas, oCosto)
        {
            Capacidad = oCapacidad;
            Furgoneta_pickup = oFurgoneta_pickup;
        }

        public override string ToString()
        {
            return "UTILITARIO: " + base.ToString() + " -- " + Capacidad + " -- " + Furgoneta_pickup;
        }

    }
}
