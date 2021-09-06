
package BaseDeDatos;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

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
            return "Ya existe un usuario con ese nombre de usuario, elija otro porfavor";
        }
    }
        public String[] BuscarPorNombre(String Nom){
        Con = new Conexion();
        try {
            ResultSet BusquedaID = Con.IniciarConexion().executeQuery("SELECT * FROM Usuarios WHERE Nick='"+Nom+"';");
            String[] Carac = new String[4];
                if(BusquedaID.next()){  
                    Carac[0] = BusquedaID.getString(1);
                    Carac[1] = BusquedaID.getString(2);
                    Carac[2] = String.valueOf(BusquedaID.getInt(3));
                    Carac[3] = String.valueOf(BusquedaID.getInt(4));
                }else{
                    BusquedaID.close();
                    Con.CerrarConexiones();
                    return null;
                }
                BusquedaID.close();
                Con.CerrarConexiones();
                return Carac;            
        } catch (SQLException ex) {
        }
        return null;
    }
    public boolean ModificarDatos(String Nombre, String Contra, int Area, boolean activo){
        try{
            Con = new Conexion();
            Con.IniciarConexion();
            String Ssql = "UPDATE Usuarios SET Nick=?,  Contraseña=?, Activo=?,Area=? WHERE Nick=?";
            PreparedStatement cambio = Con.getConexion().prepareStatement(Ssql);
            cambio.setString(1, Nombre);
            cambio.setString(2, Contra);
            cambio.setInt(3, Area);
            cambio.setBoolean(4, activo);
            cambio.setString(5, Nombre);
            cambio.executeUpdate();
            Con.CerrarConexiones();
            return true;
        }catch(SQLException e){
            return false;
        }
    }
}
