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
public class Verificacion {
    String correo,verificacionCorreo;
    int codigo,verificacionCodigo;
    //int Conexion cn;
    
    public Verificacion(){}
    
      public Verificacion(String correo, String verificacionCorreo, int codigo, int verificacionCodigo) {
        this.correo = correo;
        this.verificacionCorreo = verificacionCorreo;
        this.codigo = codigo;
        this.verificacionCodigo = verificacionCodigo;
    }
      

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getVerificacionCorreo() {
        return verificacionCorreo;
    }

    public void setVerificacionCorreo(String verificacionCorreo) {
        this.verificacionCorreo = verificacionCorreo;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getVerificacionCodigo() {
        return verificacionCodigo;
    }

    public void setVerificacionCodigo(int verificacionCodigo) {
        this.verificacionCodigo = verificacionCodigo;
    }
    
     
    //crea una variable que asigne un valor del 4000 a 40000
    
    
    //Almacena el numero en la base de datos---(usa el agregar)
    
    //luego comproba que el correo y la varible del numero consida con la base de datos
    
}
