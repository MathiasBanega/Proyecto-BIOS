using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EntidadesCompartidas;
using Persistencia;


namespace Logica
{
    public class LCliente
    {
        public static void Agregar(Clientes _Cliente)
        {
            PCliente.Agregar(_Cliente);
        }

        public static Clientes Buscar (int _Cedula)
        {
            Clientes c = null;
            return c = PCliente.Buscar(_Cedula);
        }

        public static void Modificar(Clientes _Cliente)
        {
             PCliente.Modificar(_Cliente);
        }

        public static void Eliminar(Clientes _Cliente)
        {
            PCliente.Eliminar(_Cliente.Cedula);
        }

        
    }
}
