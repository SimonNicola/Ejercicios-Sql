-- Ejercicio 1
/*
delimiter //
create or replace procedure nombreClienteif(in codigo int)
begin
	declare nombre varchar(20);	
	if codigo = (select codigo_cliente from cliente  where codigo_cliente = codigo) then
	set nombre = (select nombre_cliente from cliente  where codigo_cliente = codigo);
	else 
	set nombre = "No encontrado";
	end if;
	select nombre;
end
//
delimiter ;

call nombreClienteif(30 ) 

-- Ejercicio 2

delimiter //
create or replace procedure nombreClienteif(in codigo int, out resultado varchar(50))
begin
	declare nombre varchar(20);	
	declare continue handler for not found 
	begin
	set resultado = "Not found codes"; 
	end;

	select nombre_cliente into @resultado 
	from cliente  where codigo_cliente = codigo;	

end
//
delimiter ;

call nombreClienteif(50, @resultado);
select @resultado
*/

delimiter //
create or replace procedure  creaOficina(
in codigo varchar(10),
in ciudad varchar(30),
in pais varchar(50),
in codigo_postal varchar(10),
in telefono varchar(20),
in direccion varchar(20)
)
begin 
declare continue handler for sqlexception 
begin
update oficina set codigo_oficina=codigo,ciudad=ciudad,pais=pais,codigo_postal=codigo_postal,telefono=telefono ,linea_direccion1=direccion
where codigo_oficina = codigo;
end;

insert into oficina (codigo_oficina,ciudad,pais,codigo_postal,telefono,linea_direccion1) values (codigo,ciudad,pais,codigo_postal,telefono,direccion);

end
//
delimiter ;
