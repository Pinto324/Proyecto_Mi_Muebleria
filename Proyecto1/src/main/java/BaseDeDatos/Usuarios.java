
package BaseDeDatos;

import java.sql.*;
import java.util.logging.Level;

/**
 *
 * @author branp
 */
public class Usuarios {
    private Conexion Con;
    private ResultSet Rs;
    private Connection Conn;
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
        public String CrearUsuario(String Nom, String Contra, int Area){
        Con = new Conexion();
        Con.IniciarConexion();
        PreparedStatement ps;
        String sql;
        try {
            sql = "insert into Usuarios (Nick, Contraseña,Activo,Area) values (?,?,?,?);";
            Conn = Con.getConexion();
            ps = Conn.prepareStatement(sql);
            ps.setString(1, Nom);
            ps.setString(2, Contra);
            ps.setBoolean(3, true);
            ps.setInt(4, Area);
            ps.executeUpdate();          
            Con.CerrarConexiones();
            Conn.close();
            return "Se ingresó el usuario con exito";
        } catch (SQLException ex) {
            return "A ocurrido un error de conexion, intente más tarde";
        }
    }
}
