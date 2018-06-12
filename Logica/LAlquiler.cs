using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
   public class LAlquiler
    {
       public static void Alquilar(Alquiler _Alquiler)
       {
           PAlquiler.Alquilar(_Alquiler);
       }

       public static List<Alquiler> ListarAlquiler(string _Matricula)
       {
            return PAlquiler.ListaAlquileres(_Matricula);
       }

       public static decimal TotalRecaudado(string _Matricula)
       {
           return PAlquiler.TotalRecaudado(_Matricula);
       }
    }
}
