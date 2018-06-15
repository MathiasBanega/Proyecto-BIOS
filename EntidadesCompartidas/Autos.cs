using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
   public class Autos:Vehiculos
    {
<<<<<<< HEAD
        
        private string anclaje;

        
=======
     
        private string anclaje;

>>>>>>> 094a83d663c3d60f3ae1ecf4f733261056bda7af

        public string Anclaje
        {
            get { return anclaje; }
            set { anclaje = value; }
        }

<<<<<<< HEAD
        
=======
       
>>>>>>> 094a83d663c3d60f3ae1ecf4f733261056bda7af
       
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
