/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controles;

import BaseDeDatos.Piezas;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author branp
 */
public class ControladorPieza {
    private Piezas PiezasBD;
    private ModeloPieza modelo;

    public ControladorPieza() {
        PiezasBD = new Piezas();
        modelo = new ModeloPieza();    
    }
    public String CrearPieza(String Nombre,double Costo ,int existencias) throws SQLException{
        if(PiezasBD.ComprobarPieza(Nombre, Costo)){
            modelo.setNombre(Nombre);
            modelo.setPrecio(Costo);
            modelo.setExistencias(existencias);
            PiezasBD.CrearPieza(modelo);
            return "Se creo la pieza con exito";
        }else{
            return "Ya existe una pieza con las mismas carracteristicas";
        }
    }
    public String EliminarPieza(int Id){
        if(PiezasBD.EliminarPorID(Id)){
            return "se eliminó la pieza con exito";
        }else{
            return "a ocurrido un error, se perdió la conexion";
        }
    }
    public String[] BuscarPorId(int Id){
        try{   
            int Comprobador = Id;
            String[]Datos=PiezasBD.BuscarPorID(Comprobador);
            return Datos;
        }catch(NumberFormatException e){
            return null;
        }
    }
    public boolean VerificarModificacion(String Nombre, String precio, String existencias){
        try{
            double P = Double.parseDouble(precio);
            int Ex = Integer.valueOf(existencias);
            if(!(Nombre.equals("")) && P > 0.00 && Ex >= 0){
                return true;
            }else{
                return false;
            }
        }catch(NullPointerException | NumberFormatException e){
            return false;
        }
    }
    public boolean ModificarValor(String Id,String Nombre, String Precio, String Ex){ 
        int Ids =  Integer.valueOf(Id);           
        double P = Double.parseDouble(Precio);
        int Exis = Integer.valueOf(Ex);
        if(PiezasBD.ModificarDatos(Ids, Nombre, P, Exis)){
            return true;
        }else{
            return false;
        }
    }
    public boolean HayExistencias(int id, int CantN, int CantA){
       int Existencias = PiezasBD.ExistenciasBuscarPorID(id);
       if(Existencias!=-1){
           if(Existencias>=(CantN*CantA)){
            return true;
           }
       }
       return false;
    }
    public boolean QuitarPiezas(ArrayList<Integer> Id,ArrayList<Integer> cant){
        for (int i = 0; i < Id.size(); i++) {
            if(PiezasBD.DescontarExistencias(Id.get(i), cant.get(i))){
            }else{
            return false;
            }
        }
        return true;
    }
}
