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
public class Recuperacion {

    private String correo,comprobacion;
    
    //La comprobacion va con la base de datos y el correo es la variable que pedis
    //private Conexion cn; Aqui va la conexion 
    
    
    public Recuperacion(){}

    public Recuperacion(String correo, String comprobacion) {
        this.correo = correo;
        this.comprobacion = comprobacion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getComprobacion() {
        return comprobacion;
    }

    public void setComprobacion(String comprobacion) {
        this.comprobacion = comprobacion;
    }
    
    
       
}
