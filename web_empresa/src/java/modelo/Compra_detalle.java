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
public class Compra_detalle {
    private int id_compras_detalle, id_compra, id_producto, cantidad;
    private Float costo_precio_unitario;
    private Conexion cn;
    public Compra_detalle(){}
    public Compra_detalle(int id_compras_detalle, int id_compra, int id_producto, int cantidad, Float costo_precio_unitario) {
        this.id_compras_detalle = id_compras_detalle;
        this.id_compra = id_compra;
        this.id_producto = id_producto;
        this.cantidad = cantidad;
        this.costo_precio_unitario = costo_precio_unitario;
    }

    public int getId_compras_detalle() {
        return id_compras_detalle;
    }

    public void setId_compras_detalle(int id_compras_detalle) {
        this.id_compras_detalle = id_compras_detalle;
    }

    public int getId_compra() {
        return id_compra;
    }

    public void setId_compra(int id_compra) {
        this.id_compra = id_compra;
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

    public Float getCosto_precio_unitario() {
        return costo_precio_unitario;
    }

    public void setCosto_precio_unitario(Float costo_precio_unitario) {
        this.costo_precio_unitario = costo_precio_unitario;
    }
    
    public int datos_compra_detalle(){
        int retorno=0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO compras_detalle(id_compra,id_producto,cantidad,costo_precio_unitario) VALUES (?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId_compra());
            parametro.setInt(2, getId_producto());
            parametro.setInt(3, getCantidad());
            parametro.setFloat(4, getCosto_precio_unitario());                       
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            retorno=0;
        }
        return retorno;
    }
    
    public int modificar_compra_detalle(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE compras_detalle SET id_compra = ?, id_producto = ?, cantidad = ?, costo_precio_unitario = ? WHERE id_compras_detalle = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId_compra());
            parametro.setInt(2, getId_producto());
            parametro.setInt(3, getCantidad());
            parametro.setFloat(4, getCosto_precio_unitario());
            parametro.setInt(5, getId_compras_detalle());
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno=0;
        }
        return retorno;
    }
    
    public int eliminar_compras_detalle(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "DELETE FROM compras_detalle WHERE id_compras_detalle = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);            
            parametro.setInt(1, getId_compras_detalle());
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno=0;
        }
        return retorno;
    }
}
