--Read_committed
--Терминал 1
SQL>  connect 'C:\Users\maxim\OneDrive\Documents\Semester_7\Database\Database\TEST.FDB' user 'SYSDBA' password 'masterkey';
Database:  'C:\Users\maxim\OneDrive\Documents\Semester_7\Database\Database\TEST.FDB', User: SYSDBA
SQL> select * from RC_table;

          ID
============
           1
           2

SQL> insert into RC_table values(3);
SQL> commit;

-----------------------------------

--Терминал 2
SQL>  connect 'C:\Users\maxim\OneDrive\Documents\Semester_7\Database\Database\TEST.FDB' user 'SYSDBA' password 'masterkey';
Database:  'C:\Users\maxim\OneDrive\Documents\Semester_7\Database\Database\TEST.FDB', User: SYSDBA
SQL> select * from RC_table;

          ID
============
           1
           2

SQL> set transaction read committed;
Commit current transaction (y/n)?n
Rolling back work.
SQL> select * from RC_table;

          ID
============
           3
           1
           2
