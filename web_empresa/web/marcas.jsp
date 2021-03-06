<%-- 
    Document   : marcas
    Created on : 4/11/2020, 00:30:59
    Author     : Wilmer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Marca" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marcas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
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
                    <a class="dropdown-item" href="ventas.jsp">Tabla Ventas</a>
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
                    <a class="dropdown-item" href="compras.jsp">Tabla Compras</a>
                    <a class="dropdown-item" href="proveedores.jsp">Tabla Proveedores</a>
                </div>    
            </li>
        </ul>        
    </nav>
          
        <div class="container">                        
            <br><h3 style="text-align: center;" class="text-primary">Lista de Marcas</h3><br>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="text-align: center;">
            Ingrese una Nueva Marca
        </button>
        <a href="productos.jsp" class="btn btn-danger">Tabla productos</a>
        <br><br>
        
         <!-- Inicio de formulario: Modificar marcas -->
        <div class="modal fade" id="modal_ME">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_marca" method="post" class="form-group" >
                                
                            <div class="modal-header" >
                            <h4 class="modal-title text-danger"><b>Modificar/Eliminar Marca</b></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                <div class="modal-body">
                
                <input type="hidden" name="txt_id_marca" id="txt_id_marca" class="form-control" value="0" readonly>
                
                   <label><b>Marca:</b></label>
                     <input type="text" name="txt_marca" id="txt_marca" class="form-control" required>
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
                        <form action="sr_marca" method="post" class="form-group" >
                        
                            <div class="modal-header">
                                <h4 class="modal-title text-info" ><b >Ingreso de nueva marca</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <div class="modal-body"> 
                                
                  
                  <input type="hidden" name="txt_id_marca" id="txt_id_marca" class="form-control" value="0" readonly>
                
                   <label><b>Marca:</b></label>
                     <input type="text" name="txt_marca" id="txt_marca" class="form-control" required>
               
                    </div>
                    
                            <br>
                            <div class="modal-footer">
                              <button class="btn btn-info btn-block"  name="btn_agregar" id="btn_agregar" value="agregar"><b>Agregar</b></button>
                             </div>       
                           </form>  
                          </div>
                        </div>
                     </div>  
                    <!-- Fin de formulario: Ingresar nueva marca -->  
                    
         <!-- Inicio tabla Marcas -->        
          <table class="table table-hover" style="text-align: center; ">
             <thead class="thead-dark">
             <tr>
             
                
                <th>Nombre de Marca</th>
                
            </tr>
        </thead>
       
         <tbody id="tbl_marcas" class="table-bordered">
            <tr>
          <% 
        Marca marcas = new Marca();
        DefaultTableModel tabla = new DefaultTableModel(); 
        tabla = marcas.leer();
        for (int t=0; t<tabla.getRowCount(); t++){
            out.println("<tr data-id=" + tabla.getValueAt(t,0) + ">");                          
            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
            out.println("</tr>");
        }
        %>
        </tbody>
      </table>
     </div>
    
        <!-- Fin tabla marcas -->
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>    
        <script>
                       
            $('#tbl_marcas').on('click','tr td', function(evt){
               var target,id_marca,marca;
               
               target = $(event.target);
               id_marca = target.parent().data('id');               
               marca = target.parents("tr").find("td").eq(0).html();
              
               $("#txt_id_marca").val(id_marca);
               $("#txt_marca").val(marca);
        
               $("#modal_ME").modal('show');                                             
            });
            
        </script>
    </body>
    </html>
