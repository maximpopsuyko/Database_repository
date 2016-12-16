--тесты по запуску, подтверждению и откату транзакций
SQL> create table test_table (id integer not null primary key); --создаем тестовую таблицу с единственным полем
SQL> commit;
SQL> insert into test_table values(1);
SQL> commit; -- выполним commit
SQL> rollback; --видно, что откат не сработал, значение не изменилось
SQL> select * from test_table;

          ID
============
           1

SQL> insert into test_table values(2); --добавляем следующую запись, не выполняя commit
SQL> select * from test_table;

          ID
============
           1
           2

SQL> rollback; --в данном случае откат сработал
SQL> select * from test_table;

          ID
============
           1

SQL> insert into test_table values(2);
SQL> savepoint one; 
-- создадим точку сохранения. Точка сохранения создается для команды rollback
SQL> delete from test_table;
SQL> insert into test_table values(3);
SQL> select * from test_table; 

          ID
============
           3

SQL> rollback to one;
SQL> select * from test_table; 

          ID
============
           1
           2
-- после того, как мы удалили исходные записи и добавили новую, мы выполнили откат к точке сохранения, в результате мы видим исходные данные
