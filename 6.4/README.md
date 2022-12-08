# Домашнее задание к занятию "6.4. PostgreSQL"

## Задача 1

Используя docker поднимите инстанс PostgreSQL (версию 13). Данные БД сохраните в volume.

Подключитесь к БД PostgreSQL используя `psql`.

Воспользуйтесь командой `\?` для вывода подсказки по имеющимся в `psql` управляющим командам.

**Найдите и приведите** управляющие команды для:
- вывода списка БД
- подключения к БД
- вывода списка таблиц
- вывода описания содержимого таблиц
- выхода из psql

Ответ:
```
docker run -itd --rm  --name netology13 -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=postgres -v $(pwd)/datadir:/var/lib/postgresql/data -d postgres:13
psql -h localhost -U postgres -d postgres

root@virt:/home/vitalii/datadir# psql -h localhost -U postgres -d postgres
Password for user postgres: 
psql (12.12 (Ubuntu 12.12-0ubuntu0.20.04.1), server 13.9 (Debian 13.9-1.pgdg110+1))
WARNING: psql major version 12, server major version 13.
         Some psql features might not work.
Type "help" for help.

postgres=# 

Вывод списка баз:

postgres=# \l
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
-----------+----------+----------+------------+------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
(3 rows)

Подключение к БД postgres:

postgres=# \c postgres
psql (12.12 (Ubuntu 12.12-0ubuntu0.20.04.1), server 13.9 (Debian 13.9-1.pgdg110+1))
WARNING: psql major version 12, server major version 13.
         Some psql features might not work.
You are now connected to database "postgres" as user "postgres".

Вывод списка таблиц:
Таблицы все пустые

postgres-# \dt
Did not find any relations.
Добавил ключ S
postgres=# \dtS


          List of relations
   Schema   |          Name           | Type  |  Owner   
------------+-------------------------+-------+----------
 pg_catalog | pg_aggregate            | table | postgres
 pg_catalog | pg_am                   | table | postgres
 pg_catalog | pg_amop                 | table | postgres
 pg_catalog | pg_amproc               | table | postgres
 pg_catalog | pg_attrdef              | table | postgres
 pg_catalog | pg_attribute            | table | postgres
 pg_catalog | pg_auth_members         | table | postgres
 pg_catalog | pg_authid               | table | postgres
 pg_catalog | pg_cast                 | table | postgres
 pg_catalog | pg_class                | table | postgres
 pg_catalog | pg_collation            | table | postgres
 pg_catalog | pg_constraint           | table | postgres
 pg_catalog | pg_conversion           | table | postgres
 pg_catalog | pg_database             | table | postgres
 pg_catalog | pg_db_role_setting      | table | postgres
 pg_catalog | pg_default_acl          | table | postgres
 pg_catalog | pg_depend               | table | postgres
 pg_catalog | pg_description          | table | postgres
 pg_catalog | pg_enum                 | table | postgres
 pg_catalog | pg_event_trigger        | table | postgres
 pg_catalog | pg_extension            | table | postgres
 pg_catalog | pg_foreign_data_wrapper | table | postgres

Вывод описания содержимого таблиц:

postgres=# \d pg_aggregate

Table "pg_catalog.pg_aggregate"
      Column      |   Type   | Collation | Nullable | Default 
------------------+----------+-----------+----------+---------
 aggfnoid         | regproc  |           | not null | 
 aggkind          | "char"   |           | not null | 
 aggnumdirectargs | smallint |           | not null | 
 aggtransfn       | regproc  |           | not null | 
 aggfinalfn       | regproc  |           | not null | 
 aggcombinefn     | regproc  |           | not null | 
 aggserialfn      | regproc  |           | not null | 
 aggdeserialfn    | regproc  |           | not null | 
 aggmtransfn      | regproc  |           | not null | 
 aggminvtransfn   | regproc  |           | not null | 
 aggmfinalfn      | regproc  |           | not null | 
 aggfinalextra    | boolean  |           | not null | 
 aggmfinalextra   | boolean  |           | not null | 
 aggfinalmodify   | "char"   |           | not null | 
 aggmfinalmodify  | "char"   |           | not null | 
 aggsortop        | oid      |           | not null | 
 aggtranstype     | oid      |           | not null | 
 aggtransspace    | integer  |           | not null | 
 aggmtranstype    | oid      |           | not null | 
 aggmtransspace   | integer  |           | not null | 
 agginitval       | text     | C         |          | 
 aggminitval      | text     | C         |          | 


 Выход из psql:

 postgres-# \q
root@virt:/home/vitalii/datadir#
```

