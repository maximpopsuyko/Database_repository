--trigger_type_checker
--Индивидуальное задание 1 ч1
create exception ex_type_exists 'Type already exists.';

create trigger type_checker for additional_options
active before insert or update
as
declare variable temp integer;
begin
for
select additional_options.id_options from additional_options
where additional_options.id_sell=new.id_sell
into :temp
do
begin
if(:temp=new.id_options)
then exception ex_type_exists;
end
end

