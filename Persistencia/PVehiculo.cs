using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using System.Data;
using System.Data.SqlClient;

namespace Persistencia
{
   public class PVehiculo
    {
       
       public static void Eliminar(Vehiculos _Vehiculo)
       {
           SqlConnection _conexion = new SqlConnection(Conexion.con);
           SqlCommand _comando = new SqlCommand("EliminarVehiculo ",_conexion);
           _comando.CommandType = CommandType.StoredProcedure;

           //parametros para el PA
           SqlParameter _matricula = new SqlParameter("@mat",_Vehiculo.Matricula);
           //retorno
           SqlParameter _retorno = new SqlParameter("@retorno", SqlDbType.Int);
           _retorno.Direction = ParameterDirection.ReturnValue;
           
           _comando.Parameters.Add(_matricula);
           _comando.Parameters.Add(_retorno);

           try
           {
               _conexion.Open();
               _comando.ExecuteNonQuery();

               
               if ((int)_retorno.Value == -1)
                   throw new Exception("El Vehiculo no existe.");
               else if ((int)_retorno.Value == -2)
                   throw new Exception("No se puede eliminar el vehiculo, tiene alquileres asociados.");
               else if ((int)_retorno.Value == 0)
                   throw new Exception("Error al eliminar el vehiculo.");
           }

           catch (Exception ex)
           { throw ex; }

           finally
           { _conexion.Close(); }
       }

       }
 }

