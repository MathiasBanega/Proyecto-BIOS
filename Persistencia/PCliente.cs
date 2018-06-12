using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using EntidadesCompartidas;

namespace Persistencia
{
    public class PCliente
    {
        public static void Agregar(Clientes _Cliente)
        {
            SqlConnection _conexion = new SqlConnection(Conexion.con);
            SqlCommand _comando = new SqlCommand("AgregarCliente ", _conexion);
            //le digo que es un procedimiento almacenado
            _comando.CommandType = CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@cedula", _Cliente.Cedula);
            _comando.Parameters.AddWithValue("@nombre", _Cliente.Nombre);
            _comando.Parameters.AddWithValue("@tarjeta", _Cliente.Tarjeta);
            _comando.Parameters.AddWithValue("@telefono", _Cliente.Telefono);
            _comando.Parameters.AddWithValue("@direccion", _Cliente.Direccion);
            _comando.Parameters.AddWithValue("@nacimiento", _Cliente.FechaN);

            SqlParameter _retorno = new SqlParameter("@retorno", SqlDbType.Int);
            _retorno.Direction = ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            try
            {
                _conexion.Open();
                _comando.ExecuteNonQuery();

                if ((int)_retorno.Value == -1)
                    throw new Exception("El cliente ya esta registrado.");
                else if ((int)_retorno.Value == -2)
                    throw new Exception("Error al registrar el cliente.");

            }

            catch (Exception ex)
            { throw ex; }

            finally
            { _conexion.Close(); }

        }

        public static void Modificar(Clientes _Cliente)
        {
            SqlConnection _conexion = new SqlConnection(Conexion.con);
            SqlCommand _comando = new SqlCommand("ModificarCliente ",_conexion);
            _comando.CommandType = CommandType.StoredProcedure;

            _comando.Parameters.AddWithValue("@cedula",_Cliente.Cedula);
            _comando.Parameters.AddWithValue("@nombre", _Cliente.Nombre);
            _comando.Parameters.AddWithValue("@tarjeta", _Cliente.Tarjeta);
            _comando.Parameters.AddWithValue("@telefono", _Cliente.Telefono);
            _comando.Parameters.AddWithValue("@direccion", _Cliente.Direccion);
            _comando.Parameters.AddWithValue("@nacimiento", _Cliente.FechaN);
            
            SqlParameter _retorno = new SqlParameter("@retorno",SqlDbType.Int); 
            _retorno.Direction = ParameterDirection.ReturnValue;

            _comando.Parameters.Add(_retorno);

            try
            {
                _conexion.Open();
                _comando.ExecuteNonQuery();

                if ((int)_retorno.Value == -1)
                    throw new Exception("El cliente no existe.");
                else if ((int)_retorno.Value == -2)
                    throw new Exception("Error al Modificar el cliente.");
            }

            catch (Exception ex)
            { throw ex; }

            finally
            { _conexion.Close();}
        }

        public static void Eliminar(int _Cedula)
        {
            SqlConnection _conexion = new SqlConnection(Conexion.con);
            SqlCommand _comando = new SqlCommand("EliminarCliente ", _conexion);
            _comando.CommandType = CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@cedula", _Cedula);
            SqlParameter _retorno = new SqlParameter("@retorno", SqlDbType.Int);
            _retorno.Direction = ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            try
            {
                _conexion.Open();
                _comando.ExecuteNonQuery();
               
                if ((int)_retorno.Value == -1)
                    throw new Exception("El cliente no existe.");
                else if ((int)_retorno.Value == -2)
                    throw new Exception("Error al Eliminar al cliente.");
            }

            catch (Exception ex)
            { throw ex; }

            finally
            { _conexion.Close(); }

        }

        public static Clientes Buscar(int _Cedula)//capturo la matricula desde la pagina y devuelvo un cliente
        {

            int tarjeta,telefono;
            string nombre,direccion;
            DateTime nacimiento;      
            Clientes c = null;

            SqlDataReader _lector;
            SqlConnection _conexion = new SqlConnection(Conexion.con);
            SqlCommand _comando = new SqlCommand("BuscarCliente ",_conexion);
            _comando.CommandType = CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@ci", _Cedula);
            SqlParameter _retorno = new SqlParameter("@retorno", SqlDbType.Int);
            _retorno.Direction = ParameterDirection.ReturnValue;


            try
            {
                _conexion.Open();
                _lector = _comando.ExecuteReader();

                if (_lector.Read())
                {
                    tarjeta = (int)_lector["tarjeta"];
                    telefono = (int)_lector["telefono"];
                    nombre = (string)_lector["nombre"];
                    direccion = (string)_lector["direccion"];
                    nacimiento = (DateTime)_lector["fechaN"];
                    c = new Clientes(_Cedula, tarjeta, nombre, telefono, direccion, nacimiento);
                }

            }

            catch (Exception ex)
            { throw ex; }
            finally
            { _conexion.Close(); }
             
            return c;
        }

    

    }
}
