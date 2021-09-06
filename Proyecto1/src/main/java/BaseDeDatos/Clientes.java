
package BaseDeDatos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Clientes {
    private Conexion Con;
    private ResultSet Rs;
    private Connection Conn;

    public Clientes() {
    }
    
    public void CrearCliente(String[] Datos){
        Con = new Conexion();
        Con.IniciarConexion();
        PreparedStatement ps;
        String sql;
        try {
            sql = "insert into clientes (Nit, Nombre,Direccion,Municipio,Departamento) values (?,?,?,?,?);";
            Conn = Con.getConexion();
            ps = Conn.prepareStatement(sql);
            ps.setString(1, Datos[0]);
            ps.setString(2, Datos[1]);
            ps.setString(3, Datos[2]);
            ps.setString(4, Datos[3]);
            ps.setString(5, Datos[4]);
            ps.executeUpdate();          
            Con.CerrarConexiones();
            Conn.close();
        } catch (SQLException ex) {
        }
    }
    public String NombrePorNit(String Nit){
                Con = new Conexion();
        try {
            ResultSet BusquedaID = Con.IniciarConexion().executeQuery("SELECT * FROM Clientes WHERE Nit='"+Nit+"';");
            String Carac;
                if(BusquedaID.next()){
                    Carac = BusquedaID.getString(2);
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
}
