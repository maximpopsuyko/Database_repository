--SNAPSHOT
--Терминал 1
Database:  'C:\Users\maxim\OneDrive\Documents\Semester_7\Database\Database\test.fdb', User: SYSDBA
SQL> select * from S_table;

          ID
============
           1
           2

SQL> insert into S_table values(3);
SQL> commit;
SQL> select * from S_table;

          ID
============
           1
           2
           3


-----------------------------------

--Терминал 2
SQL> connect 'C:\Users\maxim\OneDrive\Documents\Semester_7\Database\Database\test.fdb' user 'SYSDBA' password 'masterkey';
Database:  'C:\Users\maxim\OneDrive\Documents\Semester_7\Database\Database\test.fdb', User: SYSDBA
SQL> select * from S_table;

          ID
============
           1
           2

SQL> set transaction snapshot;
Commit current transaction (y/n)?n
Rolling back work.
SQL> select * from S_table;

          ID
============
           1
           2
