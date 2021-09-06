/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilidades;

/**
 *
 * @author branp
 */
public class Excepciones extends Exception {
    public static final long SERIAL = 500L;

    public Excepciones(String msj){
        super(msj);
    }
}
