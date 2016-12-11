--trigger_extra_option
--Индивидуальное задание 2 триггер
create trigger extra_option for sells
active after insert
as
declare variable temp integer;
begin
if (new.price>600000) then
begin
select * from  get_popular_option_at_last_year into :temp;
insert into additional_options values(
new.id,
:temp,
0);
end
end
