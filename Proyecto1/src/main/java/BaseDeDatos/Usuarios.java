
package BaseDeDatos;

import static java.lang.System.out;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author branp
 */
public class Usuarios {
    private final String Nick = "root";
    private final String Pass = "Q1W2E3R4T5Y6";
    private final String URLuser = "jdbc:mysql://localhost:3306/control_mi_muebleria";
    private ResultSet Rs;
    private Connection Conexion;
    public Usuarios() {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Conexion = DriverManager.getConnection(URLuser, Nick, Pass);
            Statement s = Conexion.createStatement();
            Rs = s.executeQuery ("select * from Usuarios;");
        }catch(SQLException e){
             System.out.println("Error al abrir Conexión: " + e.getMessage());   
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public String[] ComprobarUsuario(String UsuarioABuscar) throws SQLException{
        String[] Carac = new String[4];
        while (Rs.next()){
            JOptionPane.showMessageDialog(null, Rs.getString(1));
            if(Rs.getString (1).equals(UsuarioABuscar)){
                Carac[0] = Rs.getString (1);
                Carac[1] = Rs.getString (2);
                Carac[2] = String.valueOf(Rs.getInt (3));
                Carac[3] = String.valueOf(Rs.getInt (4));
            }
        }
        return Carac;
    }
    public String[] Prueba() throws SQLException{
        String[] Carac = new String[4];
        Rs.next();
        Carac[0] = Rs.getString (1);
                Carac[1] = Rs.getString (2);
                Carac[2] = String.valueOf(Rs.getInt (3));
                Carac[3] = String.valueOf(Rs.getInt (4));
                return Carac;
    }
}
