# Домашнее задание к занятию "6.2. SQL"

## Введение

Перед выполнением задания вы можете ознакомиться с
[дополнительными материалами](https://github.com/netology-code/virt-homeworks/tree/master/additional/README.md).

## Задача 1

Используя docker поднимите инстанс PostgreSQL (версию 12) c 2 volume,
в который будут складываться данные БД и бэкапы.

Приведите получившуюся команду или docker-compose манифест.

Ответ:

```

root@virt:~# docker run -itd --rm  --name netology_postgresql -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=postgres -v vol1:/var/lib/postgresql/data -v vol2:/var/lib/postgresql -d postgres:12
Unable to find image 'postgres:12' locally
12: Pulling from library/postgres
a603fa5e3b41: Pull complete
02d7a77348fd: Pull complete
16b62ca80c8f: Pull complete
fbd795da1fe1: Pull complete
9c68de39d930: Pull complete
2e441a95082c: Pull complete
1c97f440fe14: Pull complete
87a3f78bc5d1: Pull complete
6f5522bdba19: Pull complete
3ffbed8daf3b: Pull complete
fe084ee65e13: Pull complete
3b4e12d98615: Pull complete
f6c5d03edc85: Pull complete
Digest: sha256:e173f51a569682e0afb34e23d863884d0c2b4e5ecd0616789883b4119016f479
Status: Downloaded newer image for postgres:12
b2113e6adb3b4d7d5231ef958a0a6a62f7a596f0aafaf7e685534824a7b50dcf
root@virt:~# docker ps
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS                                       NAMES
b2113e6adb3b   postgres:12   "docker-entrypoint.s…"   39 seconds ago   Up 33 seconds   0.0.0.0:5432->5432/tcp, :::5432->5432/tcp   netology_postgresql

root@virt:~# psql -h localhost -U postgres -d postgres
Password for user postgres:
psql (12.12 (Ubuntu 12.12-0ubuntu0.20.04.1), server 12.13 (Debian 12.13-1.pgdg110+1))
Type "help" for help.

postgres=#



```

## Задача 2

В БД из задачи 1:
- создайте пользователя test-admin-user и БД test_db
- в БД test_db создайте таблицу orders и clients (спeцификация таблиц ниже)
- предоставьте привилегии на все операции пользователю test-admin-user на таблицы БД test_db
- создайте пользователя test-simple-user
- предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE данных таблиц БД test_db

Таблица orders:
- id (serial primary key)
- наименование (string)
- цена (integer)

Таблица clients:
- id (serial primary key)
- фамилия (string)
- страна проживания (string, index)
- заказ (foreign key orders)

Приведите:
- итоговый список БД после выполнения пунктов выше,
- описание таблиц (describe)
- SQL-запрос для выдачи списка пользователей с правами над таблицами test_db
- список пользователей с правами над таблицами test_db

Ответ:
```
Создавал через DBeaver

create database test_db
create role "test-admin-user" superuser;
create table orders (id integer PRIMARY KEY, name text, price integer);
create table clients (id integer PRIMARY KEY, lastname text, country text, booking integer,	FOREIGN KEY(booking) REFERENCES orders (Id));
grant all privileges on database test_db to "test-admin-user";
create role "test-simple-user";
grant select on table public.orders to "test-simple-user";
grant insert on table public.orders to "test-simple-user";
grant update on table public.orders to "test-simple-user";
grant delete on table public.orders to "test-simple-user";
grant select on table public.clients to "test-simple-user";
grant insert on table public.clients to "test-simple-user";
grant update on table public.clients to "test-simple-user";
grant delete on table public.clients to "test-simple-user";

postgres=# \l
                                     List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |       Access privileges
-----------+----------+----------+------------+------------+--------------------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres                   +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres                   +
           |          |          |            |            | postgres=CTc/postgres
 test_db   | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =Tc/postgres                  +
           |          |          |            |            | postgres=CTc/postgres         +
           |          |          |            |            | "test-admin-user"=CTc/postgres
(4 rows)


test_db-# \dt
          List of relations
 Schema |  Name   | Type  |  Owner
--------+---------+-------+----------
 public | clients | table | postgres
 public | orders  | table | postgres
(2 rows)

test_db-# \du
                                       List of roles
    Role name     |                         Attributes                         | Member of
------------------+------------------------------------------------------------+-----------
 postgres         | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
 test-admin-user  | Superuser, Cannot login                                    | {}
 test-simple-user | Cannot login                                               | {}





```

## Задача 3

Используя SQL синтаксис - наполните таблицы следующими тестовыми данными:

Таблица orders

|Наименование|цена|
|------------|----|
|Шоколад| 10 |
|Принтер| 3000 |
|Книга| 500 |
|Монитор| 7000|
|Гитара| 4000|

Таблица clients

|ФИО|Страна проживания|
|------------|----|
|Иванов Иван Иванович| USA |
|Петров Петр Петрович| Canada |
|Иоганн Себастьян Бах| Japan |
|Ронни Джеймс Дио| Russia|
|Ritchie Blackmore| Russia|

Используя SQL синтаксис:
- вычислите количество записей для каждой таблицы
- приведите в ответе:
    - запросы
    - результаты их выполнения.


Ответ:

```

insert into orders VALUES (1, 'Шоколад', 10), (2, 'Принтер', 3000), (3, 'Книга', 500), (4, 'Монитор', 7000), (5, 'Гитара', 4000);
insert into clients VALUES (1, 'Иванов Иван Иванович', 'USA'), (2, 'Петров Петр Петрович', 'Canada'), (3, 'Иоганн Себастьян Бах', 'Japan'), (4, 'Ронни Джеймс Дио', 'Russia'), (5, 'Ritchie Blackmore', 'Russia');
select count (*) from orders;
select count (*) from clients;
test_db=# select count (*) from orders;
 count
-------
     5
(1 row)
test_db=#
test_db=# select count (*) from clients;
 count
-------
     5
(1 row)
test_db=#


```

## Задача 4

Часть пользователей из таблицы clients решили оформить заказы из таблицы orders.

Используя foreign keys свяжите записи из таблиц, согласно таблице:

|ФИО|Заказ|
|------------|----|
|Иванов Иван Иванович| Книга |
|Петров Петр Петрович| Монитор |
|Иоганн Себастьян Бах| Гитара |

Приведите SQL-запросы для выполнения данных операций.

Приведите SQL-запрос для выдачи всех пользователей, которые совершили заказ, а также вывод данного запроса.

Подсказк - используйте директиву `UPDATE`.

Ответ:

```
update  clients set booking = 3 where id = 1;
update  clients set booking = 4 where id = 2;
update  clients set booking = 5 where id = 3;

test_db=# select * from clients where booking is not null;
 id |       lastname       | country | booking
----+----------------------+---------+---------
  1 | Иванов Иван Иванович | USA     |       3
  2 | Петров Петр Петрович | Canada  |       4
  3 | Иоганн Себастьян Бах | Japan   |       5
(3 rows)

test_db=#


```

## Задача 5

Получите полную информацию по выполнению запроса выдачи всех пользователей из задачи 4
(используя директиву EXPLAIN).

Приведите получившийся результат и объясните что значат полученные значения.

Ответ:


```
test_db=# explain select * from clients where booking is not null;
                        QUERY PLAN
-----------------------------------------------------------
 Seq Scan on clients  (cost=0.00..18.10 rows=806 width=72)
   Filter: (booking IS NOT NULL)
(2 rows)

Запись показывает стоимомть нагрузки на исполнение

```

## Задача 6

Создайте бэкап БД test_db и поместите его в volume, предназначенный для бэкапов (см. Задачу 1).

Остановите контейнер с PostgreSQL (но не удаляйте volumes).

Поднимите новый пустой контейнер с PostgreSQL.

Восстановите БД test_db в новом контейнере.

Приведите список операций, который вы применяли для бэкапа данных и восстановления.

Ответ:

```

root@virt:~# docker exec -t netology_postgresql pg_dump -U postgres test_db -f /var/lib/postgresql/data/dump_test.sql

root@virt:~# docker stop netology_postgresql
netology_postgresql
root@virt:~# docker volume ls
DRIVER    VOLUME NAME
local     vol1
local     vol2

root@virt:~# docker run -itd --rm  --name netology_postgresql2 -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=postgres -v vol1:/var/lib/postgresql/data -v vol2:/var/lib/postgresql -d postgres:12

root@virt:~# docker exec -i netology_postgresql2 psql -U postgres -d test_db -f /var/lib/postgresql/data/dump_test.sql
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

```

---

### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
