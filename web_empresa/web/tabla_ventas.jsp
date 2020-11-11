<%-- 
    Document   : tabla_ventas
    Created on : 7/11/2020, 23:11:23
    Author     : Wilmer
--%>
<%@page import="modelo.Venta"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Empleado" %>
<%@page import="modelo.Producto" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabla ventas</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/6ffafabebc.js" crossorigin="anonymous"></script>
    </head>
    <body>
        
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="menu.jsp"><img src="imagenes/socios.png"></a>

        <ul class="navbar-nav">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Productos
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="productos.jsp">Tabla Productos</a>
                    <a class="dropdown-item" href="marcas.jsp">Tabla Marcas</a>
                </div>    
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Ventas
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="datos_ventas.jsp">Realizar Ventas</a>
                    <a class="dropdown-item" href="tabla_ventas.jsp">Registro de ventas</a>
                    <a class="dropdown-item" href="clientes.jsp">Tabla Clientes</a>     

                    <a class="nav-link dropdown-toggle text-body" href="#" id="navbardrop" data-toggle="dropdown">
                        Empleados
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="empleados.jsp">Tabla Empleados</a>
                        <a class="dropdown-item" href="puestos.jsp">Tabla Puestos</a>       
                    </div>        
                </div>    
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Compras
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="datos_compra.jsp">Realizar Compras</a>
                    <a class="dropdown-item" href="tabla_compras.jsp">Registro de compras</a>
                    <a class="dropdown-item" href="proveedores.jsp">Tabla Proveedores</a>
                </div>    
            </li>
        </ul>        
    </nav>
        
        <br><br>
        <div class="container">
            
            <br><h3 style="text-align: center; color: #064C4F;" >Lista de Ventas</h3><br>
            <a href="clientes.jsp" class="btn btn-warning">Tabla Clientes</a>
            <a href="empleados.jsp" class="btn btn-primary">Tabla Empleados</a>
            <br><br>
                          
        <!-- Inicio de formulario: Modificar tabla ventas -->
        <div class="modal fade" id="modal_ME">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_ventas?accion=DatosCompradorMantenimiento" method="post" class="form-group" >
                        
                            <div class="modal-header" >
                                <h4 class="modal-title text-danger" ><b>Modificar/Eliminar venta</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <div class="modal-body">
                                <%--<label><b>ID de Venta</b></label>--%>                                
                                <input type="hidden" name="txt_id" id="txt_id" class="form-control" value="0">
                                <label><b>No. de factura: </b></label>
                                <input type="number" name="txt_no_factura" id="txt_no_factura" class="form-control" required>
                                <label><b>Serie: </b></label>
                                <input type="text" name="txt_serie" id="txt_serie" class="form-control" required>                                                              
                                <label><b>Fecha: </b></label>
                                <input type="text" name="txt_fecha" id="txt_fecha" class="form-control" required>
                                <label><b>Cliente: </b></label>
                                <select name="drop_cliente" id="drop_cliente" class="form-control" >
                                <% 
                                    Cliente cliente = new Cliente();
                                    HashMap<String,String> dropC = cliente.drop_cliente();
                                    //out.println("<option>--Elija un cliente--</option>");                                    
                                    for(String i: dropC.keySet()){
                                        out.println("<option value='" + i + "' >" + dropC.get(i) +"</option>");
                                    }
                                %>
                                </select>                                                                                                                              
                                <label><b>Empleado: </b></label>
                                <select name="drop_empleado" id="drop_empleado" class="form-control" >
                                <% 
                                    Empleado empleado = new Empleado();
                                    HashMap<String,String> dropE = empleado.drop_empleado();
                                    //out.println("<option>--Elija un empleado--</option>");
                                    for(String i: dropE.keySet()){
                                        out.println("<option value='" + i + "' >" + dropE.get(i) +"</option>");
                                    }
                                %>
                                </select>                                                                               
                                <label><b>Fecha de ingreso: </b></label>
                                <input type="text" name="txt_ingreso" id="txt_ingreso" class="form-control" >
                            </div>
                    
                            <br>
                            <div class="modal-footer">
                                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-dark btn-lg">Modificar</button>
                                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
                            </div>
                        </form>    
                    </div>
                </div>
            </div>
        
        <!-- Fin de formulario: Modificar tabla ventas -->
            
            <table class="table table-hover " style="text-align: center; ">
                <thead style="background: #064C4F; color: #fff;">
                    <tr>
                        <th>No. factura</th>
                        <th>Serie</th>
                        <th>Fecha</th>
                        <th>Cliente</th>
                        <th>Empleado</th>
                        <th>Fecha de ingreso</th>     
                        <th>Detalles</th>
                    </tr>
                </thead>
                <tbody id="tbl_ventas" class="table-bordered">  
                
                    <% 
                        
                        Venta venta = new Venta();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = venta.leer_ventas();
                        for (int t=0;t<tabla.getRowCount();t++){  
                            out.println("<form action='sr_venta_detalle' method='post'>");
                            out.println("<input type='hidden' name='txt_id' id='txt_id' value="+ tabla.getValueAt(t,0) +">");
                            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_c=" + tabla.getValueAt(t,5) + " data-id_e=" + tabla.getValueAt(t,7)+ ">");                                
                            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,8) + "</td>");                            
                            out.println("<td><button class='btn btn-link' name='btn_venta_detalle' id='btn_venta_detalle' value='venta_detalle'><i class='fas fa-eye'></i></button></td>");                            
                            out.println("</tr>");
                            out.println("</form>");
                        }
                    %>               
                </tbody>
            </table>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>    
        <script src="js/controlador.js" type="text/javascript"></script>
    </body>
</html>
