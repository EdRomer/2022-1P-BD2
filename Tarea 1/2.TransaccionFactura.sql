/*
	2. Transacción para crear un nuevo proceso de compra para generar la factura y productos facturados para un subscriptor.
*/
set @v_id_factura = null; 
select max(id_factura) into @v_id_factura from tbl_facturas;
set @latestID = @v_id_factura + 1;
set @v_id_subscriptor = 16;
set @v_id_producto 	 = 2; 
set @v_cantidad		 = 2;
set @v_numero_items  = 0;
set @v_precio_prod   = 0; 

#	1. Crear la factura 

    /*insert into bd_sample.tbl_facturas (
		id_factura, fecha_emision, id_subscriptor, numero_items, isv_total, subtotal, totapagar
    ) values ( 
		@latestID, curdate(), @v_id_subscriptor, @v_numero_items, 0, 0, 0
    );*/

#	2. Agregar el producto a los items de factura  
    insert into bd_sample.tbl_items_factura(
		id_factura, id_producto, cantidad
    ) values ( @latestID, @v_id_producto, @v_cantidad );
    
#	3. Actualizar resumen de factura    

select precio_venta into @v_precio_prod from  tbl_productos where id_producto=@v_id_producto;

	update bd_sample.tbl_facturas 
		set numero_items = numero_items +@v_cantidad,
			isv_total = isv_total+(@v_precio_prod * @v_cantidad)*0.18, 
            subtotal  =  subtotal+(@v_precio_prod * @v_cantidad),
            totapagar = totapagar+((@v_precio_prod * @v_cantidad)*1.18)
		 where id_factura = @v_id_factura ;
select * from tbl_facturas where id_subscriptor=16;