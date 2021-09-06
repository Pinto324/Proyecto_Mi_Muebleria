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
public class Conexion {
    private final String Nick = "Muebleria_Admin";
    private final String Pass = "Q1W2E3R4T5Y6";
    private final String URLuser = "jdbc:mysql://localhost:3306/control_mi_muebleria";
    private ResultSet Rs;
    private Statement s;
    private Connection Conexion;

    public Conexion() {
    }

    public ResultSet getRs() {
        return Rs;
    }

    public void setRs(ResultSet Rs) {
        this.Rs = Rs;
    }

    public Statement getS() {
        return s;
    }

    public void setS(Statement s) {
        this.s = s;
    }

    public Connection getConexion() {
        return Conexion;
    }

    public void setConexion(Connection Conexion) {
        this.Conexion = Conexion;
    }
    public Statement IniciarConexion(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Conexion = DriverManager.getConnection(URLuser, Nick, Pass);
            s = Conexion.createStatement();
        }catch(SQLException e){
             System.out.println("Error al abrir Conexión: " + e.getMessage());   
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
        public void CerrarConexiones() throws SQLException{
            Conexion.close();
            s.close();
        }
}
