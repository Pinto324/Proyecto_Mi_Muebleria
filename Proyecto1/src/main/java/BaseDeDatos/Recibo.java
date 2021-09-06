/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BaseDeDatos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author branp
 */
public class Recibo {
    private Conexion Con;
    private ResultSet Rs;
    private Connection Conn;

    public Recibo() {
    }
    
    public boolean ExisteCodigo(String Codigo) throws SQLException{
        Con = new Conexion();
        Rs = Con.IniciarConexion().executeQuery("select * from facturas;");
        while (Rs.next()){
            if(Rs.getString (2).equals(Codigo)){
                return false;
            }
        }
        Rs.close();
        Con.CerrarConexiones();
        return true;
    }
    public boolean CrearVenta(String CodF, String Nm, double Precio,Date Fecha, String Nit, String Vendedor ){
        Con = new Conexion();
        Con.IniciarConexion();
        PreparedStatement ps;
        String sql;
        try {
            sql = "insert into Facturas(CodigoFactura, NombreMueble,PrecioProducto,Fecha,NitComprador, Autor) values (?,?,?,?,?,?);";
            Conn = Con.getConexion();
            ps = Conn.prepareStatement(sql);
            ps.setString(1, CodF);
            ps.setString(2, Nm);
            ps.setDouble(3, Precio);
            ps.setDate(4, Fecha);
            ps.setString(5, Nit);
            ps.setString(6, Vendedor);   
            ps.executeUpdate();    
            Con.CerrarConexiones();
            Conn.close();
            return true;
        } catch (SQLException ex) {
        }
        return false;
    }
    public String BuscarMax(String sql) throws SQLException{
        Con = new Conexion();
        Rs = Con.IniciarConexion().executeQuery("select * from facturas;");
        ArrayList<Integer> Nums = new ArrayList<>();
        boolean llave= false;
        ArrayList<String> Nombres = new ArrayList<>();
        int Mayor = -1;
        while (Rs.next()){
            if(Nombres.isEmpty()){
                Nombres.add(Rs.getString("Autor"));
                Nums.add(1);
            }
            for (int i = 0; i < Nombres.size(); i++) {
                if(!(Nombres.equals(Rs.getString("Autor")))){
                    llave = true;
                }else{
                    Nums.set(i, (Nums.get(i)+1));
                }
             }
            if(llave){
                Nombres.add(Rs.getString("Autor"));
            }
        }
        Rs = Con.IniciarConexion().executeQuery("select * from facturas WHERE c="+Mayor +";");
        Rs.next();
        String carac = Rs.getString("Autor");
        Rs.close();
        Con.CerrarConexiones();
        return carac;
    }
    
}
