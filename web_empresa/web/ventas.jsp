<%-- 
    Document   : ventas
    Created on : 4/11/2020, 01:25:45
    Author     : Wilmer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>

        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="index.jsp"><img src="imagenes/socios.png"></a>

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
            <h2>Ventas</h2>          
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
              Open modal
            </button>

            <!-- The Modal -->
              <div class="modal fade" id="myModal">
              <div class="modal-dialog">
                <div class="modal-content">

                  <!-- Modal Header -->
                  <div class="modal-header">
                    <h4 class="modal-title">Realize la venta</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>

                  
                  <div class="modal-body">
                    <form class="form-inline" action="/action_page.php">
                        <%--<label>ID venta:</label>--%>
                        <input type="hidden" class="form-control " id="email2" placeholder="Enter email" name="email" value="0">
                        <label>No. factura:</label>
                        <input type="number" class="form-control " id="pwd2" placeholder="Enter password" name="pswd">                        
                        <label>Serie:</label>
                        <input type="text" class="form-control " id="email2" placeholder="Enter email" name="email">
                        <%--<label>fecha:</label>--%>
                        <input type="hidden" class="form-control " id="pwd2" placeholder="Enter password" name="pswd">
                        <label >Cliente:</label>
                        <input type="number" class="form-control " id="pwd2" placeholder="Enter password" name="pswd">                        
                        <label >Empleado:</label>
                        <input type="text" class="form-control " id="email2" placeholder="Enter email" name="email">
                        <%--<label >Fecha de ingreso:</label>--%>
                        <input type="hidden" class="form-control " id="pwd2" placeholder="Enter password" name="pswd">                        
                        <%--<label >id_venta_detalle:</label>--%>
                        <input type="hidden" class="form-control " id="email2" placeholder="Enter email" name="email">
                        <%--<label>ID venta</label>
                        <input type="number" class="form-control" id="pwd2" placeholder="Enter password" name="pswd">--%>                        
                        <label>Producto</label>
                        <input type="text" class="form-control " id="email2" placeholder="Enter email" name="email">
                        <label>Cantidad:</label>
                        <input type="number" class="form-control mb-2 mr-sm-2" id="pwd2" placeholder="Enter password" name="pswd">                        
                        <label>Precio:</label>
                        <input type="text" class="form-control " id="email2" placeholder="Enter email" name="email">
                        
                    </form>
                      
                  </div>

                  <!-- Modal footer -->
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Comprar</button>
                  </div>

                </div>
              </div>
            </div>

          </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>    
 

    </body>
</html>
