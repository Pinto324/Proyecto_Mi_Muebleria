/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuarios;

import BaseDeDatos.Piezas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author branp
 */
public class ControladorPieza {
    private Piezas PiezasBD;
    private ModeloPieza modelo;
    private Connection con;

    public ControladorPieza() {
        PiezasBD = new Piezas();
        modelo = new ModeloPieza();    
    }
    public void CrearPieza(String Nombre,double Costo ,int existencias){
        PreparedStatement ps;
        String sql;
        modelo.setNombre(Nombre);
        modelo.setPrecio(Costo);
        modelo.setExistencias(existencias);
        try{
            con = PiezasBD.getConexion();
            sql = " insert into Piezas (Nombre_Pieza,Costo,existencias) values (?,?,?);";
            ps = con.prepareStatement(sql);
            ps.setString(1, modelo.getNombre());
            ps.setDouble(2, modelo.isPrecio());
            ps.setInt(3, modelo.getExistencias());
            ps.executeUpdate();
            JOptionPane.showMessageDialog(null, "disque lo creo");
        }catch(SQLException e){
        }
    }
    public boolean ComprobarPieza(String Nombre,double Costo) throws SQLException{
        ResultSet Tabla = PiezasBD.getRs();
        boolean llave = false;
        String[] Carac = new String[4];
        while (Tabla.next()){
            if(!(Tabla.getString (2).equals(Nombre))&&!(Tabla.getString(3).equals(Costo))){                
            }else{
                llave = true;
            }
        }
        if(llave){
            return false;
        }else{
            return true;
        }
    }
    
}
