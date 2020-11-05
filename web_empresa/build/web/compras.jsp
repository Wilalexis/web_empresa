<%-- 
    Document   : compras
    Created on : 18/10/2020, 06:44:05 PM
    Author     : USUARIO
--%>
<%@page import="modelo.Compras" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras</title>
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
                <a class="nav-link dropdown-toggle" href="ventas.jsp id="navbardrop" data-toggle="dropdown">
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
                    <a class="dropdown-item" href="compras_detalle.jsp">Tabla Compras detalle</a>
                    <a class="dropdown-item" href="proveedores.jsp">Tabla Proveedores</a>
                </div>    
            </li>
        </ul>
        
    </nav>
        <div class="container">                        
        <br><h3 style="text-align: center;">Listado de Compras</h3><br>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="text-align: center;">
            Ingresar una nueva compra
        </button><br><br>
        
         <!-- Inicio de formulario: Modificar compra -->
        <div class="modal fade" id="modal_ME">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_compras" method="post" class="form-group">
                                
                            <div class="modal-header" >
                                <h4 class="modal-title text-danger"><b>Modificar/Eliminar Compra/b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                <div class="modal-body">
                <label><b>ID </b></label>
                <input type="number" name="txt_id_compra" id="txt_id_compra" class="form-control" value="0" readonly>
                <label><b>Compra:</b></label>
                <input type="text" name="txt_compra" id="txt_compra" class="form-control" required>
                <label><b> ID Proveedor:</b></label>
                <input type="number" name="txt_id_proveedor" id="txt_id_proveedor" class="form-control" value="0" readonly>
                <label><b>Proveedor:</b></label>
                <input type="text" name="txt_proveedor" id="txt_proveedor" class="form-control" required>
                <label><b>Nit:</b></label>
                <input type="text" name="txt_nit" id="txt_nit" class="form-control" required>
                <label><b>Direccion:</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" required>
                <label><b>Telefono:</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" required>
                <label><b>No. Orden de Compra:</b></label>
                <input type="number" name="txt_orden" id="txt_orden" class="form-control" required>
                <label><b>Fecha de Orden de la Compra:</b></label>
                <input type="date" name="txt_foc" id="txt_foc" class="form-control" required>
                <label><b>Fecha de ingreso: </b></label>
                <input type="datetime-local" name="txt_fin" id="txt_fin" class="form-control" > 
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
               <!-- fin de modificar-->
        
            <!-- Inicio de formulario: Ingresar nuevo marca -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_compras" method="post" class="form-group" >
                        
                            <div class="modal-header">
                                <h4 class="modal-title text-info" ><b >Ingresar una Nueva Compra</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <div class="modal-body"> 
                <label><b>ID Compra</b></label>
                <input type="number" name="txt_id_compra" id="txt_id_compra" class="form-control" value="0" readonly>
                <label><b>ID Proveedor:</b></label>
                <input type="number" name="txt_id_proveedor" id="txt_id_proveedor" class="form-control" value="0" readonly>
                <label><b>Proveedor:</b></label>
                <input type="text" name="txt_proveedor" id="txt_proveedor" class="form-control" required>
                <label><b>Nit:</b></label>
                <input type="text" name="txt_nit" id="txt_nit" class="form-control" required>
                <label><b>Direccion:</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" required>
                <label><b>Telefono:</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" required>
                <label><b>No. Orden de Compra:</b></label>
                <input type="number" name="txt_orden" id="txt_orden" class="form-control" required>
                <label><b>Fecha de Orden de la Compra:</b></label>
                <input type="date" name="txt_foc" id="txt_foc" class="form-control" required>
                <label><b>Fecha de ingreso: </b></label>
                <input type="datetime-local" name="txt_fin" id="txt_fin" class="form-control" > 
               
                    </div>
                          <br>
                            <div class="modal-footer">
                              <button class="btn btn-info btn-block"  name="btn_agregar" id="btn_agregar" value="agregar"><b>Agregar</b></button>
                             </div>       
                           </form>  
                          </div>
                        </div>
                     </div>  
                    <!-- Fin de formulario: Ingresar nueva compra -->   
                    
                    <!-- Inicio tabla -->        
          <table class="table table-hover " style="text-align: center; ">
             <thead class="thead-dark">
             <tr>
             
                <th>ID </th>
                <th>Proveedor</th>
                <th>Nit</th>
                <th>Direccion</th>
                <th>Telefono</th>
                <th>No.orden</th>
                <th>Fecha de orden</th>
                <th>Fecha de Ingreso</th>
                
                
            </tr>
        </thead>
       
         <tbody id="tbl_compras" class="table-bordered">
            <tr>
          <% 
        Compras compras = new Compras();
        DefaultTableModel tabla = new DefaultTableModel(); 
        tabla = compras.leer();
        for (int t=0; t<tabla.getRowCount(); t++){
            out.println("<tr>");
                out.println("<td>" + tabla.getValueAt(t,0) + "</td>");
                out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
                out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
                out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
                out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
                out.println("<td>" + tabla.getValueAt(t,5) + "</td>");
                out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
                out.println("<td>" + tabla.getValueAt(t,7) + "</td>");
                
            out.println("</tr>");
        }
        %>
        </tbody>
      </table>
     </div>
       
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>     
        <script>
            
            $('#tbl_compras').on('click','tr td', function(evt){
               var target,id_compra,proveedor,nit,direccion,telefono,no_orden,fecha_orden,fecha_ingreso;
               
               target = $(event.target);
               id_compra = target.parent().data('id');               
               proveedor = target.parents("tr").find("td").eq(0).html();
               nit = target.parents("tr").find("td").eq(1).html();
               direccion = target.parents("tr").find("td").eq(2).html();
               telefono = target.parents("tr").find("td").eq(3).html();
               no_orden = target.parents("tr").find("td").eq(4).html();
               fecha_orden = target.parents("tr").find("td").eq(5).html();
               fecha_ingreso = target.parents("tr").find("td").eq(6).html();
               
              
               $("#txt_id_compra").val(id_compra);
               $("#txt_proveedor").val(proveedor);
               $("#txt_nit").val(nit);                             
               $("#txt_direccion").val(direccion);
               $("#txt_telefono").val(telefono); 
               $("#txt_orden").val(no_orden);
               $("#txt_foc").val(fecha_orden); 
               $("#txt_fin").val(fecha_ingreso); 
               $("#modal_ME").modal('show');                                             
            });           
        </script>
    </body>
</html>
