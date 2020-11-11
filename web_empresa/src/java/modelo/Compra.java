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
public class Compra {
    private int id_compra, no_orden_compra, id_proveedor;
    private String fecha_orden, fecha_ingreso;
    private Conexion cn;
    public Compra(){}
    public Compra(int id_compra, int no_orden_compra, int id_proveedor, String fecha_orden, String fecha_ingreso) {
        this.id_compra = id_compra;
        this.no_orden_compra = no_orden_compra;
        this.id_proveedor = id_proveedor;
        this.fecha_orden = fecha_orden;
        this.fecha_ingreso = fecha_ingreso;
    }

    public int getId_compra() {
        return id_compra;
    }

    public void setId_compra(int id_compra) {
        this.id_compra = id_compra;
    }

    public int getNo_orden_compra() {
        return no_orden_compra;
    }

    public void setNo_orden_compra(int no_orden_compra) {
        this.no_orden_compra = no_orden_compra;
    }

    public int getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public String getFecha_orden() {
        return fecha_orden;
    }

    public void setFecha_orden(String fecha_orden) {
        this.fecha_orden = fecha_orden;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }
    
    public DefaultTableModel leer_compras(){
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT c.id_compra, c.no_orden_compra, p.proveedor, p.id_proveedor, c.fecha_orden, c.fecha_ingreso FROM compras as c inner join proveedores as p on c.id_proveedor = p.id_proveedor;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[]={"id_compra","no_orden_compra","proveedor","id_proveedor","fecha_orden","fecha_ingreso"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[6];
             while(consulta.next()){
                datos[0] = consulta.getString("id_compra");
                datos[1] = consulta.getString("no_orden_compra");
                datos[2] = consulta.getString("proveedor");
                datos[3] = consulta.getString("id_proveedor");
                datos[4] = consulta.getString("fecha_orden");
                datos[5] = consulta.getString("fecha_ingreso");                             
                tabla.addRow(datos);
            }
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return tabla;
    }
    
    public int datos_comprador(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query="INSERT INTO compras(no_orden_compra,id_proveedor,fecha_orden,fecha_ingreso) VALUES (?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getNo_orden_compra());
            parametro.setInt(2, getId_proveedor());
            parametro.setString(3, getFecha_orden());                        
            parametro.setString(4, getFecha_ingreso());            
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno=0;
        }
        return retorno;
    }
    
    public int modificar_compra(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "UPDATE compras SET no_orden_compra = ?, id_proveedor = ?, fecha_orden = ?, fecha_ingreso = ? WHERE id_compra = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getNo_orden_compra());
            parametro.setInt(2, getId_proveedor());
            parametro.setString(3, getFecha_orden());                        
            parametro.setString(4, getFecha_ingreso());
            parametro.setInt(5, getId_compra());
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno=0;            
        }
        return retorno;
    }
    
    public int eliminar_compra(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "DELETE FROM compras WHERE id_compra = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);            
            parametro.setInt(1, getId_compra());
            retorno=parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            retorno=0;
        }
        return retorno;
    }
}
