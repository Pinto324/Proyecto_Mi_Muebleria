
package Controles;

import BaseDeDatos.Muebles;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class ControladorMuebles {
    private Muebles CM = new Muebles();
    private ControladorPieza ControlPieza = new ControladorPieza();
    private static int PiezasTotal;
    private static String MuebleActual;
    private static final SimpleDateFormat FormatoFecha = new SimpleDateFormat("yyyy-MM-dd");
    public ControladorMuebles() {
    }
    
    public String CrearPieza(String[] Datos) throws SQLException{
        if(CM.ComprobarMueble(Datos[0])){
            try{
            String[] Carac = new String[2];
            int[] Enteros = new int[2];
            Carac[0] = Datos[0];
            Carac[1] = Datos[1];
            Date Fecha = (Date) FormatoFecha.parse(Datos[2]);
            double Precio = Double.parseDouble(Datos[3]);
            Enteros[0] = Integer.valueOf(Datos[4]);
            Enteros[1] = Integer.valueOf(Datos[5]);
            if(CM.CrearMueble(Carac, Enteros, Precio, Fecha)){
                return "Se creo el mueble con exito";
            }else{
                return "Ocurrio un error de conexion, intente más tarde";
            }
            }catch(NumberFormatException|ParseException ex){
                return "Campos con caracteres invalidos, porfavor revise";
            }
        }else{
            return "Ya existe un mueble con ese nombre, seleccione otro porfavor";
        }
    }
    public void CrearEnsamble(String[] Datos, int Cant) throws SQLException{
        if(CM.ComprobarEnsamble(Datos)&&!(CM.ComprobarMueble(Datos[0]))){
            if(CM.CrearEnsamble(Datos, Cant)){
                
            }else{
                
            }
        }else{
        }
    }
    public String CrearExistencia(ResultSet Datos,String Nombre, int cantarmar){
        ArrayList<Integer> Id = new ArrayList<>();
        ArrayList<Integer> cant = new ArrayList<>();
        boolean Fallo = false;
        try {
            while(Datos.next()){
                Id.add(Datos.getInt("IdPieza"));
                cant.add(Datos.getInt("CantidadPieza"));     
            }
            for (int i = 0; i < Id.size(); i++) {
                if(ControlPieza.HayExistencias(Id.get(i), cant.get(i),cantarmar)){
                }else{
                    Fallo=true;
                }
            }
            if(Fallo){
                return "Faltan existencias de piezas para ensamblar el/los muebles";
            }else{
                if(ControlPieza.QuitarPiezas(Id, cant)){
                    CM.EnsamblarMueble(Nombre);
                    return "se han ensamblado el/los muebles con exito";
                }                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ControladorMuebles.class.getName()).log(Level.SEVERE, null, ex);
        }      
        return "Ocurrio un fallo de conexion, pruebe más tarde";
    }
      public boolean ListaDeMueblesEnsamblados(ResultSet Datos, String Mueble){
        try {
            while(Datos.next()){
                if(Datos.getString("NombreDeMueble").equals(Mueble)){
                    return true;
                }
            }
        } catch (SQLException ex) {
        }      
        return false;
    }

    public static int getPiezasTotal() {
        return PiezasTotal;
    }

    public static void setPiezasTotal(int PiezasTotal) {
        ControladorMuebles.PiezasTotal = PiezasTotal;
    }

    public static String getMuebleActual() {
        return MuebleActual;
    }

    public static void setMuebleActual(String MuebleActual) {
        ControladorMuebles.MuebleActual = MuebleActual;
    }
    
    
}