## Задача 2

Используя `psql` создайте БД `test_database`.

Изучите [бэкап БД](https://github.com/netology-code/virt-homeworks/tree/virt-11/06-db-04-postgresql/test_data).

Восстановите бэкап БД в `test_database`.

Перейдите в управляющую консоль `psql` внутри контейнера.

Подключитесь к восстановленной БД и проведите операцию ANALYZE для сбора статистики по таблице.

Используя таблицу [pg_stats](https://postgrespro.ru/docs/postgresql/12/view-pg-stats), найдите столбец таблицы `orders` 
с наибольшим средним значением размера элементов в байтах.

**Приведите в ответе** команду, которую вы использовали для вычисления и полученный результат.

Ответ:
```
postgres=# create database test_database;
CREATE DATABASE

docker exec -i netology13 psql -U postgres -d test_database -f /var/lib/postgresql/data/test_dump.sql

vitalii@virt:~$ docker exec -i netology13 psql -U postgres -d test_database -f /var/lib/postgresql/data/test_dump.sql
SET
SET
SET
SET
SET
 set_config 
------------
 
(1 row)

SET
SET
SET
SET
SET
SET
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
ALTER TABLE
COPY 8
 setval 
--------
      8
(1 row)

ALTER TABLE

vitalii@virt:~$ psql -h localhost -U postgres -d test_database

test_database-# \dt
         List of relations
 Schema |  Name  | Type  |  Owner   
--------+--------+-------+----------
 public | orders | table | postgres
(1 row)

test_database=# ANALYZE VERBOSE orders;
INFO:  analyzing "public.orders"
INFO:  "orders": scanned 1 of 1 pages, containing 8 live rows and 0 dead rows; 8 rows in sample, 8 estimated total rows
ANALYZE

test_database=#  select avg_width from pg_stats where tablename='orders';
 avg_width 
-----------
         4
        16
         4
(3 rows)

```

## Задача 3

Архитектор и администратор БД выяснили, что ваша таблица orders разрослась до невиданных размеров и
поиск по ней занимает долгое время. Вам, как успешному выпускнику курсов DevOps в нетологии предложили
провести разбиение таблицы на 2 (шардировать на orders_1 - price>499 и orders_2 - price<=499).

Предложите SQL-транзакцию для проведения данной операции.

Можно ли было изначально исключить "ручное" разбиение при проектировании таблицы orders?

Ответ: 
```
test_database=# create table orders_1 partition of orders for values from (0) to (499);
ERROR:  "orders" is not partitioned
Исходная таблица orders не партицированная. Поэтому  создам новую таблицу orders. Старую orders переименую и данные залью во вновь созданную таблицу. 

test_database=# alter table orders rename to orders_new;
ALTER TABLE
test_database=# create table orders (id integer, title varchar(80), price integer) partition by range(price);
CREATE TABLE
test_database=# create table orders_1 partition of orders for values from (0) to (499);
CREATE TABLE
test_database=# create table orders_2 partition of orders for values from (499) to (999999999);
CREATE TABLE
test_database=# insert into orders (id, title, price) select * from orders_new;
INSERT 0 8

Да, можно было. Для этого изначально надо было сделать таблицу сенкционированной. 
```

## Задача 4

Используя утилиту `pg_dump` создайте бекап БД `test_database`.

Как бы вы доработали бэкап-файл, чтобы добавить уникальность значения столбца `title` для таблиц `test_database`?

Ответ:
```
vitalii@virt:~$ docker exec -ti netology13 bash
root@cbb2a26ed76e:/# 
root@cbb2a26ed76e:/# pg_dump -U postgres test_database > dump_test_database.sql
Для title можно добавить индекс. 
```

---

### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
