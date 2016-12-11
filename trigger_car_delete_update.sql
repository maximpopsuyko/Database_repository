--trigger_car_delete_update and exception
--Триггер для контроля целостности данных в подчиненной таблице при удалении/изменении записей в главной таблице
create exception ex_modify_car 'This car in other tables !';

create trigger car_delete_update for car
before delete or update
as
begin
if (old.id in( select id_car from sells))
then exception ex_modify_car ;
end
