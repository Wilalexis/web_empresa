/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//Modificar tabla_ventas.jsp
$('#tbl_ventas').on('click','tr td', function(evt){
    var target,id,id_c,id_e,no_factura,serie,fecha,cliente,empleado,fecha_ingreso;
               
    target = $(event.target);
    id = target.parent().data('id');
    id_c = target.parent().data('id_c');
    id_e = target.parent().data('id_e');     
    no_factura = target.parents("tr").find("td").eq(0).html();
    serie = target.parents("tr").find("td").eq(1).html();
    fecha = target.parents("tr").find("td").eq(2).html();
    cliente = target.parents("tr").find("td").eq(4).html();
        
    fecha_ingreso = target.parents("tr").find("td").eq(5).html();
    empleado = target.parents("tr").find("td").eq(7).html();
                        
    $("#txt_id").val(id);
    $("#txt_no_factura").val(no_factura);
    $("#txt_serie").val(serie);
    $("#txt_fecha").val(fecha);
    $("#drop_cliente").val(id_c);
    $("#txt_ingreso").val(fecha_ingreso); 
    $("#drop_empleado").val(id_e);
                      
    $("#modal_ME").modal('show');                                             
});

//Modificar tabla_ventas_detalle
$('#tbl_ventas_detalles').on('click','tr td', function(evt){
    var target,id,id_v,id_p,producto,cantidad,precio_unitario;
               
    target = $(event.target);
    id = target.parent().data('id');
    id_v = target.parent().data('id_v');
    id_p = target.parent().data('id_p');     
    producto = target.parents("tr").find("td").eq(0).html();
    cantidad = target.parents("tr").find("td").eq(1).html();
    precio_unitario = target.parents("tr").find("td").eq(2).html();    
                        
    $("#txt_id_detalle").val(id);
    $("#txt_IdVenta").val(id_v);
    $("#drop_productoV").val(id_p);
    $("#txt_CantidadVenta").val(cantidad);
    $("#txt_precio_unitario").val(precio_unitario);    
                      
    $("#modal_MEVD").modal('show');                                             
});

//Modificar tabla_compras.jsp
$('#tbl_compras').on('click','tr td', function(evt){
    var target,id,id_p,no_orden,proveedor,fecha_orden,fecha_ingreso;
               
    target = $(event.target);
    id = target.parent().data('id');
    id_p = target.parent().data('id_p');         
    no_orden = target.parents("tr").find("td").eq(0).html();
    proveedor = target.parents("tr").find("td").eq(1).html();
    fecha_orden = target.parents("tr").find("td").eq(2).html();
    fecha_ingreso = target.parents("tr").find("td").eq(3).html();
    
    
    $("#txt_id").val(id);
    $("#txt_no_orden").val(no_orden);
    $("#drop_proveedor").val(id_p);
    $("#txt_fecha").val(fecha_orden);
    $("#txt_f_ingreso").val(fecha_ingreso);    
                      
    $("#modal_MECD").modal('show');                                             
});

//Modificar tabla_compras_detalle
$('#tbl_compras_detalle').on('click','tr td', function(evt){
    var target,id,id_v,id_p,producto,cantidad,precio_costo_unitario;
               
    target = $(event.target);
    id = target.parent().data('id');
    id_v = target.parent().data('id_v');
    id_p = target.parent().data('id_p');     
    producto = target.parents("tr").find("td").eq(0).html();
    cantidad = target.parents("tr").find("td").eq(1).html();
    precio_costo_unitario = target.parents("tr").find("td").eq(2).html();    
                        
    $("#txt_id_compra_detalle").val(id);
    $("#txt_IdCompra").val(id_v);
    $("#drop_productoC").val(id_p);
    $("#txt_CantidadCompra").val(cantidad);
    $("#txt_costo_precio_unitario").val(precio_costo_unitario);    
                      
    $("#modal_MECDTS").modal('show');                                             
});