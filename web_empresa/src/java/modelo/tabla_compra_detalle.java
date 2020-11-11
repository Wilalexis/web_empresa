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
public class tabla_compra_detalle {
    private int id_compra;
    private Conexion cn;
    public tabla_compra_detalle(){}
    public tabla_compra_detalle(int id_compra) {
        this.id_compra = id_compra;
    }

    public int getId_compra() {
        return id_compra;
    }

    public void setId_compra(int id_compra) {
        this.id_compra = id_compra;
    }
    
    public DefaultTableModel leer_detalleC(int IdCompra){
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT cd.id_compras_detalle, cd.id_compra, p.producto, p.id_producto, cd.cantidad, cd.costo_precio_unitario FROM compras_detalle as cd inner join productos as p on cd.id_producto = p.id_producto where cd.id_compra="+IdCompra;
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[]={"id_compras_detalle","id_compra","producto","id_producto","cantidad","costo_precio_unitario"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[6];
            while(consulta.next()){
                datos[0] = consulta.getString("id_compras_detalle");
                datos[1] = consulta.getString("id_compra");
                datos[2] = consulta.getString("producto");
                datos[3] = consulta.getString("id_producto");
                datos[4] = consulta.getString("cantidad");
                datos[5] = consulta.getString("costo_precio_unitario");                
                tabla.addRow(datos);
            }
            cn.cerrar_conexion();
        }catch(Exception ex ){
            System.out.println(ex.getMessage());
        }
        return tabla;
    }
}
