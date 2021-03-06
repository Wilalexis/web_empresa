/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Wilmer
 */
public class Venta_detalle{
    private int id_venta_detalle, id_venta, id_producto, cantidad;
    private Float precio_unitario;
    private Conexion cn;
    public Venta_detalle(){}
    public Venta_detalle(int id_venta_detalle, int id_venta, int id_producto, int cantidad, Float precio_unitario) {
        this.id_venta_detalle = id_venta_detalle;
        this.id_venta = id_venta;
        this.id_producto = id_producto;
        this.cantidad = cantidad;
        this.precio_unitario = precio_unitario;
    }

    public int getId_venta_detalle() {
        return id_venta_detalle;
    }

    public void setId_venta_detalle(int id_venta_detalle) {
        this.id_venta_detalle = id_venta_detalle;
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Float getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(Float precio_unitario) {
        this.precio_unitario = precio_unitario;
    }
    
    public int datos_detalle(){
        int retorno=0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query= "INSERT INTO ventas_detalle(id_venta,id_producto,cantidad,precio_unitario) VALUES (?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId_venta());
            parametro.setInt(2, getId_producto());
            parametro.setInt(3, getCantidad());
            parametro.setFloat(4, getPrecio_unitario());                       
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno=0;
        }
        return retorno;
    }
    
    public int modificar_venta_detalle(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE ventas_detalle SET id_venta = ?, id_producto = ?,cantidad = ?, precio_unitario = ? WHERE id_venta_detalle = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId_venta());
            parametro.setInt(2, getId_producto());
            parametro.setInt(3, getCantidad());
            parametro.setFloat(4, getPrecio_unitario());
            parametro.setInt(5, getId_venta_detalle());
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno=0;
        }
        return retorno;
    }
    
    public int eliminar_venta_detalle(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "DELETE FROM ventas_detalle WHERE id_venta_detalle = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);           
            parametro.setInt(1, getId_venta_detalle());
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno=0;
        }
        return retorno;
    }
}
