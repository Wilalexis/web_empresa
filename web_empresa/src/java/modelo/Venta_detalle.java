/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Wilmer
 */
public class Venta_detalle extends Venta {
    private int id_venta_detalle, id_producto, cantidad, precio_unitario;

    /*public Venta_detalle(int id_venta_detalle, int id_producto, int cantidad, int precio_unitario) {
        this.id_venta_detalle = id_venta_detalle;
        this.id_producto = id_producto;
        this.cantidad = cantidad;
        this.precio_unitario = precio_unitario;
    }*/
    public Venta_detalle(){}
    public Venta_detalle(int id_venta_detalle, int id_producto, int cantidad, int precio_unitario, int id_venta, int no_factura, int id_cliente, int id_empleado, String serie, String fecha_fatura, String fecha_ingreso) {
        super(id_venta, no_factura, id_cliente, id_empleado, serie, fecha_fatura, fecha_ingreso);
        this.id_venta_detalle = id_venta_detalle;
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

    public int getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(int precio_unitario) {
        this.precio_unitario = precio_unitario;
    }
        
}
