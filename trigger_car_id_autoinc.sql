--trigger_car_id_autoinc
--Триггер для автоматического заполнения ключевого поля
create trigger car_id_autoinc for car
active before insert position 0
as
declare variable tmp DECIMAL (18 ,0) ;
begin
if (new.id is null ) then
new.id = gen_id ( CAR_GEN ,1) ;
else
begin
tmp = gen_id ( CAR_GEN ,0) ;
if ( tmp < new.id ) then
tmp = gen_id ( CAR_GEN , new.id - tmp ) ;
end
end
