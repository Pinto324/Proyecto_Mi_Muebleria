/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseDeDatos;

import Usuarios.ModeloPieza;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author branp
 */
public class Piezas {
    private Conexion Con;
    private Connection Conn;
    public Piezas() {

    }
    public void CrearPieza(ModeloPieza Piezas){
        JOptionPane.showMessageDialog(null, "Entro a crear pieza");
        Con = new Conexion();
        Con.IniciarConexion();
        PreparedStatement ps;
        String sql;
        try {
            sql = "insert into Piezas (Nombre_Pieza,Costo,existencias) values (?,?,?);";
            Conn = Con.getConexion();
            ps = Conn.prepareStatement(sql);
            ps.setString(1, Piezas.getNombre());
            ps.setDouble(2, Piezas.isPrecio());
            ps.setInt(3, Piezas.getExistencias());
            ps.executeUpdate();          
            Con.CerrarConexiones();
            Conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Piezas.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public boolean ComprobarPieza(String Nombre,double Costo) throws SQLException{
        Con = new Conexion();
        ResultSet Tabla = Con.IniciarConexion().executeQuery("select * from Piezas;");
        boolean llave = false;
        String[] Carac = new String[4];
        while (Tabla.next()){
            if(!(Tabla.getString (2).equals(Nombre))&&!(Tabla.getString(3).equals(Costo))){                
            }else{
                Con.CerrarConexiones();
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
    public boolean EliminarPorID(int ID){
        
        try{
            Con = new Conexion();        
            Con.IniciarConexion();
            PreparedStatement Borrador = Con.getConexion().prepareStatement("delete from Piezas where Id_Pieza='" + ID + "';");
            Borrador.executeUpdate();
            Con.CerrarConexiones();
            Borrador.close();
            return true;
        }catch(SQLException ex){
            return false;
        }
    }
    public boolean ModificarDatos(int ID, String Nombre, double Costo, int existencias){
        try{
            Con = new Conexion();
            Con.IniciarConexion();
            JOptionPane.showMessageDialog(null,"entro a hyper modificar");  
            String Ssql = "UPDATE Piezas SET Nombre_Pieza=?,  Costo=?, existencias=? WHERE Id_Pieza=?";
            PreparedStatement cambio = Con.getConexion().prepareStatement(Ssql);
            cambio.setString(1, Nombre);
            cambio.setDouble(2, Costo);
            JOptionPane.showMessageDialog(null,"costo "+Costo);
            cambio.setInt(3, existencias);
            cambio.setInt(4, ID);
            JOptionPane.showMessageDialog(null,"Existencias "+existencias);
            cambio.executeUpdate();
            JOptionPane.showMessageDialog(null,"hizo update"); 
            Con.CerrarConexiones();
            return true;
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null,"fail"); 
            return false;
        }
    }
    public String[] BuscarPorID(int ID){
        Con = new Conexion();
        try {
            ResultSet BusquedaID = Con.IniciarConexion().executeQuery("SELECT * FROM Piezas WHERE Id_Pieza='"+ID+"';");
            String[] Carac = new String[4];
                if(BusquedaID.next()){
                    Carac[0] = String.valueOf(BusquedaID.getInt(1));
                    Carac[1] = BusquedaID.getString(2);
                    Carac[2] = String.valueOf(BusquedaID.getDouble(3));
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
            JOptionPane.showMessageDialog(null, "catch");
            Logger.getLogger(Piezas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
