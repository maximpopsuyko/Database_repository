--Snapshot_table_stability
--Терминал 1
SQL> select * from SN_table;

          ID
============
           1
           2

SQL> update SN_table set id=10 where id=1;
SQL> select * from SN_table;

          ID
============
          10
           2

SQL> commit;
SQL> update SN_table set id=1 where id=10;
SQL> commit;
SQL> select * from SN_table;

          ID
============
           1
           2

-----------------------------------

--Терминал 2
SQL> set transaction isolation level snapshot table stability; 
Commit current transaction (y/n)?n
Rolling back work.
SQL> select * from SN_table;
  
          ID
============
           1
           2

SQL> update SN_table set id=20 where id=1;
Statement failed, SQLSTATE = 40001
Deadlock
- update conflicts with concurrent update
- concurrent transaction number is 64
SQL> update SN_table set id=20 where id=1;
SQL> select * from SN_table;
          ID
============
          20
           2
