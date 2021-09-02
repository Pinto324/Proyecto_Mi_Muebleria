
package Usuarios;

import BaseDeDatos.Usuarios;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author branp
 */
public class ValidadorDeLogin {
    private String Nick;
    private String Contraseña;
    private Usuarios User = new Usuarios();
    public ValidadorDeLogin(String Nick, String Contraseña) {
        this.Nick = Nick;
        this.Contraseña = Contraseña;
    }

    public String getNick() {
        return Nick;
    }

    public void setNick(String Nick) {
        this.Nick = Nick;
    }

    public String getContraseña() {
        return Contraseña;
    }

    public void setContraseña(String Contraseña) {
        this.Contraseña = Contraseña;
    }
    //Metodos:
    public int[] ComprobarUsuario() throws SQLException{
        int[] Credenciales = new int[2];
        try{
            String[] Datos = User.ComprobarUsuario(Nick);
            if(Datos!=null&&!(Datos[3].equals(""))){  
                if(Integer.parseInt(Datos[2]) == 1){
                    Credenciales[0] = 1;
                }else if(Integer.parseInt(Datos[2]) == 0){
                    JOptionPane.showMessageDialog(null, "retorno 0");
                    Credenciales[0] = 0;
                }else{
                    JOptionPane.showMessageDialog(null, "-1");
                    Credenciales[0] = -1;
                }
                if(Datos[0].equals(Nick)&&Datos[1].equals(Contraseña)){
                    JOptionPane.showMessageDialog(null, "Encontro usuario y contraseña");
                    Credenciales[1] = Integer.parseInt(Datos[3]);
                }else{
                    JOptionPane.showMessageDialog(null, "No encontró usuario o contraseña regresa -1");
                    Credenciales[1] = -1;
                }
            }
        }catch(NullPointerException e){
            Credenciales[0] = -1; Credenciales[1] = -1;
        }
        return Credenciales;
    }
    public String[] Prueba() throws SQLException{
        String[] Cadena = User.Prueba();
        return Cadena;
    }
}
