<%-- 
    Document   : ventas
    Created on : 25/10/2020, 11:34:09 AM
    Author     : USUARIO
--%>
<%@page import="modelo.Ventas" %>
<%@page import="modelo.Empleado" %>
<%@page import="modelo.Cliente" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas</title>
        <meta charset="UTF-8">
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
                <a class="nav-link dropdown-toggle" href="compras.jsp" id="navbardrop" data-toggle="dropdown">
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
            <br><h3 style="text-align: center;" class="text-warning">Lista de Ventas</h3><br>
        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" style="text-align: center;">
            Ingrese una nueva Venta
        </button><br><br>

        <!-- Inicio de formulario: Modificar ventas-->
        <div class="modal fade" id="modal_ME">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_ventas" method="post" class="form-group" >
                        
                            <div class="modal-header" >
                                <h4 class="modal-title text-danger" ><b>Modificar/Eliminar ventas</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <div class="modal-body">
                            <label>Id Venta</label>
                                <input type="number" id="txt_id_venta" class="form-control" name="txt_id_ventas" value="0" readonly>
                                <label>ID Empleado</label>
                                 <select name="drop_empleado" id="drop_empleado" class="form-control">
                                <%
                                    Empleado empleadoM = new Empleado();
                                    HashMap<String,String> dropMo = empleadoM.drop_empleado();
                                    for(String i: dropMo.keySet()){
                                        out.println("<option value='" + i + "' >" + dropMo.get(i) +"</option>");
                                    }
                                %>
                                </select>   
                                <label><b>ID Cliente</b></label>
                                 <select name="drop_cliente" id="drop_cliente" class="form-control">
                                <%
                                    Cliente clienteM = new Cliente();
                                    HashMap<String,String> dropM = clienteM.drop_cliente();
                                    for(String i: dropM.keySet()){
                                        out.println("<option value='" + i + "' >" + dropM.get(i) +"</option>");
                                    }
                                %>
                                </select>   
                                <label>No factura</label>
                                <input type="number" id="txt_no_factura" name="txt_no_factura" class="form-control" required>
                                <label>No serie</label>
                                <input type="number" id="txt_serie" name="txt_serie" class="form-control" required>
                                <label>Fecha factura</label>
                                <input type="text" id="txt_fecha_factura" name="txt_fecha_factura" class="form-control" required>
                                <label><b>Nombres: </b></label>
                                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" required>
                                <label><b>Apellidos: </b></label>
                                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" required>
                                <label><b>NIT del cliente: </b></label>
                                <input type="text" name="txt_nit" id="txt_nit" class="form-control" required>
                                <label><b>Genero: </b></label>
                                <select name="drop_genero" id="drop_genero" class="form-control" >
                                    <option>--Elija una opcion--</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                </select>
                                <label><b>Telefono: </b></label>
                                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" required>                                                                                              
                                <label><b>Correo electronico: </b></label>
                                <input type="text" name="txt_correo" id="txt_correo" class="form-control" required> 
                                <label>Fecha de ingreso</label>
                                <input  type="date" id="txt_fecha_ingreso" name="txt_fecha_ingreso" class="form-control" placeholder="FECHA DE INGRESO" required>                                                                
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
         <!-- Fin de formulario: Modificar ventas -->
        
        <!-- Inicio de formulario: Ingresar nueva venta -->
        
            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_ventas" method="post" class="form-group" >
                        
                            <div class="modal-header">
                                <h4 class="modal-title text-info" ><b >Ingreso de nueva venta</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <div class="modal-body">  
                            <<label>Id Venta</label>
                                <input type="number" id="txt_id_venta" class="form-control" name="txt_id_ventas" value="0" readonly>
                                <label>ID Empleado</label>
                                 <select name="drop_empleado" id="drop_empleado" class="form-control">
                                <%
                                    Empleado empleado = new Empleado();
                                    HashMap<String,String> drop = empleado.drop_empleado();
                                    for(String i: drop.keySet()){
                                        out.println("<option value='" + i + "' >" + drop.get(i) +"</option>");
                                    }
                                %>
                                </select> 
                                <label><b>ID Cliente</b></label>
                                 <select name="drop_cliente" id="drop_cliente" class="form-control">
                                <%
                                    Cliente cliente = new Cliente();
                                    HashMap<String,String> dropN = cliente.drop_cliente();
                                    for(String i: dropN.keySet()){
                                        out.println("<option value='" + i + "' >" + dropN.get(i) +"</option>");
                                    }
                                %>
                                </select>
                                <label>No factura</label>
                                <input type="number" id="txt_no_factura" name="txt_no_factura" class="form-control" required>
                                <label>No serie</label>
                                <input type="number" id="txt_serie" name="txt_serie" class="form-control" required>
                                <label>Fecha factura</label>
                                <input type="text" id="txt_fecha_factura" name="txt_fecha_factura" class="form-control" required>
                                <label><b>Nombres: </b></label>
                                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" required>
                                <label><b>Apellidos: </b></label>
                                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" required>
                                <label><b>NIT del cliente: </b></label>
                                <input type="text" name="txt_nit" id="txt_nit" class="form-control" required>
                                <label><b>Genero: </b></label>
                                <select name="drop_genero" id="drop_genero" class="form-control" >
                                    <option>--Elija una opcion--</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                </select>
                                <label><b>Telefono: </b></label>
                                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" required>                                                                                              
                                <label><b>Correo electronico: </b></label>
                                <input type="text" name="txt_correo" id="txt_correo" class="form-control" required> 
                                <label>Fecha de ingreso</label>
                                <input  type="date" id="txt_fecha_ingreso" name="txt_fecha_ingreso" class="form-control" placeholder="FECHA DE INGRESO" required>                                
                                </div>
                    
                            <br>
                            <div class="modal-footer">
                                <button class="btn btn-info btn-block"  name="btn_agregar" id="btn_agregar" value="agregar"><b>Agregar</b></button>
                            </div>
                        </form>    
                    </div>
                </div>
            </div>        
        <!-- Fin de formulario: Ingresar nueva venta --> 
        
        <!-- Inicio tabla empleados -->        
            <table class="table table-hover " style="text-align: center; ">
                <thead class="thead-dark">
                    <tr>
                        <th>No. del puesto</th>
                        <th>Nombre del puesto</th>                       
                    </tr>
                </thead>
                <tbody id="tbl_ventas" class="table-bordered">                    
                    <% 
                        Ventas ventas = new Ventas();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = ventas.leer();
                        for (int t=0;t<tabla.getRowCount();t++){                          
                            out.println("<tr>");                                
                            out.println("<td>" + tabla.getValueAt(t,0) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
                            out.println("</tr>");
                        }
                    %>               
                </tbody>
            </table>
        </div>                             
        <!-- Fin tabla -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>    
        
    <script>
            
            $('#tbl_ventas').on('click','tr td', function(evt){
               var target,id_venta,id_empleado,id_cliente,no_factura,no_serie,fecha_factura,nombres,apellidos,nit,genero,telefono,correo_electronico,fecha_ingreso;
               
               target = $(event.target);              
               id_venta = target.parents("tr").find("td").eq(0).html();
               id_cliente = target.parents("tr").find("td").eq(1).html();
               id_empleado = target.parents("tr").find("td").eq(2).html();
               no_factura = target.parents("tr").find("td").eq(3).html();
               no_serie = target.parents("tr").find("td").eq(4).html();
               fecha_factura = target.parents("tr").find("td").eq(5).html();
               nombres = target.parents("tr").find("td").eq(6).html();
               apellidos = target.parents("tr").find("td").eq(7).html();
               nit = target.parents("tr").find("td").eq(8).html();
               genero = target.parents("tr").find("td").eq(9).html();
               telefono = target.parents("tr").find("td").eq(10).html();
               correo_electronico = target.parents("tr").find("td").eq(11).html();
               fecha_ingreso = target.parents("tr").find("td").eq(12).html();
               
               
              
               $("#txt_id_ventas").val(id_venta);
               $("#drop_emleado").val(id_empleado);
               $("#drop_cliente").val(id_cliente);
               $("#txt_no_factura").val(no_factura);
               $("#txt_serie").val(no_serie);
               $("#txt_fecha_factura").val(fecha_factura);
               $("#txt_nombres").val(nombres);
               $("#txt_apellidos").val(apellidos);
               $("#txt_nit").val(nit);
               $("#drop_genero").val(genero);
               $("#txt_telefono").val(telefono);
               $("#txt_correo").val(correo_electronico);
               $("#txt_fecha_ingreso").val(fecha_ingreso);
               $("#modal_ME").modal('show');                                             
            });      s
       </script>   
    </body>
</html>
