<%-- 
    Document   : ventas
    Created on : 4/11/2020, 01:25:45
    Author     : Wilmer
--%>
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
        <title>Ventas</title>
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

        <div class="container ">
            <br>
            <h2 style="text-align: center; color: #117864;"><b>Eliga lo que desea</b></h2>          
            <%--<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">            
              Finalizar compra
            </button>--%>
            <a href="mensaje.jsp" style="background: #117864; color: #fff;" class="btn">Finalizar venta</a>
            <br><br>
            
              

                               
               <table class="table  " style="text-align: center; ">
                <thead style="background: #117864; color: #fff;">                    
                    <tr>
                        
                        <th>Nombre del producto</th>
                        <th>Marca</th>                       
                        <th>Descripcion</th>                       
                        <th>Imagen</th>                       
                        
                        <th>Precio unitario</th>
                        <th>Cantidad</th>
                        <th></th>
                                         
                    </tr>
                </thead>
                <tbody id="tbl_productos" class="table">                    
                    <% 
                        Producto tbl_producto = new Producto();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = tbl_producto.leer();
                        for (int t=0;t<tabla.getRowCount();t++){
                            out.println("<form action='sr_ventas?accion=DatosDetalle' method='post'>");
                            out.println("<input type='hidden' name='txt_id_venta_detalle' id='txt_id_venta_detalle' value='0'>");
                            out.println("<input type='hidden' name='txt_id_venta' id='txt_id_venta' value='14'>");
                            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_m=" + tabla.getValueAt(t,3) + ">"); 
                            out.println("<input type='hidden' name='td_id_producto' value="+ tabla.getValueAt(t,0)+ ">"); 
                            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");                            
                            out.println("<td><img src='imagenes/" + tabla.getValueAt(t,5) + "' style='width: 32px; height: 32px;'></td>");
                            
                            out.println("<td><input style='width: 75px; border: none;' name='td_precio_unitario' value="+ tabla.getValueAt(t,7) +" readonly></td>");
                            out.println("<td><input style='width: 45px;' type='number' name='txt_cantidad' id='txt_cantidad'  min='1' value='1' required></td>");
                            out.println("<td><button  style='color: #C0392B' class='btn btn-link' name='btn_datos_detalle' id='btn_datos_detalle' value='datos_detalle'><i class='fas fa-plus'></i></button></td>");
                            out.println("</tr>");
                            out.println("</form>");
                        }
                    %>               
                </tbody>
            </table> 
                
                <br>
                
          </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>    
    <script>
            
    $(document).ready(function(){
        $('#myModal').modal('show');
    });
    
            $( document ).ready(function() {

                var now = new Date();
                var day = ("0" + now.getDate()).slice(-2);
                var month = ("0" + (now.getMonth() + 1)).slice(-2);
                var hours = now.getHours();
                var minutes = now.getMinutes();
                var seconds = now.getSeconds();
    
                if (hours < 10) hours = "0" + hours;
                if (minutes < 10) minutes = "0" + minutes;
                if (seconds < 10) seconds = "0" + seconds;
    
                var today = now.getFullYear()+"-"+(month)+"-"+(day)+" "+(hours)+":"+(minutes)+":"+(seconds) ;
                $("#txt_f_ingreso").val(today);
   
            });
            
            $( document ).ready(function() {

            var now = new Date();
            var day = ("0" + now.getDate()).slice(-2);
            var month = ("0" + (now.getMonth() + 1)).slice(-2);
                
    
            var today = now.getFullYear()+"-"+(month)+"-"+(day);
            $("#txt_fecha").val(today);
   
            });
    </script>

    </body>
</html>
