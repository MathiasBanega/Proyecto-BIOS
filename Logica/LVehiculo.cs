using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
   public class LVehiculo
    {
       public static void Eliminar(Vehiculos _Vehiculo)
       {
           PVehiculo.Eliminar(_Vehiculo);
       }

       public static void Agregar(Vehiculos _Vehiculo)
       {
           if (_Vehiculo is Autos)
               PAuto.Agregar((Autos)_Vehiculo);
           else
               PUtilitario.Agregar((Utilitarios)_Vehiculo);
       }

       public static void Modificar(Vehiculos _Vehiculo)
       {
           if (_Vehiculo is Autos)
               PAuto.Modificar((Autos)_Vehiculo);
           else
               PUtilitario.Modificar((Utilitarios)_Vehiculo);
       }

       public static Vehiculos Buscar(string _Matricula)
       {
           Vehiculos v = null;

           v = PAuto.Buscar(_Matricula);

           if (v == null)
                v = PUtilitario.Buscar(_Matricula);
           return v;
       }

       public static List<Vehiculos> ListarDisponibles(DateTime fechaI, DateTime fechaF)
       {
           List<Vehiculos> lista = new List<Vehiculos>();
           
           lista = PAuto.ListarAutos(fechaI, fechaF);
           lista.AddRange(PUtilitario.ListarUtilitarios(fechaI,fechaF));

           return lista;
       }

       
    }
}
