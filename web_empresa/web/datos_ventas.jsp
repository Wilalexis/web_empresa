<%-- 
    Document   : datos_ventas
    Created on : 8/11/2020, 15:22:27
    Author     : Wilmer
--%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Empleado" %>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos cliente</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/6ffafabebc.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container ">
            <br>
            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_ventas?accion=DatosComprador" method="post" class="form-group">
                        
                            <div class="modal-header">
                                <h4  style="color: #117864;" class="modal-title"><b>Ingrese los datos correspondientes para realizar la venta</b></h4>
                                <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
                            </div>
                    
                            <div class="modal-body">
                                <%--<label><b>ID de Venta</b></label>--%>
                                <input type="hidden" name="txt_id" id="txt_id" class="form-control" value="0">
                                <label><b>No. de factura: </b></label>
                                <input type="number" name="txt_no_factura" id="txt_no_factura" class="form-control" required>
                                <label><b>Serie: </b></label>
                                <input type="text" name="txt_serie" id="txt_serie" class="form-control" required>
                                <%--<label><b>Fecha: </b></label>--%>
                                <input type="hidden" name="txt_fecha" id="txt_fecha" class="form-control" required>
                                <label><b>Cliente: </b></label>
                                <select name="drop_cliente" id="drop_cliente" class="form-control" >
                                <% 
                                    Cliente cliente = new Cliente();
                                    HashMap<String,String> dropC = cliente.drop_cliente();
                                    out.println("<option>--Elija un cliente--</option>");                                    
                                    for(String i: dropC.keySet()){
                                        out.println("<option value='" + i + "' >" + dropC.get(i) +"</option>");
                                    }
                                %>
                                </select>
                                <a href="clientes_nuevo_ingreso.jsp">Click aqui si el cliente no esta registrado</a>
                                <br>
                                <label><b>Empleado: </b></label>
                                <select name="drop_empleado" id="drop_empleado" class="form-control" >
                                <% 
                                    Empleado empleado = new Empleado();
                                    HashMap<String,String> dropE = empleado.drop_empleado();
                                    out.println("<option>--Elija un empleado--</option>");
                                    for(String i: dropE.keySet()){
                                        out.println("<option value='" + i + "' >" + dropE.get(i) +"</option>");
                                    }
                                %>
                                </select>                                               
                                <%--<label><b>Fecha de ingreso: </b></label>--%>
                                <input type="hidden" name="txt_f_ingreso" id="txt_f_ingreso" class="form-control" >
                            </div>
                                                
                            <div class="modal-footer">
                                <button style="background: #117864; color: #fff; " class="btn btn-block"  name="btn_datos_comprador" id="btn_datos_comprador" value="datos_comprador"><b>Comprar</b></button>
                            </div>
                        </form>    
                    </div>
                </div>
            </div> 
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
