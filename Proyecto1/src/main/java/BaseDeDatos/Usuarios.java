
package BaseDeDatos;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author branp
 */
public class Usuarios {
    private Conexion Con;
    private ResultSet Rs;
    public Usuarios() {
    }
    public String[] ComprobarUsuario(String UsuarioABuscar) throws SQLException{
        Con = new Conexion();
        Rs = Con.IniciarConexion().executeQuery("select * from Usuarios;");
        String[] Carac = new String[4];
        while (Rs.next()){
            if(Rs.getString (1).equals(UsuarioABuscar)){
                Carac[0] = Rs.getString (1);
                Carac[1] = Rs.getString (2);
                Carac[2] = String.valueOf(Rs.getInt (3));
                Carac[3] = String.valueOf(Rs.getInt (4));
            }
        }
        Rs.close();
        Con.CerrarConexiones();
        return Carac;
    }
}
