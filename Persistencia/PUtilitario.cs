using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using EntidadesCompartidas;

namespace Persistencia
{
    public class PUtilitario
    {
        public static void Agregar(Utilitarios _Utilitario)
        {
            
            SqlConnection _conexion = new SqlConnection(Conexion.con);
            SqlCommand _comando = new SqlCommand("AgregarUtilitario ", _conexion);

            _comando.CommandType = CommandType.StoredProcedure;
            
            _comando.Parameters.AddWithValue("@mat", _Utilitario.Matricula);
            _comando.Parameters.AddWithValue("@marca", _Utilitario.Marca);
            _comando.Parameters.AddWithValue("@mod", _Utilitario.Modelo);
            _comando.Parameters.AddWithValue("@año", _Utilitario.Año);
            _comando.Parameters.AddWithValue("@puertas", _Utilitario.Puertas);
            _comando.Parameters.AddWithValue("@costo", _Utilitario.Costo);
            _comando.Parameters.AddWithValue("@capacidad", _Utilitario.Capacidad);
            _comando.Parameters.AddWithValue("@Furgo", _Utilitario.Furgoneta_pickup);
            
            SqlParameter _retorno = new SqlParameter("@retorno", SqlDbType.Int);
            
            _retorno.Direction = ParameterDirection.ReturnValue;
            
            _comando.Parameters.Add(_retorno);

            try
            {
                
                _conexion.Open();
                
                _comando.ExecuteNonQuery();
                
                if ((int)_retorno.Value == -1)
                    throw new Exception("Existe un vehiculo con esa matricula.");
                else if ((int)_retorno.Value == 0)
                    throw new Exception("Error al agregar el vehiculo.");
            }

            catch (Exception ex)
            { throw ex; }

            finally
            { _conexion.Close(); }

        }

        public static void Modificar(Utilitarios _Utilitario)
        {
            
            SqlConnection _conexion = new SqlConnection(Conexion.con);
            
            SqlCommand _comando = new SqlCommand("ModificarUtilitario ", _conexion);
            
            _comando.CommandType = CommandType.StoredProcedure;
            
            _comando.Parameters.AddWithValue("@mat", _Utilitario.Matricula);
            _comando.Parameters.AddWithValue("@marca", _Utilitario.Marca);
            _comando.Parameters.AddWithValue("@mod", _Utilitario.Modelo);
            _comando.Parameters.AddWithValue("@año", _Utilitario.Año);
            _comando.Parameters.AddWithValue("@puertas", _Utilitario.Puertas);
            _comando.Parameters.AddWithValue("@costo", _Utilitario.Costo);
            _comando.Parameters.AddWithValue("@capacidad", _Utilitario.Capacidad);
            _comando.Parameters.AddWithValue("@Furgo", _Utilitario.Furgoneta_pickup);
            
            SqlParameter _retorno = new SqlParameter("@retorno", SqlDbType.Int);
            _retorno.Direction = ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            try
            {
                
                _conexion.Open();
                
                _comando.ExecuteNonQuery();
                
                if ((int)_retorno.Value == -1)
                    throw new Exception("El vehiculo no existe.");
                else if ((int)_retorno.Value == -2)
                    throw new Exception("El vehiculo no es Utilitario.");
                else if ((int)_retorno.Value == 0)
                    throw new Exception("Error al modificar el vehiculo.");
            }

            catch (Exception ex)
            { throw ex; }

            finally
            { _conexion.Close(); }
        }

        public static Utilitarios Buscar(string _Matricula)
        {
            
            string matricula, modelo, marca, furgo;
            int año, puertas, capacidad;
            decimal costo;
            Utilitarios u = null;

            SqlDataReader _lector;
            SqlConnection _conexion = new SqlConnection(Conexion.con);
            SqlCommand _comando = new SqlCommand("Exec BuscarUtilitario "+_Matricula, _conexion);

            try
            {
                
                _conexion.Open();
                
                _lector = _comando.ExecuteReader();

                if (_lector.Read())
                {
                    matricula = (string)_lector["matricula"];
                    modelo = (string)_lector["modelo"];
                    marca = (string)_lector["marca"];
                    furgo = (string)_lector["furgoneta_pickup"];
                    puertas = (int)_lector["puertas"];
                    año = (int)_lector["año"];
                    capacidad = (int)_lector["capacidad"];
                    costo = (decimal)_lector["costo"];

                    u = new Utilitarios(matricula, marca, modelo, año, puertas, costo, capacidad, furgo);
                    _lector.Close();
                }
            }

            catch (Exception ex)
            { throw new Exception("Error en la base de datos " + ex); }

            finally
            {_conexion.Close();}

            return u;
            
 
        }

        public static List<Vehiculos> ListarUtilitarios(DateTime _fechai, DateTime _fechaF)
        {

            string matricula, modelo, marca, furgo;
            int año, puertas, capacidad;
            decimal costo;
            List<Vehiculos>_lista = new List<Vehiculos>();
            Utilitarios u = null;

            SqlDataReader _lector;
            SqlConnection _conexion = new SqlConnection(Conexion.con);
            SqlCommand _comando = new SqlCommand("UtilitariosDisponibles ",_conexion);
            _comando.CommandType = CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@inicio", _fechai);
            _comando.Parameters.AddWithValue("@fin", _fechaF);

            try
            {
                _conexion.Open(); ;
                _lector = _comando.ExecuteReader();

                while (_lector.Read())
                {
                    matricula = (string)_lector["matricula"];
                    marca = (string)_lector["marca"];
                    modelo = (string)_lector["modelo"];
                    furgo = (string)_lector["furgoneta_pickup"];
                    año = (int)_lector["año"];
                    puertas = (int)_lector["puertas"];
                    capacidad = (int)_lector["capacidad"];
                    costo = (decimal)_lector["costo"];

                    u = new Utilitarios(matricula, marca, modelo, año, puertas, costo, capacidad, furgo);
                    _lista.Add(u);

                }

                _lector.Close();
            }

            catch (Exception ex)
            { throw new Exception("Error en base de datos " + ex); }

            finally
            { _conexion.Close(); }

            return _lista;
           
        }
       
    }
}
