--Задание: Для заданных моделей источника и назначения скопировать из источника весь набор модификаций.
CREATE procedure PROC2(
sourceModel integer,
targetModel integer)
as
declare variable cbt integer;
declare variable et integer;
declare variable dg integer;
declare variable gb integer;
begin
select car_modification.car_body_type,
car_modification.engine_type,
car_modification.drive_gear,
car_modification.gear_box
from car_modification join car_models on car_modification.id_car_model=car_models.id
where car_models.id=:sourceModel
into :cbt, :et, :dg, gb;
update car_modification set car_body_type=:cbt where id_car_model=:targetModel;
update car_modification set engine_type=:et where id_car_model=:targetModel;
update car_modification set drive_gear=:dg where id_car_model=:targetModel;
update car_modification set gear_box=:gb where id_car_model=:targetModel;
end
