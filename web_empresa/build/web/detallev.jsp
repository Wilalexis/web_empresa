<%-- 
    Document   : detallev
    Created on : 26/10/2020, 03:44:25 PM
    Author     : USUARIO
--%>
<%@page import="modelo.Ventas_detalle"%>
<%@page import="modelo.Marcas" %>
<%@page import="modelo.Ventas" %>
<%@page import="modelo.Producto" %>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Detalle de la venta</title>
<link rel="stylesheet" href="css/main2.css">
</head>
<body>
<div class="control-bar">
<div class="container">
<div class="row">
<div class="col-2-4">
<div class="slogan">Facturación </div>
<label for="config_tax">IVA:
<input type="checkbox" id="config_tax" />
</label>
<label for="config_tax_rate" class="taxrelated">Tasa:
<input type="text" id="config_tax_rate" value="13" />%
</label>
<label for="config_note">Nota:
<input type="checkbox" id="config_note" />
</label>
</div>
<div class="col-4 text-right">
<a <button class="btn btn-info btn-block"  name="btn_agregar" id="btn_agregar" value="agregar"></b>Agregar</a>    
 <button class="btn btn-info btn-block"  name="btn_agregar" id="btn_agregar" value="agregar"><b>Agregar</b></button>
<a href="javascript:window.print()">Ver compra</a>
<a href="ventas_detalle.jsp">Tabla</a>
</div>
</div>
</div>
</div>
<header class="row">
<div class="logoholder text-center">
<img src="imagenes/logoc.png">
</div>
<div class="me">
<p contenteditable>
<strong>UMG antigua Guatemala </strong><br>
234/90, Antigua Guatmela<br>
Guatemala<br>
</p>
</div>
<div class="info">
<p contenteditable>
Web: <a href="http://volkerotto.net">GRUPO 3</a><br>
E-mail: <a href="/cdn-cgi/l/email-protection#6e070008012e010c0b0a0f02180f1c0f0a01401e19"><span class="__cf_email__" data-cfemail="325b5c545d725d505756535e44534053565d1c4245">[email&#160;protected]</span></a><br>
Tel: +502-4760-8879<br>
</p>
</div>
<div class="bank">
<p contenteditable>
Datos bacarios: 45453453453444<br>
Titular de la cuenta: GRUPO 3<br>
</p>
</div>
</header>
<div class="row section">
<div class="col-2">
<h1 contenteditable>Factura de Ventas</h1>
</div>
<div class="col-2 text-right details">
<p contenteditable>
Fecha: <input type="date" name="txt_fi" id="txt_fi" class="form-control" required><br>
Venta : <select name="drop_ventas" id="drop_ventas" class="form-control">
                                <%
                                    Ventas ventas = new Ventas();
                                    HashMap<String,String> dropMo = ventas.drop_venta();
                                    for(String i: dropMo.keySet()){
                                        out.println("<option value='" + i + "' >" + dropMo.get(i) +"</option>");
                                    }
                                %>
                                </select><br>
Vence: <input class="twoweeks" type="text" />
</p>
</div>
<div class="col-2">
<p contenteditable class="client">
<strong>Facturar a</strong><br>
[Nombre cliente]<br>
[Nit del cliente]<br>
[Dirección empresa]<br>
</p>
</div>
<div class="col-2">
<p contenteditable class="client">
<strong>Enviar a</strong><br>
[Nombre cliente]<br>
[Nit del cliente]<br>
[Dirección empresa]<br>
</p>
</div>
</div>
<div class="row section" style="margin-top:-1rem">
<div class="col-1">
<table style='width:100%'>
<thead contenteditable>
<tr class="invoice_detail">
<th width="25%" style="text-align">Vendedor</th>
<th width="25%">Orden de compra </th>
<th width="20%">Enviar por</th>
<th width="30%">Términos y condiciones</th>
</tr>
</thead>
<tbody contenteditable>
<tr class="invoice_detail">
<td width="25%" style="text-align">John Doe</td>
<td width="25%">#PO-2020 </td>
<td width="20%">DHL</td>
<td width="30%">Pago al contado</td>
</tr>
</tbody>
</table>
</div>
</div>
<div class="invoicelist-body">
s<table>
<thead contenteditable>
<th width="5%">Código</th>
<th width="60%">Descripción</th>
<th width="20%">Marca</th>
<th width="10%">Cant.</th>
<th width="15%">Precio</th>
<th class="taxrelated">IVA</th>
<th width="10%">Total</th>
</thead>
<tbody>
<tr>
<td width='5%'><input type="number" name="txt_id_producto" id="txt_id_producto" class="form-control" value="0" readonly></td>
<td width='60%'> <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" required></td>
<td width='60%'><select name="drop_marca" id="drop_marca" class="form-control">
                      <%
                       Marcas marcasm = new Marcas();
                       HashMap<String,String> dropm = marcasm.drop_marca();
                       for(String i: dropm.keySet()){
                       out.println("<option value='" + i + "' >" + dropm.get(i) +"</option>");
                            }
                       %>
                                </select></td>
<td class="amount"><input type="text" name="txt_cantidad" id="txt_cantidad" class="form-control" required></td>
<td class="rate"><input type="number" step="0.1" name="txt_precio_costo" id="txt_precio_costo" class="form-control" required></td>
<td class="tax taxrelated"></td>
<td class="sum"></td>
</tr>
</tbody>
</table>
<a class="control newRow" href="#">+ Nueva fila</a>
</div>
<div class="invoicelist-footer">
<table contenteditable>
<tr class="taxrelated">
<td>IVA:</td>
<td id="total_tax"></td>
</tr>
<tr>
<td><strong>Total:</strong></td>
<td id="total_price"></td>
</tr>
</table>
</div>
<div class="note" contenteditable>
<h2>Nota:</h2>
</div>
<footer class="row">
<div class="col-1 text-center">
<p class="notaxrelated" contenteditable>El monto de la factura no incluye el impuesto sobre las ventas.</p>
</div>
</footer>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="assets/bower_components/jquery/dist/jquery.min.js"><\/script>')</script>
<script src="js/main2.js"></script>
</body>
</html>
