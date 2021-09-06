
package BaseDeDatos;

import Usuarios.ModeloPieza;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class Muebles {
    private Conexion Con;
    private Connection Conn;
        public Muebles() {
        }
        
    public boolean CrearMueble(String[] Strings, int[] Enteros, double Precio, Date fecha){
        Con = new Conexion();
        Con.IniciarConexion();
        PreparedStatement ps;
        String sql;
        try {
            sql = "insert into muebles (Nombre,Creador,FechaEnsamble,Precio,VecesVendido,Existencias) values (?,?,?,?,?,?);";
            Conn = Con.getConexion();
            ps = Conn.prepareStatement(sql);
            ps.setString(1, Strings[0]);
            ps.setString(2, Strings[1]);
            ps.setDate(3, fecha);
            ps.setDouble(4, Precio);
            ps.setInt(5, Enteros[0]);
            ps.setInt(5, Enteros[1]);
            ps.executeUpdate();          
            Con.CerrarConexiones();
            Conn.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Piezas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean ComprobarMueble(String Nombre) throws SQLException{
        Con = new Conexion();
        ResultSet Tabla = Con.IniciarConexion().executeQuery("select * from muebles;");
        boolean llave = false;
        while (Tabla.next()){
            if(!(Tabla.getString (1).equals(Nombre))){                
            }else{
                llave = true;
            }
        }
        if(llave){
            Con.CerrarConexiones();
            return false;
        }else{
            Con.CerrarConexiones();
            return true;
        }     
    }
    public boolean ComprobarEnsamble(String[] Datos) throws SQLException{
        Con = new Conexion();
        ResultSet Tabla = Con.IniciarConexion().executeQuery("select * from ensamble_muebles;");
        boolean llave = false;
        while (Tabla.next()){
            if(!(Tabla.getString (2).equals(Datos[0]))&&!(Tabla.getString (3).equals(Datos[1]))){                
            }else{
                llave = true;
            }
        }
        if(llave){
            Con.CerrarConexiones();
            return false;
        }else{
            Con.CerrarConexiones();
            return true;
        }     
    }
    public boolean CrearEnsamble(String[] Strings, int Entero){
        Con = new Conexion();
        Con.IniciarConexion();
        PreparedStatement ps;
        String sql;
        try {
            sql = "insert into ensamble_muebles (NombreDeMueble,NombreDePieza,CantidadPieza) values (?,?,?);";
            Conn = Con.getConexion();
            ps = Conn.prepareStatement(sql);
            ps.setString(2, Strings[0]);
            ps.setString(3, Strings[1]);
            ps.setInt(4, Entero);
            ps.executeUpdate();          
            Con.CerrarConexiones();
            Conn.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Piezas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
        public boolean EnsamblarMueble(String Nombre){
        try{
            Con = new Conexion();
            Con.IniciarConexion();
            ResultSet BusquedaID = Con.IniciarConexion().executeQuery("SELECT * FROM Muebles WHERE Nombre='"+Nombre+"';");
            int Carac;
                if(BusquedaID.next()){
                    Carac = BusquedaID.getInt(6);
                }else{
                    Carac = -1;
                }
                    if(Carac> 0){
                        Carac++;    
                        String Ssql = "UPDATE Muebles SET Existencias=? WHERE Nombre=?";
                        PreparedStatement cambio = Con.getConexion().prepareStatement(Ssql);
                        cambio.setInt(1, Carac);
                        cambio.setString(2, Nombre);
                        cambio.executeUpdate();
                        Con.CerrarConexiones();
                        return true;
                    }
        }catch(SQLException e){
        }
        return false;
    }
}
