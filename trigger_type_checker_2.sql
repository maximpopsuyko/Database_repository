--trigger_car_checker_2
--Индивидуальное задание 1 ч2
create trigger type_checker_2 for "CAR_DEFAULT-OPTIONS"
active before insert or update
as
declare variable temp integer;
begin
for
select "CAR_DEFAULT-OPTIONS".id_options from "CAR_DEFAULT-OPTIONS"
where "CAR_DEFAULT-OPTIONS".id_equipment=new.id_equipment
into :temp
do
begin
if(:temp=new.id_options)
then exception ex_type_exists;
end
end
