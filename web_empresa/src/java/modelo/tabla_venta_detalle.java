/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.ResultSet;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Wilmer
 */
public class tabla_venta_detalle {
    private int id_venta;
    private Conexion cn;
    public tabla_venta_detalle(){}
    public tabla_venta_detalle(int id_venta) {
        this.id_venta = id_venta;
    }
        
    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }
    
    public DefaultTableModel leer_detalleV(int IdVenta){
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
    }
}
