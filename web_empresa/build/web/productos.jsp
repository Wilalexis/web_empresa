<%-- 
    Document   : productos
    Created on : 18/10/2020, 05:48:45 PM
    Author     : USUARIO
--%>
<%@page import="modelo.Marcas" %>
<%@page import="modelo.Producto" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Productos</title>
         <meta charset="UTP-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
            
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="menu.jsp"><img src="imagenes/socios.png"></a>

        <ul class="navbar-nav">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="productos.jsp" id="navbardrop" data-toggle="dropdown">
                    Productos
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="productos.jsp">Tabla Productos</a>
                    <a class="dropdown-item" href="marcas.jsp">Tabla Marcas</a>
                </div>    
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="ventas.jsp" id="navbardrop" data-toggle="dropdown">
                    Ventas
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="ventas.jsp">Tabla Ventas</a>
                    <a class="dropdown-item" href="clientes.jsp">Tabla Clientes</a>     

                    <a class="nav-link dropdown-toggle text-body" href="empleados.jsp" id="navbardrop" data-toggle="dropdown">
                        Empleados
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="empleados.jsp">Tabla Empleados</a>
                        <a class="dropdown-item" href="puestos.jsp">Tabla Puestos</a>       
                    </div>        
                </div>    
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="compras.jap" id="navbardrop" data-toggle="dropdown">
                    Compras
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="compras.jsp">Tabla Compras</a>
                    <a class="dropdown-item" href="proveedores.jsp">Tabla Proveedores</a>
                </div>    
            </li>
        </ul>        
    </nav>
     
    <div class="container">                        
        <br><h3 style="text-align: center;" class="text-danger">Lista de Producto</h3><br>
        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal" style="text-align: center;">
            Ingrese nuevo producto
        </button><br><br>

        <!-- Inicio de formulario: Modificar Producto -->
        <div class="modal fade" id="modal_ME">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_producto" method="post" class="form-group" > 
                        
                            <div class="modal-header" >
                                <h4 class="modal-title text-danger" ><b>Modificar/Eliminar Producto</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <div class="modal-body">                                
                                <label><b>ID del Producto</b></label>
                                <input type="text" name="txt_id_producto" id="txt_id_producto" class="form-control" value="0" readonly>
                                <label><b>Nombre del Producto: </b></label>
                                <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Ejemplo: Zapatos" required>
                                
                                <label><b>Marca del Producto: </b></label>
                                <select name="drop_marca" id="drop_marca" class="form-control">
                                <%
                                    Marcas marcasM = new Marcas();
                                    HashMap<String,String> dropM = marcasM.drop_marca();
                                    for(String i: dropM.keySet()){
                                        out.println("<option value='" + i + "' >" + dropM.get(i) +"</option>");
                                    }
                                %>
                                </select>   
                                
                                <label><b>Descripcion: </b></label>
                                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Ejemplo: Es para" required>
                                <label><b>Imagen: </b></label>
                                <input type="file" name="txt_imagen" id="txt_imagen" class="form-control">
                                <label><b>Precio costo: </b></label>
                                <input type="number" step="0.1" name="txt_precio_costo" id="txt_precio_costo" class="form-control" placeholder="Ejemplo: 2.5" required>
                                <label><b>Precio de venta: </b></label>
                                <input type="number" step="0.1" name="txt_precio_venta" id="txt_precio_venta" class="form-control" placeholder="Ejemplo: 3.2" required>                                
                                <label><b>Existencia: </b></label>
                                <input type="number" name="txt_existencia" id="txt_existencia" class="form-control" placeholder="Ejemplo: 2000" required>
                                <label><b>Fecha de ingreso: </b></label>
                                <input type="text" name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" required>
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
        
        <!-- Fin de formulario: Modificar Producto -->
        
        <!-- Inicio de formulario: Ingresar nuevo Producto -->
        
            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_producto" method="post" class="form-group" >
                        
                            <div class="modal-header">
                                <h4 class="modal-title text-info" ><b >Ingreso de nuevo Producto</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <div class="modal-body">                                
                                <label><b>ID del Producto</b></label>
                                <input type="text" name="txt_id_producto" id="txt_id_producto" class="form-control" value="0" readonly>
                                <label><b>Nombre del Producto: </b></label>
                                <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Ejemplo: Zapatos" required>
                                <label><b>Marca del Producto: </b></label>
                                <select name="drop_id_marca" id="drop_id_marca" class="form-control">
                                 <%
                                    Marcas marcas = new Marcas();
                                    HashMap<String,String> drop = marcas.drop_marca();
                                    out.println("<option>--Elija un puesto--</option>");
                                    for(String i: drop.keySet()){
                                        out.println("<option value='" + i + "' >" + drop.get(i) +"</option>");
                                    }
                                %>
                                </select>   
                                <label><b>Descripcion: </b></label>
                                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Ejemplo: Es para" required>
                                <label><b>Imagen: </b></label>
                                <input type="file" name="txt_imagen" id="txt_imagen" class="form-control" required>
                                <label><b>Precio costo: </b></label>
                                <input type="number" step="0.1" name="txt_precio_costo" id="txt_precio_costo" class="form-control" placeholder="Ejemplo: 2.5" required>
                                <label><b>Precio de venta: </b></label>
                                <input type="number" step="0.1" name="txt_precio_venta" id="txt_precio_venta" class="form-control" placeholder="Ejemplo: 3.2" required>                                
                                <label><b>Existencia: </b></label>
                                <input type="number" name="txt_existencia" id="txt_existencia" class="form-control" placeholder="Ejemplo: 2000" required>
                                <label><b>Fecha de ingreso: </b></label>
                                <input type="date" name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" required>
                            </div>
                    
                            <br>
                            <div class="modal-footer">
                                <button class="btn btn-info btn-block"  name="btn_agregar" id="btn_agregar" value="agregar"><b>Agregar</b></button>
                            </div>
                        </form>    
                    </div>
                </div>
            </div>        
        <!-- Fin de formulario: Ingresar nuevo Producto -->                    
        
        <!-- Inicio tabla Producto -->        
            <table class="table table-hover " style="text-align: center; ">
                <thead class="thead-dark">
                    <tr>
                        <th>Nombre del producto</th>
                        <th>Marca</th>                       
                        <th>Descripcion</th>                       
                        <th>Imagen</th>                       
                        <th>Precio costo</th>
                        <th>Precio venta</th>
                        <th>Existencia</th>
                        <th>Fecha ingreso</th>                  
                    </tr>
                </thead>
                <tbody id="tbl_productos" class="table-bordered">                    
                    <% 
                        Producto tbl_producto = new Producto();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = tbl_producto.leer();
                        for (int t=0;t<tabla.getRowCount();t++){                          
                            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_m=" + tabla.getValueAt(t,3) + ">");
                            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
                            out.println("<td><img src='imagenes/tv.jpg' style='width: 32px; height: 32px;'></img>" + tabla.getValueAt(t,5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,7) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,8) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,9) + "</td>");
                            out.println("</tr>");
                        }
                    %>               
                </tbody>
            </table>
        </div>                             
        <!-- Fin tabla Producto -->
        
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script>
            
            $('#tbl_productos').on('click','tr td', function(evt){
                var target,id,id_m,producto,descripcion,precio_costo,precio_venta,existencia,fecha_ingreso;
                target = $(event.target);
                id = target.parent().data('id');                
                id_m = target.parent().data('id_m');
                producto= target.parents("tr").find("td").eq(0).html();                
                descripcion= target.parents("tr").find("td").eq(2).html();
                
                precio_costo= target.parents("tr").find("td").eq(4).html();
                precio_venta= target.parents("tr").find("td").eq(5).html();
                existencia= target.parents("tr").find("td").eq(6).html();
                fecha_ingreso= target.parents("tr").find("td").eq(7).html();
                
                $("#txt_id_producto").val(id);
                $("#txt_producto").val(producto);
                $("#drop_marca").val(id_m);                
                $("#txt_descripcion").val(descripcion);                
                
                $("#txt_precio_costo").val(precio_costo);
                $("#txt_precio_venta").val(precio_venta);
                $("#txt_existencia").val(existencia);
                $("#txt_fecha_ingreso").val(fecha_ingreso);
                
                $("#modal_ME").modal('show');
            });
        </script>
    
    </body>
</html>
