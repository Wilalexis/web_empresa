/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Venta;
import modelo.Venta_detalle;
import modelo.tabla_venta_detalle;
/**
 *
 * @author Wilmer
 */
public class sr_ventas extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Venta venta;
    Venta_detalle venta_detalle;
    //int IdVenta;
    tabla_venta_detalle ventaD;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion=request.getParameter("accion");
        
        switch(accion){
            case "DatosComprador":
                venta = new Venta(Integer.valueOf(request.getParameter("txt_id")),Integer.valueOf(request.getParameter("txt_no_factura")),Integer.valueOf(request.getParameter("drop_cliente")),Integer.valueOf(request.getParameter("drop_empleado")),request.getParameter("txt_serie"),request.getParameter("txt_fecha"),request.getParameter("txt_f_ingreso"));
                //boton agregar
                if("datos_comprador".equals(request.getParameter("btn_datos_comprador"))){
                    if(venta.datos_comprador() > 0){ 
                        response.sendRedirect("ventas.jsp");
                    }else{
                        //out.println("<h1>No se Agrego...........</h1>");
                        //out.println("<a href ='ventas.jsp'>Regresar</a>");
                    }
                }
                   
                break;
            case "DatosCompradorMantenimiento":
                venta = new Venta(Integer.valueOf(request.getParameter("txt_id")),Integer.valueOf(request.getParameter("txt_no_factura")),Integer.valueOf(request.getParameter("drop_cliente")),Integer.valueOf(request.getParameter("drop_empleado")),request.getParameter("txt_serie"),request.getParameter("txt_fecha"),request.getParameter("txt_ingreso"));
                //boton modificar
                if("modificar".equals(request.getParameter("btn_modificar"))){
                    if(venta.modificar_venta() > 0){ 
                        response.sendRedirect("tabla_ventas.jsp");
                    }else{
                        //out.println("<h1>No se modifico...........</h1>");
                        //out.println("<a href ='clientes.jsp'>Regresar</a>");
                    }
                }
                //boton eliminar
                if("eliminar".equals(request.getParameter("btn_eliminar"))){
                    if(venta.eliminar_venta() > 0){ 
                    response.sendRedirect("tabla_ventas.jsp");
                    }else{
                        //out.println("<h1>No se eliminar...........</h1>");
                        //out.println("<a href ='clientes.jsp'>Regresar</a>");
                    }
                }            
                break;
            case "DatosDetalle":                
                venta_detalle = new Venta_detalle(Integer.valueOf(request.getParameter("txt_id_venta_detalle")),Integer.valueOf(request.getParameter("txt_id_venta")),Integer.valueOf(request.getParameter("td_id_producto")),Integer.valueOf(request.getParameter("txt_cantidad")),Float.parseFloat(request.getParameter("td_precio_unitario")));
            //boton agregar
                if("datos_detalle".equals(request.getParameter("btn_datos_detalle"))){
                    if(venta_detalle.datos_detalle() > 0){ 
                        response.sendRedirect("ventas.jsp");
                    }else{
                        //out.println("<h1>No se Agrego...........</h1>");
                        //out.println("<a href ='ventas.jsp'>Regresar</a>");
                    }                    
                }                
                break;
            case "DatosDetalleMantenimiento":
                venta_detalle = new Venta_detalle(Integer.valueOf(request.getParameter("txt_id_detalle")),Integer.valueOf(request.getParameter("txt_IdVenta")),Integer.valueOf(request.getParameter("drop_productoV")),Integer.valueOf(request.getParameter("txt_CantidadVenta")),Float.parseFloat(request.getParameter("txt_precio_unitario")));
                //boton modificar
                if("modificarVD".equals(request.getParameter("btn_modificarVD"))){
                    if(venta_detalle.modificar_venta_detalle() > 0){
                        //response.sendRedirect("sr_venta_detalle.java");
                        response.sendRedirect("tabla_ventas.jsp");
                    }else{
                        //out.println("<h1>No se modifico...........</h1>");
                        //out.println("<a href ='clientes.jsp'>Regresar</a>");
                    }
                }
                //boton eliminar
                if("eliminarVD".equals(request.getParameter("btn_eliminarVD"))){
                    if(venta_detalle.eliminar_venta_detalle() > 0){
                        //response.sendRedirect("sr_venta_detalle.java");
                        response.sendRedirect("tabla_ventas.jsp");
                    }else{
                        //out.println("<h1>No se eliminar...........</h1>");
                        //out.println("<a href ='clientes.jsp'>Regresar</a>");
                    }
                }
                
                break;
            case "VentaDetalle":
                ventaD = new tabla_venta_detalle(Integer.valueOf(request.getParameter("txt_id")));
            //boton agregar
                if("venta_detalle".equals(request.getParameter("btn_venta_detalle"))){
                    ventaD.leer_detalleV(Integer.valueOf(request.getParameter("txt_id"))); 
                        response.sendRedirect("ventas_detalle.jsp");
                    
                        //out.println("<h1>No se Agrego...........</h1>");
                        //out.println("<a href ='ventas.jsp'>Regresar</a>");                    
                }    
                break;
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
