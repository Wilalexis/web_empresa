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
import modelo.Compra;
import modelo.Compra_detalle;
/**
 *
 * @author Wilmer
 */
public class sr_compras extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Compra compra;
    Compra_detalle compra_detalle;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion=request.getParameter("accion");
        
        switch(accion){
            case "DatosComprador":
                compra = new Compra(Integer.valueOf(request.getParameter("txt_id")),Integer.valueOf(request.getParameter("txt_no_orden")),Integer.valueOf(request.getParameter("drop_proveedor")),request.getParameter("txt_fecha"),request.getParameter("txt_f_ingreso"));
                //boton agregar
                if("datos_vendedor".equals(request.getParameter("btn_datos_vendedor"))){
                    if(compra.datos_comprador() > 0){ 
                        response.sendRedirect("compras.jsp");
                    }else{
                        //out.println("<h1>No se Agrego...........</h1>");
                        //out.println("<a href ='ventas.jsp'>Regresar</a>");
                    }
                }
                //boton modificar
                if("modificar_compra".equals(request.getParameter("btn_modificar_compra"))){
                    if(compra.modificar_compra() > 0){ 
                        response.sendRedirect("tabla_compras.jsp");
                    }else{
                        //out.println("<h1>No se modifico...........</h1>");
                        //out.println("<a href ='empleados.jsp'>Regresar</a>");
                    }
                }
                //boton eliminar
                if("eliminar_compra".equals(request.getParameter("btn_eliminar_compra"))){
                    if(compra.eliminar_compra() > 0){ 
                    response.sendRedirect("tabla_compras.jsp");
                    }else{
                        //out.println("<h1>No se eliminar...........</h1>");
                        //out.println("<a href ='empleados.jsp'>Regresar</a>");
                    }
                }
                break;
            case "DatosCompraDetalle":
                    compra_detalle = new Compra_detalle(Integer.valueOf(request.getParameter("txt_id_compra_detalle")),Integer.valueOf(request.getParameter("txt_id_compra")),Integer.valueOf(request.getParameter("td_id_producto")),Integer.valueOf(request.getParameter("txt_cantidad")),Float.parseFloat(request.getParameter("td_costo_precio_unitario")));
                     //boton agregar
                if("datos_compra_detalle".equals(request.getParameter("btn_datos_compra_detalle"))){
                    if(compra_detalle.datos_compra_detalle() > 0){ 
                        response.sendRedirect("compras.jsp");
                    }else{
                        //out.println("<h1>No se Agrego...........</h1>");
                        //out.println("<a href ='ventas.jsp'>Regresar</a>");
                    }                    
                }
                
                break;
            case "DatosCompraDetalleMantenimiento":
                compra_detalle = new Compra_detalle(Integer.valueOf(request.getParameter("txt_id_compra_detalle")),Integer.valueOf(request.getParameter("txt_IdCompra")),Integer.valueOf(request.getParameter("drop_productoC")),Integer.valueOf(request.getParameter("txt_CantidadCompra")),Float.parseFloat(request.getParameter("txt_costo_precio_unitario")));
                //boton modificar
                if("modificarCD".equals(request.getParameter("btn_modificarCD"))){
                    if(compra_detalle.modificar_compra_detalle() > 0){ 
                        response.sendRedirect("tabla_compras.jsp");
                    }else{
                        //out.println("<h1>No se modifico...........</h1>");
                        //out.println("<a href ='empleados.jsp'>Regresar</a>");
                    }
                }
                //boton eliminar
                if("eliminarCD".equals(request.getParameter("btn_eliminarCD"))){
                    if(compra_detalle.eliminar_compras_detalle() > 0){ 
                    response.sendRedirect("tabla_compras.jsp");
                    }else{
                        //out.println("<h1>No se eliminar...........</h1>");
                        //out.println("<a href ='empleados.jsp'>Regresar</a>");
                    }
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
