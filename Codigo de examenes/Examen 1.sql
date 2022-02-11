SELECT tbl_clientes.idAsesor,tbl_asesores.numeroID,tbl_asesores.nombres,tbl_asesores.apellidos from tbl_asesores left join tbl_clientes on tbl_clientes.idAsesor=tbl_asesores.idAsesor where tbl_clientes.idAsesor IS NOT NULL;
select tbl_clientes.idCliente,tbl_clientes.nombrecompleto,tbl_facturas.idFactura,tbl_facturas.fechaEmision,tbl_facturas.fechaVencimiento from tbl_facturas left join tbl_clientes on tbl_clientes.idCliente=tbl_facturas.idCliente where curdate()>tbl_facturas.fechaVencimiento;
#TRANSACCION DE ACTUALIZACION DE CLIENTES
set @asesorAsignado=1;
set @clienteAsignado=101;
set @cantClientes=0;

#1.Asignar el asesor al cliente

UPDATE tbl_clientes set idAsesor = @asesorAsignado where idcliente = @clienteAsignado;

#2. Actualizar la tabla de Asesores

select count(idAsesor) into @cantClientes from tbl_clientes where idAsesor=@asesorAsignado;

update tbl_asesores set cantClientes=@cantClientes where idAsesor=@asesorAsignado;
select * from tbl_asesores;