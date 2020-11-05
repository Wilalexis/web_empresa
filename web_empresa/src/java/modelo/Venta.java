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
abstract class Venta {
    private int id_venta, no_factura, id_cliente, id_empleado;
    private String serie, fecha_fatura, fecha_ingreso;
    public Venta(){}
    public Venta(int id_venta, int no_factura, int id_cliente, int id_empleado, String serie, String fecha_fatura, String fecha_ingreso) {
        this.id_venta = id_venta;
        this.no_factura = no_factura;
        this.id_cliente = id_cliente;
        this.id_empleado = id_empleado;
        this.serie = serie;
        this.fecha_fatura = fecha_fatura;
        this.fecha_ingreso = fecha_ingreso;
    }
    
    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getNo_factura() {
        return no_factura;
    }

    public void setNo_factura(int no_factura) {
        this.no_factura = no_factura;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getFecha_fatura() {
        return fecha_fatura;
    }

    public void setFecha_fatura(String fecha_fatura) {
        this.fecha_fatura = fecha_fatura;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }
    
    public int agregar(){ return 0;}
    public int modificar (){return 0;}
    public int eliminar (){return 0;}
}
