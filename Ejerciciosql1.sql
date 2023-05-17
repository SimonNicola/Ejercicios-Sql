delimiter //
create or replace procedure comprarEntrada(in nif varchar(20),in ic int,in ib int, out error int)
begin 
declare continue handler for sqlwarning  begin 
set error = 1;
rollback;
end;
start transaction;
set @resultado = 
(select c.saldo from cuentas c where c.idCuenta = ic)
;
update cuentas set saldo = @resultado where idCuenta = ic;
insert into entradas values (ib,nif);
set error = 0;
commit;
end
//
delimiter ;

call comprarEntrada("reab", 2, 2, @out) 

select @out