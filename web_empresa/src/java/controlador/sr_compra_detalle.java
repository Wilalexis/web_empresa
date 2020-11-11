/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.table.DefaultTableModel;
import modelo.Producto;
import modelo.tabla_compra_detalle;
/**
 *
 * @author Wilmer
 */
public class sr_compra_detalle extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    tabla_compra_detalle compraD;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Venta Detalle</title>");
            out.println("");
            out.println("<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' integrity='sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z' crossorigin='anonymous'>");
            out.println("</head>");
            out.println("<body>");
            compraD = new tabla_compra_detalle(Integer.valueOf(request.getParameter("txt_idCompra")));
            out.println("<br><br>");
            out.println("<div class='container'>");
            
            out.println("<br><h3 style='text-align: center; color: #6394A8;'><b>Detalle de la compra</b></h3><br>"); 
            out.println("<div class='modal fade' id='modal_MECDTS'>");
            out.println("<div class='modal-dialog'>");
            out.println("<div class='modal-content'>");
            out.println("<form action='sr_compras?accion=DatosCompraDetalleMantenimiento' method='post' class='form-group' >");//Aqui esta el controlador, hay que cambiarlo
            out.println("<div class='modal-header'>");
            out.println("<h4 class='modal-title text-danger' ><b>Modificar/Eliminar compra detalle</b></h4>");
            out.println("<button type='button' class='close' data-dismiss='modal'>&times;</button>");
            out.println("</div>");
            out.println("<div class='modal-body'>");
            //out.println("<label><b>ID de Compra Detalle:</b></label>");
            out.println("<input type='hidden' name='txt_id_compra_detalle' id='txt_id_compra_detalle' class='form-control' value='0'>");
            //out.println("<label><b>ID Compra: </b></label>");
            out.println("<input type='hidden' name='txt_IdCompra' id='txt_IdCompra' class='form-control' required>");
            out.println("<label><b>Producto: </b></label>");
            out.println("<select name='drop_productoC' id='drop_productoC' class='form-control' >");
                        Producto producto = new Producto();
                        HashMap<String,String> dropP = producto.drop_producto();                                                          
                        for(String i: dropP.keySet()){
                            out.println("<option value='" + i + "' >" + dropP.get(i) +"</option>");
                        }
            out.println("</select>");
            out.println("<label><b>Cantidad: </b></label>");
            out.println("<input type='number' name='txt_CantidadCompra' id='txt_CantidadCompra' min='1' class='form-control' >");
            out.println("<label><b>Precio unitario: </b></label>");
            out.println("<input type='number' step='0.1' name='txt_costo_precio_unitario' id='txt_costo_precio_unitario' class='form-control' >");
            out.println("</div>");
            out.println("<br>");
            out.println("<div class='modal-footer'>");
            out.println("<button name='btn_modificarCD' id='btn_modificarCD' value='modificarCD' class='btn btn-dark btn-lg'>Modificar</button>");
            out.println("<button name='btn_eliminarCD' id='btn_eliminarCD' value='eliminarCD' class='btn btn-danger btn-lg' onclick='javascript:if(!confirm('¿Desea Eliminar?'))return false'>Eliminar</button>");
            out.println("</div>");
            out.println("</form>");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
            out.println("");
            out.println("");
            out.println("");
            
            out.println(" <table class='table table-hover' style='text-align: center;'>");
            out.println("<thead style='background: #6394A8; color: #fff ;'>");
            out.println("<tr>");
            out.println("<th>Producto</th>");
            out.println("<th>Cantidad</th>");
            out.println("<th>Precio unitario</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody id='tbl_compras_detalle' class='table-bordered'>  ");
            int IdCompra= Integer.valueOf(request.getParameter("txt_idCompra"));
                        tabla_compra_detalle compra = new tabla_compra_detalle();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = compra.leer_detalleC(IdCompra);
                        for (int t=0;t<tabla.getRowCount();t++){ 
                            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_v=" + tabla.getValueAt(t,1) + " data-id_p=" + tabla.getValueAt(t,3)+ ">");                                
                            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,5) + "</td>");                                                        
                            out.println("</tr>");                        
                        }
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");
            
            out.println("<script src='https://code.jquery.com/jquery-3.5.1.slim.min.js' integrity='sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj' crossorigin='anonymous'></script>");
            out.println("<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js' integrity='sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN' crossorigin='anonymous'></script>");
            out.println("<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js' integrity='sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV' crossorigin='anonymous'></script>    ");
            out.println("<script src='js/controlador.js' type='text/javascript'></script>");
            out.println("</body>");
            out.println("</html>");
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
