<%-- 
    Document   : tabla_compras
    Created on : 9/11/2020, 01:19:49
    Author     : Wilmer
--%>

<%@page import="modelo.Compra"%>
<%@page import="modelo.Proveedor"%>
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
            
             <!-- Inicio de formulario: Modificar compra -->
        <div class="modal fade" id="modal_MECD">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_compras?accion=DatosComprador" method="post" class="form-group" >
                        
                            <div class="modal-header" >
                                <h4 class="modal-title text-danger" ><b>Modificar/Eliminar compra</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <div class="modal-body">
                                <%--<label><b>ID de Compra</b></label>--%>                                
                                <input type="hidden" name="txt_id" id="txt_id" class="form-control" value="0">
                                <label><b>No. de orden: </b></label>
                                <input type="number" name="txt_no_orden" id="txt_no_orden" class="form-control" required>                                
                                
                                <label><b>Proveedor: </b></label>
                                <select name="drop_proveedor" id="drop_proveedor" class="form-control" >
                                <% 
                                    Proveedor proveedor = new Proveedor();
                                    HashMap<String,String> dropP = proveedor.drop_proveedor();
                                    out.println("<option>--Elija un proveedor--</option>");                                    
                                    for(String i: dropP.keySet()){
                                        out.println("<option value='" + i + "' >" + dropP.get(i) +"</option>");
                                    }
                                %>
                                </select>                                                                                                                                
                                <label><b>Fecha: </b></label>
                                <input type="text" name="txt_fecha" id="txt_fecha" class="form-control" required>                                
                                <label><b>Fecha de ingreso: </b></label>
                                <input type="text" name="txt_f_ingreso" id="txt_f_ingreso" class="form-control" >
                            </div>
                    
                            <br>
                            <div class="modal-footer">
                                <button name="btn_modificar_compra" id="btn_modificar_compra" value="modificar_compra" class="btn btn-dark btn-lg">Modificar</button>
                                <button name="btn_eliminar_compra" id="btn_eliminar_compra" value="eliminar_compra" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
                            </div>
                        </form>    
                    </div>
                </div>
            </div>
        
        <!-- Fin de formulario: Modificar compra -->
            
            <br><h3 style="text-align: center; color: #641E16;">Lista de Compras</h3><br>
            <a href="proveedores.jsp" class="btn btn-danger" >Tabla proveedores</a>
            <br><br>
            
             <table class="table table-hover " style="text-align: center; ">
                <thead style="background: #641E16; color: #fff;">
                    <tr>
                        <th>No. de orden</th>
                        <th>Proveedor</th>
                        <th>Fecha de orden</th>
                        <th>Fecha de ingreso</th>                        
                        <th>Detalles</th>
                    </tr>
                </thead>
                <tbody id="tbl_compras" class="table-bordered">  
                
                    <% 
                        
                        Compra compra = new Compra();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = compra.leer_compras();
                        for (int t=0;t<tabla.getRowCount();t++){  
                            out.println("<form action='sr_compra_detalle' method='post'>");
                            out.println("<input type='hidden' name='txt_idCompra' id='txt_idCompra' value="+ tabla.getValueAt(t,0) +">");
                            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_p=" + tabla.getValueAt(t,3) + ">");                                
                            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");                            
                            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");                            
                            out.println("<td>" + tabla.getValueAt(t,5) + "</td>");
                            out.println("<td><button style='color: #24D3DB;' class='btn btn-link' name='btn_venta_detalle' id='btn_venta_detalle' value='venta_detalle'><i class='fas fa-info'></i></button></td>");
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
