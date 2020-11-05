/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author USUARIO
 */
public class Claves {
    String pass,verificacion;
    String lector,lectorVerificacion;
    //int Conexion cn;
    
    
    public Claves(){}

    public Claves(String pass, String verificacion, String lector, String lectorVerificacion) {
        this.pass = pass;
        this.verificacion = verificacion;
        this.lector = lector;
        this.lectorVerificacion = lectorVerificacion;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getVerificacion() {
        return verificacion;
    }

    public void setVerificacion(String verificacion) {
        this.verificacion = verificacion;
    }

    public String getLector() {
        return lector;
    }

    public void setLector(String lector) {
        this.lector = lector;
    }

    public String getLectorVerificacion() {
        return lectorVerificacion;
    }

    public void setLectorVerificacion(String lectorVerificacion) {
        this.lectorVerificacion = lectorVerificacion;
    }
    
    //Elimina las claves de la base de datos
    //Luego modificalas y agregalas a la base de datos
    
}