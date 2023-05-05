/*
DELIMITER //

create or replace procedure secuenciaWhile(in valorInicial int unsigned)
begin 
declare contador int;
set contador = valorInicial;
while valorInicial != 0 do
insert into secuencia values valorInicial;
set valorInicial = contador - 1;
end while;
end
//
DELIMITER ;

DELIMITER //

create or replace procedure secuenciaWhile(in valorInicial int unsigned)
begin 
declare contador int;
delete from secuencia;
set contador = valorInicial;
while contador != 0 do
insert into secuencia(numero) values (contador);
set contador = contador - 1;
end while;
end //
DELIMITER ;

call secuenciaWhile(6);

select s.numero  from secuencia s 


DELIMITER //

create or replace procedure secuenciaWhile(in valorInicial int unsigned)
begin 
declare contador int;
delete from secuencia;
set contador = valorInicial;
repeat 
insert into secuencia(numero) values (contador);
set contador = contador - 1;
until contador = 0
end repeat;
end //
DELIMITER ;

call secuenciaWhile(6);

select s.numero  from secuencia s 

*

DELIMITER //

create or replace procedure secuenciaWhile1(in valorInicial int unsigned)
begin 
declare contador int;
delete from secuencia;
set contador = valorInicial;
bucle: loop
insert into secuencia(numero) values (contador);
set contador = contador - 1;
if (contador = 0) then
leave bucle;
end if;
end loop;
end //
DELIMITER ;

call secuenciaWhile1(5);

select * from secuencia s 

*/
DELIMITER //

create or replace procedure paresImpares(in tope int unsigned)
begin 
declare numero int;
delete from par;
delete from impar;
set numero = 1;
	while numero < tope do 
		if numero % 2 = 0 then 
			insert into par(numero) values (numero);
			set numero = numero + 1;
		elseif numero % 2 != 0 then
			insert into impar(numero) values (numero);
			set numero = numero + 1;
		end if;
	end while;
end //
DELIMITER ;

call paresImpares(10);
