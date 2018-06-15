using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntidadesCompartidas
{
    public class Clientes
    {
        
        private int cedula;
        private int tarjeta;
        private string nombre;
        private int telefono;
        private string direccion;
        private DateTime fechaN;

        
        public int Cedula 
        {
            get { return cedula; }
            set {
                if (value > 9999999 && value <= 999999999)
                    cedula = value;
                else
                    throw new Exception("Cedula incorrecta.");
            }

        }

        public int Tarjeta
        {
            get { return tarjeta; }
            set {
                if (value > 0)
                    tarjeta = value;
                else
                    throw new Exception("Numero de tarjeta incorrecto");
                }
        }

        public string Nombre
        {
            get { return nombre; }
            set {
                if (value.Length > 0)
                {
                    for (int i = 0; i < value.Length; i++)
                        if (char.IsDigit(Convert.ToChar(value.Substring(i, 1))))
                        {
                            throw new Exception("El nombre no puede contener numeros.");
                        }

                        else
                            nombre = value;
                    
                }
                else
                    throw new Exception("Nombre necesario.");
            }
        }

        public int Telefono
        {
            get { return telefono; }
            set {
                if (value > 9999999 && value < 100000000)
                    telefono = value;
                else
                    throw new Exception("Numero de telefono incorrecto.");
            }
        }

        public string Direccion
        {
            get { return direccion; }
            set {               
                    if (value.Length > 0)
                    {
                       
                          for (int j = value.Length - 4; j < value.Length; j++)
                          {
                            if (!char.IsNumber(Convert.ToChar(value.Substring(j, 1))))
                            {
                                throw new Exception("Debe agregar numero de puerta.");
                            }
                          }
                            if (value.Length == 4)
                            throw new Exception("Error en direccion."); 
                                direccion = value;   
                    }
                        
                else
                    throw new Exception("Se necesita una direccion.");
            }
        }

        public DateTime FechaN
        {
            get { return fechaN; }
            set {
                    TimeSpan edad = DateTime.Now.Subtract(value);

                    if ((edad.Days / 365.25) >= 25)
                    {
                        fechaN = value;
                    }
                    else
                    {
                        throw new Exception("Error - Edad insuficiente");
                    } 
                }
        }

        

        public Clientes(int oCedula, int oTarjeta, string oNombre, int oTelefono, string oDireccion, DateTime oFecha)
        {
            Cedula = oCedula;
            Tarjeta = oTarjeta;
            Nombre = oNombre;
            Telefono = oTelefono;
            Direccion = oDireccion;
            FechaN = oFecha;
        }

        public override string ToString()
        {
            return ( Nombre + " -- " + Cedula + " -- " + Telefono + " -- " + FechaN.ToShortDateString() + " -- " + Tarjeta + " -- " + Direccion);
        }

    }
}
