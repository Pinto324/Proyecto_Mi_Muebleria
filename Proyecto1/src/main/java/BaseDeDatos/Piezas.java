/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseDeDatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author branp
 */
public class Piezas {
    private final String Nick = "root";
    private final String Pass = "Q1W2E3R4T5Y6";
    private final String URLuser = "jdbc:mysql://localhost:3306/control_mi_muebleria";
    private ResultSet Rs;
    private Connection Conexion;

    public Piezas() {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Conexion = DriverManager.getConnection(URLuser, Nick, Pass);
            Statement s = Conexion.createStatement();
            Rs = s.executeQuery ("select * from Piezas;");
        }catch(SQLException e){
             System.out.println("Error al abrir Conexión: " + e.getMessage());   
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Connection getConexion() {
        return Conexion;
    }

    public void setConexion(Connection Conexion) {
        this.Conexion = Conexion;
    }

    public ResultSet getRs() {
        return Rs;
    }

    public void setRs(ResultSet Rs) {
        this.Rs = Rs;
    }
    
    
}
