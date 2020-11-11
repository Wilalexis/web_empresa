<%-- 
    Document   : datos_compra
    Created on : 8/11/2020, 18:24:01
    Author     : Wilmer
--%>
<%@page import="modelo.Proveedor"%>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compra</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/6ffafabebc.js" crossorigin="anonymous"></script>
    </head>
    <body>
        
         <div class="container ">
            <br>
            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="sr_compras?accion=DatosComprador" method="post" class="form-group">
                        
                            <div class="modal-header">
                                <h4 style="color: #1A3CA4;" class="modal-title"><b>Ingrese los datos correspondientes para realizar la compra</b></h4>
                                <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
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
                                <br>
                                <a href="provedores_nuevo_ingreso.jsp">Click aqui si el proveedor no esta registrado</a>
                                <br>                                
                                </select> 
                                <%--<label><b>Fecha: </b></label>--%>                                
                                <input type="hidden" name="txt_fecha" id="txt_fecha" class="form-control" required>
                                <%--<label><b>Fecha de ingreso: </b></label>--%>                                
                                <input type="hidden" name="txt_f_ingreso" id="txt_f_ingreso" class="form-control" >
                            </div>
                                                
                            <div class="modal-footer">
                                <button style="background: #1A3CA4; color: #fff" class="btn btn-block"  name="btn_datos_vendedor" id="btn_datos_vendedor" value="datos_vendedor"><b>Siguiente</b></button>
                            </div>
                        </form>    
                    </div>
                </div>
            </div> 
        </div>
                                
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>    
    </body>
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
</html>
