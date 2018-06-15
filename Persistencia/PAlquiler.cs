using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using EntidadesCompartidas;

namespace Persistencia
{
   public class PAlquiler
    {
      
       public static void Alquilar(Alquiler _Alquiler)
       {
           SqlConnection _conexion = new SqlConnection(Conexion.con);
           SqlCommand _comando = new SqlCommand("Alquilar ", _conexion);
           _comando.CommandType = CommandType.StoredProcedure;
           _comando.Parameters.AddWithValue("@ci", _Alquiler.Cliente.Cedula);
           _comando.Parameters.AddWithValue("@matricula", _Alquiler.Vehiculo.Matricula);
           _comando.Parameters.AddWithValue("@fechai", _Alquiler.FechaInicio);
           _comando.Parameters.AddWithValue("@fechaf", _Alquiler.FechaFin);
           _comando.Parameters.AddWithValue("@costo", _Alquiler.Costo);

           SqlParameter _retorno = new SqlParameter();
           _retorno.Direction = ParameterDirection.ReturnValue;
           _comando.Parameters.Add(_retorno);

           try
           {
               _conexion.Open();
               _comando.ExecuteNonQuery();

               if ((int)_retorno.Value == -1)
                   throw new Exception("No existe el cliente.");
               else if ((int)_retorno.Value == -2)
                   throw new Exception("No existe el vehiculo.");
               else if ((int)_retorno.Value == -4)
                   throw new Exception("El vehiculo tiene un alquiler relacionado en estas fechas.");
           }

           catch (Exception ex)
           { throw ex; }

           finally
           { _conexion.Close(); }

       }

       public static List<Alquiler> ListaAlquileres(string _Matricula)//para total recaudado por vehiculo
       {
                  
           
           DateTime fechaI;//
           DateTime fechaF;//
           int codigo;//
           Alquiler a = null;    
           
           Clientes c = null;
           int cedula,tarjeta,telefono;
           string nombre,direccion;
           DateTime nacimiento;
           
           Vehiculos v = null;
           string matricula,marca,modelo;
           int año,puertas;
           decimal costo;          

           SqlDataReader _lector;
           List<Alquiler> _lista = new List<Alquiler>();
           SqlConnection _conexion = new SqlConnection(Conexion.con);
           SqlCommand _comando = new SqlCommand("HistorialAlquiler ", _conexion);
           
           _comando.CommandType = CommandType.StoredProcedure;
           _comando.Parameters.AddWithValue("@mat", _Matricula);

           try
           {
               _conexion.Open();
               _lector = _comando.ExecuteReader();

               while (_lector.Read())
               {
                   cedula = (int)_lector["ci"];
                   fechaI = (DateTime)_lector["FechaI"];
                   fechaF = (DateTime)_lector["fechaF"];
                   codigo = (int)_lector["codigo"];  
                   costo = (decimal)_lector["costo"];
                   tarjeta = (int)_lector["tarjeta"];
                   telefono = (int)_lector["telefono"];
                   nombre = (string)_lector["nombre"];
                   direccion = (string)_lector["direccion"];
                   nacimiento = (DateTime)_lector["fechaN"];
                   matricula = (string)_lector["matricula"];
                   marca = (string)_lector["marca"];
                   modelo = (string)_lector["modelo"];
                   año = (int)_lector["año"];
                   puertas = (int)_lector["puertas"];

                   v = new Vehiculos(matricula, marca, modelo, año, puertas, costo);
                   c = new Clientes(cedula, tarjeta, nombre, telefono, direccion, nacimiento);

                   a = new Alquiler(c, v, fechaI, fechaF, codigo);
                   _lista.Add(a);
               }

               _lector.Close();
           }

           catch (Exception ex)
           { throw ex; }

           finally
           { _conexion.Close(); }

           return _lista;
       }

       public static decimal TotalRecaudado(string _Matricula)
       {
           //va a ejecutar el PA para calcular el total que recaudo un vehiculo
           //y lo va a mostrar en el label de la pagina
           decimal total=0;

           SqlConnection _conexion = new SqlConnection(Conexion.con);
           SqlCommand _comando = new SqlCommand("Exec TotalVehiculo "+_Matricula, _conexion);
           SqlDataReader _lector;

           try
           {
               _conexion.Open();
               _lector = _comando.ExecuteReader();
               if (_lector.Read())
                   total = (decimal)_lector["Total_Vehiculo"];
               _lector.Close();
           }

           catch (Exception ex)
           {
               throw ex;
           }

           finally
           { _conexion.Close(); }

           return total;

       }
    }
}
