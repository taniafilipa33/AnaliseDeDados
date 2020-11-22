use mydb;

DELIMITER //
create function ´existeTeste´(idPaís varchar(45),idSemana int) 
returns boolean
READS SQL DATA
DETERMINISTIC
begin
declare numeroDatascomPaís int default 0;
select count(m.País_idPaís) into numeroDatascomPaís
from testData m where m.País_idPaís = idPaís and m.idSemana = idSemana;
if numeroDatascomPaís > 0 then return false;
else return true;
end if;
end//
DELIMITER;

 DROP FUNCTION ´existeTeste´;

DELIMITER //
CREATE PROCEDURE ´InsereNovoTestData´
(in idPaís varchar(45), idSemana INT, numeroDetestes int, testingRate FLOAT,
posiRate FLOAT, source varchar(45))
READS SQL DATA
DETERMINISTIC
BEGIN
IF ´existeTeste´(idPaís,idSemana) then begin
insert into mydb.testdata values(idPaís,idSemana,testingRate,posiRate,source,numeroDetestes);
end;
end if;
end ;
DELIMITER;

select *from testData;
drop procedure ´InsereNovoTestData´;
call ´InsereNovoTestData´('AT',2,345,45,56,'poo');

