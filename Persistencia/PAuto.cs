using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using EntidadesCompartidas;

namespace Persistencia
{
     public class PAuto
    {
<<<<<<< HEAD
        
=======
       
>>>>>>> 094a83d663c3d60f3ae1ecf4f733261056bda7af

         public static void Agregar(Autos _Auto)
         {
             SqlConnection _conexion = new SqlConnection(Conexion.con);
             SqlCommand _comando = new SqlCommand("AgregarAuto ", _conexion);
<<<<<<< HEAD
             _comando.CommandType = CommandType.StoredProcedure; 
              
             
=======
             _comando.CommandType = CommandType.StoredProcedure;
             
             
>>>>>>> 094a83d663c3d60f3ae1ecf4f733261056bda7af
            
             _comando.Parameters.AddWithValue("@mat", _Auto.Matricula);
             _comando.Parameters.AddWithValue("@marca", _Auto.Marca);
             _comando.Parameters.AddWithValue("@mod", _Auto.Modelo);
             _comando.Parameters.AddWithValue("@año", _Auto.Año);
             _comando.Parameters.AddWithValue("@puertas", _Auto.Puertas);
             _comando.Parameters.AddWithValue("@costo", _Auto.Costo);
             _comando.Parameters.AddWithValue("@anclaje", _Auto.Anclaje);

             SqlParameter _retorno = new SqlParameter("@retorno", SqlDbType.Int);
             _retorno.Direction = ParameterDirection.ReturnValue;
             _comando.Parameters.Add(_retorno);

             try
             {
                 
                 _conexion.Open();
                 
                 _comando.ExecuteNonQuery();
<<<<<<< HEAD
                 
=======
                
>>>>>>> 094a83d663c3d60f3ae1ecf4f733261056bda7af
                 if ((int)_retorno.Value == -1)
                     throw new Exception("Ya existe un vehiculo con esa matricula en el sistema.");
                 else if ((int)_retorno.Value == 0)
                     throw new Exception("Error en alta del Vehiculo.");
             }

             catch (Exception ex)
             { throw ex; }

             finally
             { _conexion.Close(); }
         }

         public static void Modificar(Autos _Auto)
         {
             SqlConnection _conexion = new SqlConnection(Conexion.con);
             SqlCommand _comando = new SqlCommand("ModificarAuto ", _conexion);
             _comando.CommandType = CommandType.StoredProcedure;

             _comando.Parameters.AddWithValue("@mat", _Auto.Matricula);
             _comando.Parameters.AddWithValue("@marca", _Auto.Marca);
             _comando.Parameters.AddWithValue("@mod", _Auto.Modelo);
             _comando.Parameters.AddWithValue("@año", _Auto.Año);
             _comando.Parameters.AddWithValue("@puertas", _Auto.Puertas);
             _comando.Parameters.AddWithValue("@costo", _Auto.Costo);
             _comando.Parameters.AddWithValue("@anclaje", _Auto.Anclaje);

             SqlParameter _retorno = new SqlParameter("@retorno", SqlDbType.Int);
             _retorno.Direction = ParameterDirection.ReturnValue;

            
             _comando.Parameters.Add(_retorno);

             try
             {
<<<<<<< HEAD
                 
                 _conexion.Open();
                 
=======
                
                 _conexion.Open();
                
>>>>>>> 094a83d663c3d60f3ae1ecf4f733261056bda7af
                 _comando.ExecuteNonQuery();
                 
                 if ((int)_retorno.Value == -1)
                     throw new Exception("El Vehiculo no existe");
                 else if ((int)_retorno.Value == -2)
                     throw new Exception("El vehiculo no es un auto.");
                 else if ((int)_retorno.Value == 0)
                     throw new Exception("Error al Modificar el Vehiculo.");
             }

             catch (Exception ex)
             { throw ex; }

             finally
             { _conexion.Close(); }

         }

         public static Autos Buscar(string _mat)
         {
<<<<<<< HEAD
             
=======
        
>>>>>>> 094a83d663c3d60f3ae1ecf4f733261056bda7af
             string matricula;
             string marca;
             string modelo;
             int año;
             int puertas;
             decimal costo;
             string anclaje;
<<<<<<< HEAD
             
=======
        
>>>>>>> 094a83d663c3d60f3ae1ecf4f733261056bda7af
             Autos a = null;

             if (_mat.Length != 7)
                 throw new Exception("Matricula incorrecta.");

             SqlDataReader _Lector;
             SqlConnection _conexion = new SqlConnection(Conexion.con);
             SqlCommand _comando = new SqlCommand("Exec BuscarAuto "+ _mat, _conexion);

             try
             {
<<<<<<< HEAD
                 
=======
                
>>>>>>> 094a83d663c3d60f3ae1ecf4f733261056bda7af
                 _conexion.Open();
                 
                 _Lector = _comando.ExecuteReader();

                 if (_Lector.Read())
                 {
<<<<<<< HEAD
                     
=======
                    
>>>>>>> 094a83d663c3d60f3ae1ecf4f733261056bda7af
                     matricula = (string)_Lector["matricula"];
                     marca = (string)_Lector["marca"];
                     modelo = (string)_Lector["modelo"];
                     año = (int)_Lector["año"];
                     puertas = (int)_Lector["puertas"];
                     costo = (decimal)_Lector["costo"];
                     anclaje = (string)_Lector["anclaje"];
                     a = new Autos(matricula, marca, modelo, año, puertas, costo, anclaje);
                 }

                 _Lector.Close();
             }

             catch (Exception ex)
             { throw new Exception("Problemas con la base de datos" + ex.Message); }

             finally
             { _conexion.Close(); }

<<<<<<< HEAD
             return a;            
=======
             return a;        
>>>>>>> 094a83d663c3d60f3ae1ecf4f733261056bda7af
         }

         public static List<Vehiculos> ListarAutos(DateTime _fechaI, DateTime _fechaF)
         {
             
             string matricula;
             string marca;
             string modelo;
             int año;
             int puertas;
             decimal costo;
             string anclaje;

             Autos a = null;

             List<Vehiculos> _Lista = new List<Vehiculos>();
             SqlDataReader _Lector;
             SqlConnection _conexion = new SqlConnection(Conexion.con);
             SqlCommand _comando = new SqlCommand("AutosDisponibles ",_conexion);
             _comando.CommandType = CommandType.StoredProcedure;
             _comando.Parameters.AddWithValue("@inicio", _fechaI);
             _comando.Parameters.AddWithValue("@fin", _fechaF);

             try
             {
                 _conexion.Open();
                 _Lector = _comando.ExecuteReader();

                 while (_Lector.Read())
                 {
                     
                     matricula = (string)_Lector["matricula"];
                     marca = (string)_Lector["marca"];
                     modelo = (string)_Lector["modelo"];
                     año = (int)_Lector["año"];
                     puertas = (int)_Lector["puertas"];
                     costo = (decimal)_Lector["costo"];
                     anclaje = (string)_Lector["anclaje"];
                     a = new Autos(matricula, marca, modelo, año, puertas, costo, anclaje);
                     _Lista.Add(a);
                 }

                 _Lector.Close();

             }

             catch (Exception ex)
             { throw new Exception("Error en base de datos "+ex); }

             finally
             { _conexion.Close(); }

             return _Lista;
         } 

    }
}
