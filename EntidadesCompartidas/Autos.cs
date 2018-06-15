using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
   public class Autos:Vehiculos
    {
        
        private string anclaje;

        

        public string Anclaje
        {
            get { return anclaje; }
            set { anclaje = value; }
        }

        
       
        public Autos(string oMatricula,string oMarca,string oModelo, int oAño,int oPuertas,decimal oCosto,string oAnclaje)
            :base(oMatricula ,oMarca, oModelo, oAño, oPuertas, oCosto)
        {
            Anclaje = oAnclaje;
        }

        public override string ToString()
        {
            return "AUTO: " + base.ToString() + " -- " + anclaje;
        }
        
    }
}
