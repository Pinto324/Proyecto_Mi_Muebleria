/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controles;

import BaseDeDatos.Conexion;
import BaseDeDatos.Muebles;
import BaseDeDatos.Recibo;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import javax.swing.JOptionPane;

/**
 *
 * @author branp
 */
public class ControladorRecibo {
    private static String CodeRecibo;
    private static String Nit;
    private static double PrecioTotal = 0;
    private static String NMueble;
    private Recibo Recibo = new Recibo();
    private Muebles Precio = new Muebles();
    public ControladorRecibo() {
    }

    public static String getCodeRecibo() {
        return CodeRecibo;
    }

    public static void setCodeRecibo(String CodeRecibo) {
        ControladorRecibo.CodeRecibo = CodeRecibo;
    }

    public static String getNit() {
        return Nit;
    }

    public static void setNit(String Nit) {
        ControladorRecibo.Nit = Nit;
    }

    public static double getPrecioTotal() {
        return PrecioTotal;
    }

    public static void setPrecioTotal(double PrecioTotal) {
        ControladorRecibo.PrecioTotal = PrecioTotal;
    }
    
    public boolean Existencia(String Code) throws SQLException{
        if(Recibo.ExisteCodigo(Code)){
            return true;
        }
        return false;
    }
    public String CrearRecibo(String NM, String Nit, int Repes, String Usuario) throws SQLException{
        double Costo = Precio.RetornarPrecio(NM);
        if(Costo!=-1.00){
            Date date = new Date(Calendar.getInstance().getTime().getTime());
            for (int i = 0; i < Repes; i++) {
            if(Recibo.CrearVenta(ControladorRecibo.getCodeRecibo(),NM,Costo,date, Nit, Usuario)){  
                Precio.VenderExistencias(NM);
                PrecioTotal+=Costo;
            }else{
            return "Ocurrio un fallo con la compra";
            }
        }
            return "Se registro la compra con exito";
     
        }else{
            return "Ocurrio un fallo con la compra";
        }
    }
    public ArrayList<String> CodigosPorNit(Conexion Con) throws SQLException{
        ResultSet Rs = Con.IniciarConexion().executeQuery("select * from facturas WHERE NitComprador= "+  Nit +";");
        ArrayList<String> Datos = new ArrayList<>();
        Rs.next();
        Datos.add(Rs.getString("CodigoFactura"));
        while(Rs.next()){
            for (int i = 0; i < Datos.size() ; i++) {
                if(!(Datos.get(i).equals(Rs.getString("CodigoFactura")))){
                    Datos.add(Rs.getString("CodigoFactura")); 
                }
            }
        }
        Con.CerrarConexiones();
        return Datos;
    }
    public String BuscarVendedorMax() throws SQLException{
        String sql = "select Autor,  count(Autor) c from facturas\n" +
        "group by Autor having c >1;";
        return Recibo.BuscarMax(sql);
    }
    
    public static String getNMueble() {
        return NMueble;
    }

    public static void setNMueble(String NMueble) {
        ControladorRecibo.NMueble = NMueble;
    
    }
    
}
