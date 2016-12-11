--procedure_get_popular_option_at_last_year
--Индивидуальное задание 2 процедура
create procedure get_popular_option_at_last_year
returns(output_id integer)
as
begin
select id from(select first 1 options.id, count(options.id) as total_count from options
join additional_options on additional_options.id_options=options.id
join sells on sells.id=additional_options.id_sell
where sells.sell_date between (dateadd(year, -1, current_timestamp)) and current_date
group by options.id
order by total_count desc)
into :output_id;
end
