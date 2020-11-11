/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import javax.swing.table.DefaultTableModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Wilmer
 */
public class Venta {
    private int id_venta, no_factura, id_cliente, id_empleado;
    private String serie, fecha_factura, fecha_ingreso;
    private Conexion cn;
    public Venta(){}
    public Venta(int id_venta, int no_factura, int id_cliente, int id_empleado, String serie, String fecha_factura, String fecha_ingreso) {
        this.id_venta = id_venta;
        this.no_factura = no_factura;
        this.id_cliente = id_cliente;
        this.id_empleado = id_empleado;
        this.serie = serie;
        this.fecha_factura = fecha_factura;
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

    public String getFecha_factura() {
        return fecha_factura;
    }

    public void setFecha_factura(String fecha_factura) {
        this.fecha_factura = fecha_factura;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }
    
    public DefaultTableModel leer_ventas(){
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT v.id_venta, v.no_factura, v.serie, v.fecha_factura, concat_ws( ' ', c.nombres, c.apellidos) as cliente, c.id_cliente,  concat_ws( ' ', e.nombres, e.apellidos) as empleado, e.id_empleado, v.fecha_ingreso FROM ventas as v inner join clientes as c on v.id_cliente = c.id_cliente inner join empleados as e on v.id_empleado=e.id_empleado;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[]={"id_venta","no_factura","serie","fecha_factura","cliente","id_cliente","empleado","id_empleado","fecha_ingreso"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[9];
             while(consulta.next()){
                datos[0] = consulta.getString("id_venta");
                datos[1] = consulta.getString("no_factura");
                datos[2] = consulta.getString("serie");
                datos[3] = consulta.getString("fecha_factura");
                datos[4] = consulta.getString("cliente");
                datos[5] = consulta.getString("id_cliente");
                datos[6] = consulta.getString("empleado");
                datos[7] = consulta.getString("id_empleado");
                datos[8] = consulta.getString("fecha_ingreso");               
                tabla.addRow(datos);
            }
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return tabla;
    }
    
    public int datos_comprador(){ 
        int retorno=0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO ventas(no_factura,serie,fecha_factura,id_cliente,id_empleado,fecha_ingreso) VALUES (?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getNo_factura());
            parametro.setString(2, getSerie());
            parametro.setString(3, getFecha_factura());
            parametro.setInt(4, getId_cliente());
            parametro.setInt(5, getId_empleado());
            parametro.setString(6, getFecha_ingreso());            
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){        
            System.out.println(ex.getMessage());
            retorno=0;
        }
        return retorno;
    }
    
    public int modificar_venta(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE ventas SET no_factura=?,serie=?,fecha_factura=?,id_cliente=?,id_empleado = ?,fecha_ingreso=? WHERE id_venta = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getNo_factura());
            parametro.setString(2, getSerie());
            parametro.setString(3, getFecha_factura());
            parametro.setInt(4, getId_cliente());
            parametro.setInt(5, getId_empleado());
            parametro.setString(6, getFecha_ingreso());
            parametro.setInt(7, getId_venta());
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            retorno=0;
        }
        return retorno;
    }
    
    public int eliminar_venta(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "DELETE FROM ventas WHERE id_venta = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);            
            parametro.setInt(1, getId_venta());
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            retorno=0;
        }
        return retorno;
    }
    
    /*public DefaultTableModel leer_detalleV(int IdVenta){
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            cn = new Conexion();
            cn.abrir_conexion();
            //String query = "SELECT vd.id_venta_detalle, vd.id_venta, p.producto, p.id_producto, vd.cantidad, vd.precio_unitario FROM ventas_detalle as vd inner join productos as p on vd.id_producto = p.id_producto where vd.id_venta=4;";
            String query = "SELECT vd.id_venta_detalle, vd.id_venta, p.producto, p.id_producto, vd.cantidad, vd.precio_unitario FROM ventas_detalle as vd inner join productos as p on vd.id_producto = p.id_producto where vd.id_venta="+IdVenta;
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[]={"id_venta_detalle","id_venta","producto","id_producto","cantidad","precio_unitario"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[6];
            while(consulta.next()){
                datos[0] = consulta.getString("id_venta_detalle");
                datos[1] = consulta.getString("id_venta");
                datos[2] = consulta.getString("producto");
                datos[3] = consulta.getString("id_producto");
                datos[4] = consulta.getString("cantidad");
                datos[5] = consulta.getString("precio_unitario");                
                tabla.addRow(datos);
            }
            cn.cerrar_conexion();
        }catch(Exception ex){            
            System.out.println(ex.getMessage());
        }
        return tabla;
    }*/
    
    public int modificar (){return 0;}
    
    public int eliminar (){return 0;}  
    
}
