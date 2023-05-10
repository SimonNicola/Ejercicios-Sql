
/* Ejercicio 1 */

DELIMITER //

create or replace function EsPrimo(primo int)
returns boolean
begin
declare temporal int;
set temporal = 0;
while primo > temporal DO
if(primo % temporal) then
set temporal = temporal + 1;
end if;
end while;
if(temporal = 2) then 
return true;
elseif (temporal > 2) then
return false;
end if;
END;
//

DELIMITER ;

/* Ejercicio 2 */

DELIMITER //

create or replace function p_primo2(primo int)
returns boolean
begin
declare temporal int;
set temporal = 0;
while primo > temporal DO
if(primo % temporal) then
set temporal = temporal + 1;
end if;
end while;
if(temporal = 2) then 
return true;
elseif (temporal > 2) then
return false;
end if;
END;
//

DELIMITER ;

/* Ejercicio 3 */

Delimiter //
create or replace function p_primo(primo int)
returns boolean
begin
declare temporal int;
set temporal = 0;
while primo > temporal DO
if(primo % temporal) then
set temporal = temporal + 1;
end if;
end while;
if(temporal = 2) then 
return true;
elseif (temporal > 2) then
return false;
end if;
END;
//

DELIMITER ;

/* Ejercicio 4 */

Delimiter //

create or replace function Factoral(numero int)
returns int 
begin 
declare temporal int;
declare resultado int;
set temporal = numero - 1;
while temporal > 0 do
set temporal = temporal * numero;
set numero = numero - 1;
set 

end while;
declare 
end
delimiter ;



