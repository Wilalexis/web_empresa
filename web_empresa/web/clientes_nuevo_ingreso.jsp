<%-- 
    Document   : clientes_nuevo_ingreso
    Created on : 8/11/2020, 14:58:50
    Author     : Wilmer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <br>
        <div class="container"> 
            <div class="modal-dialog modal-sm">
                
                    <div class="modal-content">
                        <form action="sr_cliente" method="post" class="form-group" >
                        
                            <div class="modal-header">
                                <h4 class="modal-title text-info" ><b >Ingreso de nuevo empleado</b></h4>
                                <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
                            </div>
                    
                            <div class="modal-body">                                
                                <%--<label><b>ID del cliente: </b></label>--%>
                                <input type="hidden" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                                <label><b>Nombres: </b></label>
                                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Juan Pedro" required>
                                <label><b>Apellidos: </b></label>
                                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Lopez Perez" required>
                                <label><b>NIT del cliente: </b></label>
                                <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="Ejemplo: 7251269-2" required>
                                <label><b>Genero: </b></label>
                                <select name="drop_genero" id="drop_genero" class="form-control" >
                                    <option>--Elija una opcion--</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                </select>
                                <label><b>Telefono: </b></label>
                                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 12345678" required>                                                                                              
                                <label><b>Correo electronico: </b></label>
                                <input type="text" name="txt_correo" id="txt_correo" class="form-control" placeholder="Ejemplo: ejm123@gmail.com" required>                                
                                <%--<label><b>Fecha de ingreso: </b></label>--%>
                                <input type="hidden" name="txt_f_ingreso" id="fecha" class="form-control" readonly>                                                                
                            </div>
                    
                            <br>
                            <div class="modal-footer">
                                <button class="btn btn-info btn-block"  name="btn_agregarC" id="btn_agregarC" value="agregarC"><b>Agregar</b></button>
                            </div>
                        </form>    
                    </div>
                </div>
            
        </div>            
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>    
    <script>
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
                $("#fecha").val(today);
   
            });
    </script>
    </body>
</html>
