-- Запрос 1
select car.id as car_id from car
join car_equipment on car.id_equipment=car_equipment.id
join sells on sells.id_car=car.id
where car_equipment.id=(select car_equipment.id
from(select first 1 car_equipment.id, car_equipment.price from car_equipment order by price desc))
and sells.sell_date between (dateadd(year, -5, current_timestamp)) and current_date;

-- Запрос 2
select first 5 employee.id,
(employee.second_name || ' '||employee.first_name) as Sotrudnik,
sum(options.price) as total_sum
from employee
join sells on sells.id_employee=employee.id
join additional_options on additional_options.id_sell=sells.id
join options on options.id=additional_options.id_options
where sells.sell_date between (dateadd(year, -1, current_timestamp)) and current_date
group by employee.id,Sotrudnik
order by total_sum desc;


-- Запрос 3
select gear_box.id, gear_box.name, count(gear_box.id) as total_count from gear_box
join car_modification on car_modification.gear_box=gear_box.id
join car on car.id_modification=car_modification.id
join car_equipment on car_equipment.id=car.id_equipment
where car_equipment.id=(select car_equipment.id
from(select first 1 car_equipment.id, car_equipment.price from car_equipment order by price))
group by gear_box.id,gear_box.name
order by total_count desc;

