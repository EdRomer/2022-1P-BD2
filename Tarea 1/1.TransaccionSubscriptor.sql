/*
	1. Transacción para crear un nuevo subscriptor con los siguientes datos:
*/

set @v_id_subscriptor = null; 

#	Viendo que no tiene dependencias, esta transaccion solo sera una insercion

select MAX(id_subscriptor) into @v_id_subscriptor from tbl_subscriptores;

set @latestID = @v_id_subscriptor + 1;

insert into tbl_subscriptores(id_subscriptor,codigo_subscriptor,nombres,apellidos) values (@latestID,202212345,'Jon Paul','Doe');

select * from tbl_subscriptores;