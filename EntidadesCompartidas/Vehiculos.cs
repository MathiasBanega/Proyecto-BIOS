using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
   public class Vehiculos
    {

      
       private string matricula;
       private string marca;
       private string modelo;
       private int año;
       private int puertas;
       private decimal costo;

      

       public string Matricula
       {
           get { return matricula; }
           set 
           {
               if (value.Length == 7)
                   matricula = value;
               else
                   throw new Exception("Error en la matricula.\nEJ: ASD1234");
           }
       }

       public string Marca
       {
           get { return marca; }
           set 
           {
               if (value.Length > 0)
                   marca = value;
               else
                   throw new Exception("Se requiere una matricula.");
           }
       }

       public string Modelo
       {
           get { return modelo; }
           set
           {
               if (value.Length > 0)
                   modelo = value;
               else
                   throw new Exception("Se requiere un modelo");
           }
               
          

              
       }

       public int Año
       {
           get { return año; }
           set {
               if (value > 1979)
               {
                   if (value < 2018)
                       año = value;
                   else
                       throw new Exception("No se pueden agregar vehiculos que todavia no fueron construidos.");
               }
               else
                   throw new Exception("Solo se pueden agregar vehiculos de 1980 en adelante.");
           }
       }

       public int Puertas
       {
           get { return puertas; }
           set {
               if (value > 0 && value < 10)
                   puertas = value;
               else
                   throw new Exception("Error: cantidad de puertas.");
               }
       }

       public decimal Costo
       {
           get { return costo; }
           set {
                 if (value > 0)
                   costo = value;
                 else
                   throw new Exception("Error en el costo del vehiculo.");
               }
       }

       
       public Vehiculos(string oMatricula, string oMarca, string oModelo, int oAño, int oPuertas, decimal oCosto)
       {
           Matricula = oMatricula;
           Marca = oMarca;
           Modelo = oModelo;
           Año = oAño;
           Puertas = oPuertas;
           Costo = oCosto;
       }

       public override string ToString()
       {
           return  matricula +" -- "+ marca + " -- " + modelo + " -- " + año + " -- " + puertas + " -- " + costo;
       }

    }
}
