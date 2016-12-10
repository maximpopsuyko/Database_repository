--Задание: Реализовать процедуру, позволяющую скопировать набор комплектацию со всеми связями с дополнительными опциями.
CREATE procedure PROC1(
sourceEquipment integer,
targetEquipment integer)
as
declare variable temp integer;
begin
delete from "CAR_DEFAULT-OPTIONS" where "CAR_DEFAULT-OPTIONS".id_equipment=:targetEquipment;
for
select "CAR_DEFAULT-OPTIONS".id_options from "CAR_DEFAULT-OPTIONS"
where "CAR_DEFAULT-OPTIONS".id_equipment=:sourceEquipment
into :temp
do
begin
insert into "CAR_DEFAULT-OPTIONS" values(:temp, :targetEquipment);
end
end
