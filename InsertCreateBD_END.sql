-- SQL Manager Lite for PostgreSQL 6.1.0.53492
-- ---------------------------------------
-- Host      : localhost
-- Database  : postgres
-- Version   : PostgreSQL 9.6.13, compiled by Visual C++ build 1800, 64-bit



SET check_function_bodies = false;
--
-- Structure for table city (OID = 33344) :
--
SET search_path = public, pg_catalog;
CREATE TABLE public.city (
    id bigserial NOT NULL,
    city varchar(50) NOT NULL,
    time_zone varchar(50)
)
WITH (oids = false);
--
-- Structure for table activity_type (OID = 33350) :
--
CREATE TABLE public.activity_type (
    id bigserial NOT NULL,
    activity_type varchar(50) NOT NULL
)
WITH (oids = false);
--
-- Structure for table halls (OID = 33356) :
--
CREATE TABLE public.halls (
    id bigserial NOT NULL,
    number integer NOT NULL,
    tickets_count integer NOT NULL,
    scheme text
)
WITH (oids = false);
--
-- Structure for table posters (OID = 33365) :
--
CREATE TABLE public.posters (
    id bigserial NOT NULL,
    poster text
)
WITH (oids = false);
--
-- Structure for table location (OID = 33374) :
--
CREATE TABLE public.location (
    id bigserial NOT NULL,
    title_place varchar(200) NOT NULL,
    city_id bigint NOT NULL,
    street varchar(100),
    house_number varchar(50),
    longitude real,
    latitude real
)
WITH (oids = false);
--
-- Structure for table activity_location (OID = 33380) :
--
CREATE TABLE public.activity_location (
    id bigserial NOT NULL,
    location_id bigint NOT NULL,
    halls_id bigint NOT NULL
)
WITH (oids = false);
--
-- Definition for type enum_role (OID = 33385) :
--
CREATE TYPE public.enum_role AS ENUM (
  'ROLE_ADMIN', 'ROLE_USER'
);
--
-- Structure for table role (OID = 33391) :
--
CREATE TABLE public.role (
    id bigserial NOT NULL,
    role enum_role NOT NULL
)
WITH (oids = false);
--
-- Structure for table user_role (OID = 33397) :
--
CREATE TABLE public.user_role (
    id bigserial NOT NULL,
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
)
WITH (oids = false);
--
-- Structure for table activity (OID = 33403) :
--
CREATE TABLE public.activity (
    id bigserial NOT NULL,
    type_id bigint NOT NULL,
    title varchar(200),
    location_id bigint,
    poster_id bigint
)
WITH (oids = false);
--
-- Structure for table users (OID = 33409) :
--
CREATE TABLE public.users (
    id bigserial NOT NULL,
    first_name varchar(100),
    last_name varchar(100),
    middle_name varchar(100),
    password varchar(200) NOT NULL,
    email varchar(100) NOT NULL,
    phone varchar(20),
    city_id bigint
)
WITH (oids = false);
--
-- Structure for table activity_date_halls (OID = 33415) :
--
CREATE TABLE public.activity_date_halls (
    id bigserial NOT NULL,
    activity_date timestamp without time zone,
    halls_id bigint,
    activity_id bigint NOT NULL
)
WITH (oids = false);
--
-- Definition for type enum_ticket_status (OID = 33420) :
--
CREATE TYPE public.enum_ticket_status AS ENUM (
  'blocked', 'temp_blocked', 'sales', 'free'
);
--
-- Structure for table tickets (OID = 33431) :
--
CREATE TABLE public.tickets (
    id bigserial NOT NULL,
    act_date_halls_id bigint NOT NULL,
    row_num integer,
    place_num integer,
    ticket_status enum_ticket_status,
    sign_num integer
)
WITH (oids = false);
--
-- Structure for table users_activity (OID = 33437) :
--
CREATE TABLE public.users_activity (
    id bigserial NOT NULL,
    user_id bigint NOT NULL,
    activity_id bigint,
    tickets_id bigint
)
WITH (oids = false);
--
-- Data for table public.city (OID = 33344) (LIMIT 0,5)
--
INSERT INTO city (id, city, time_zone)
VALUES (1, 'Москва', 'en-US');

INSERT INTO city (id, city, time_zone)
VALUES (2, 'Воронеж', 'en-US');

INSERT INTO city (id, city, time_zone)
VALUES (3, 'Ижевск', 'en-US');

INSERT INTO city (id, city, time_zone)
VALUES (4, 'Казань', 'en-US');

INSERT INTO city (id, city, time_zone)
VALUES (5, 'Новосибирск', 'en-US');

--
-- Data for table public.activity_type (OID = 33350) (LIMIT 0,2)
--
INSERT INTO activity_type (id, activity_type)
VALUES (1, 'Кино');

INSERT INTO activity_type (id, activity_type)
VALUES (2, 'Концерт');

--
-- Data for table public.halls (OID = 33356) (LIMIT 0,11)
--
INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (7, 1, 80, '[8,10]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (2, 1, 160, '[8,20]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (3, 2, 105, '[7,15]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (6, 2, 152, '[9,19]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (8, 3, 60, '[6,10]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (4, 6, 105, '[7,15]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (1, 10, 220, '[11,20]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (9, 6, 80, '[8,10]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (5, 4, 105, '[7,15]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (10, 8, 150, '[10,15]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (11, 9, 80, '[8,10]');

--
-- Data for table public.posters (OID = 33365) (LIMIT 0,12)
--
INSERT INTO posters (id, poster)
VALUES (1, 'Led2.jpg');

INSERT INTO posters (id, poster)
VALUES (2, 'Sonik1.jpg');

INSERT INTO posters (id, poster)
VALUES (3, 'Gent.jpg');

INSERT INTO posters (id, poster)
VALUES (4, 'Zov.jpg');

INSERT INTO posters (id, poster)
VALUES (5, 'Pinocchio.jpg');

INSERT INTO posters (id, poster)
VALUES (6, 'Jazz.jpg');

INSERT INTO posters (id, poster)
VALUES (7, 'Dani3.jpg');

INSERT INTO posters (id, poster)
VALUES (8, 'BG.jpg');

INSERT INTO posters (id, poster)
VALUES (9, 'Garret.jpg');

INSERT INTO posters (id, poster)
VALUES (10, 'Perevod.jpg');

INSERT INTO posters (id, poster)
VALUES (11, 'Greed.jpg');

INSERT INTO posters (id, poster)
VALUES (12, 'Parade.jpg');

--
-- Data for table public.location (OID = 33374) (LIMIT 0,5)
--
INSERT INTO location (id, title_place, city_id, street, house_number, longitude, latitude)
VALUES (1, 'Победа', 5, 'Ленина', '7', NULL, NULL);

INSERT INTO location (id, title_place, city_id, street, house_number, longitude, latitude)
VALUES (2, 'Киносити', 5, 'Фрунзе', '238', NULL, NULL);

INSERT INTO location (id, title_place, city_id, street, house_number, longitude, latitude)
VALUES (4, 'Korston', 1, 'Николая Ершова', '1А', NULL, NULL);

INSERT INTO location (id, title_place, city_id, street, house_number, longitude, latitude)
VALUES (5, 'Киномир', 5, 'Рубиновая', '9', NULL, NULL);

INSERT INTO location (id, title_place, city_id, street, house_number, longitude, latitude)
VALUES (3, 'Алмаз Синема Гранд', 1, 'Спартаковская', '6', NULL, NULL);

--
-- Data for table public.activity_location (OID = 33380) (LIMIT 0,11)
--
INSERT INTO activity_location (id, location_id, halls_id)
VALUES (1, 1, 1);

INSERT INTO activity_location (id, location_id, halls_id)
VALUES (2, 1, 2);

INSERT INTO activity_location (id, location_id, halls_id)
VALUES (5, 3, 5);

INSERT INTO activity_location (id, location_id, halls_id)
VALUES (7, 4, 7);

INSERT INTO activity_location (id, location_id, halls_id)
VALUES (8, 5, 8);

INSERT INTO activity_location (id, location_id, halls_id)
VALUES (3, 2, 3);

INSERT INTO activity_location (id, location_id, halls_id)
VALUES (6, 4, 6);

INSERT INTO activity_location (id, location_id, halls_id)
VALUES (4, 2, 4);

INSERT INTO activity_location (id, location_id, halls_id)
VALUES (9, 3, 9);

INSERT INTO activity_location (id, location_id, halls_id)
VALUES (12, 5, 10);

INSERT INTO activity_location (id, location_id, halls_id)
VALUES (13, 5, 11);

--
-- Data for table public.role (OID = 33391) (LIMIT 0,2)
--
INSERT INTO role (id, role)
VALUES (1, 'ROLE_USER');

INSERT INTO role (id, role)
VALUES (2, 'ROLE_ADMIN');

--
-- Data for table public.activity (OID = 33403) (LIMIT 0,14)
--
INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (6, 1, 'Джентельмены', 5, 3);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (8, 1, 'Зов предков', 5, 4);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (1, 1, 'Соник', 1, 2);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (5, 1, 'Соник', 2, 2);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (2, 1, 'Лёд2', 2, 1);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (9, 1, 'Пиноккио', 5, 5);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (10, 2, 'Джаз', 5, 6);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (11, 2, 'Danileigh', 3, 7);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (12, 2, 'Аквариум', 5, 8);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (13, 2, 'Garret', 3, 9);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (14, 1, 'Соник', 5, 2);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (4, 1, 'Перевод', 4, 10);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (7, 1, 'Жадность', 4, 11);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (3, 1, 'Парад', 3, 12);

--
-- Data for table public.activity_date_halls (OID = 33415) (LIMIT 0,24)
--
INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (3, '2020-03-06 11:25:00', 5, 3);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (13, '2020-03-07 19:40:00', 8, 10);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (14, '2020-03-06 22:00:00', 9, 11);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (15, '2020-03-07 18:00:00', 8, 12);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (16, '2020-03-06 23:00:00', 9, 13);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (17, '2020-03-06 10:20:00', 8, 14);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (5, '2020-03-06 10:25:30', 10, 6);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (7, '2020-03-07 16:30:00', 11, 6);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (18, '2020-03-07 10:00:00', 8, 6);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (19, '2020-03-07 12:15:00', 8, 6);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (21, '2020-03-06 19:00:00', 8, 14);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (20, '2020-03-07 20:00:00', 8, 6);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (22, '2020-03-06 10:00:00', 2, 5);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (23, '2020-03-06 10:00:00', 1, 1);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (12, '2020-03-06 12:00:00', 9, 3);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (24, '2020-03-07 11:00:00', 8, 8);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (4, '2020-03-07 17:15:00', 2, 1);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (6, '2020-03-07 19:00:00', 6, 4);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (1, '2020-03-06 11:25:00', 1, 1);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (2, '2020-03-06 13:00:00', 2, 1);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (9, '2020-03-06 15:00:00', 6, 7);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (8, '2020-03-06 18:40:00', 8, 9);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (10, '2020-03-06 10:30:00', 3, 2);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (11, '2020-03-06 12:40:00', 3, 2);

--
-- Data for table public.tickets (OID = 33431) (LIMIT 0,2026)
--
INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1, 1, 1, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2, 1, 1, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (3, 1, 1, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (4, 1, 1, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (5, 1, 1, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (6, 1, 1, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (7, 1, 1, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (8, 1, 1, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (9, 1, 1, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (10, 1, 1, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (11, 1, 1, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (12, 1, 1, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (13, 1, 1, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (14, 1, 1, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (16, 1, 1, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (17, 1, 1, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (18, 1, 1, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (19, 1, 1, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (20, 1, 1, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (21, 1, 2, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (22, 1, 2, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (23, 1, 2, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (24, 1, 2, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (27, 1, 2, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (28, 1, 2, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (29, 1, 2, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (30, 1, 2, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (31, 1, 2, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (32, 1, 2, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (33, 1, 2, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (34, 1, 2, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (35, 1, 2, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (36, 1, 2, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (37, 1, 2, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (38, 1, 2, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (39, 1, 2, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (40, 1, 2, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (41, 1, 3, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (42, 1, 3, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (43, 1, 3, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (44, 1, 3, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (45, 1, 3, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (46, 1, 3, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (47, 1, 3, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (48, 1, 3, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (49, 1, 3, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (51, 1, 3, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (52, 1, 3, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (53, 1, 3, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (54, 1, 3, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (55, 1, 3, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (56, 1, 3, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (57, 1, 3, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (58, 1, 3, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (59, 1, 3, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (60, 1, 3, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (63, 1, 4, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (65, 1, 4, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (67, 1, 4, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (71, 1, 4, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (72, 1, 4, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (75, 1, 4, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (76, 1, 4, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (77, 1, 4, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (78, 1, 4, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (79, 1, 4, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (80, 1, 4, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (81, 1, 5, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (82, 1, 5, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (83, 1, 5, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (95, 1, 5, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (96, 1, 5, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (97, 1, 5, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (98, 1, 5, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (99, 1, 5, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (100, 1, 5, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (101, 1, 6, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (102, 1, 6, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (103, 1, 6, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (104, 1, 6, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (105, 1, 6, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (106, 1, 6, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (116, 1, 6, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (117, 1, 6, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (118, 1, 6, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (119, 1, 6, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (120, 1, 6, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (121, 1, 7, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (122, 1, 7, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (123, 1, 7, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (124, 1, 7, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (125, 1, 7, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (126, 1, 7, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (135, 1, 7, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (136, 1, 7, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (68, 1, 4, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (62, 1, 4, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (74, 1, 4, 14, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (50, 1, 3, 10, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (73, 1, 4, 13, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (129, 1, 7, 9, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (93, 1, 5, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (92, 1, 5, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (87, 1, 5, 7, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (86, 1, 5, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (85, 1, 5, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (91, 1, 5, 11, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (131, 1, 7, 11, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (111, 1, 6, 11, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (25, 1, 2, 5, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (26, 1, 2, 6, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (113, 1, 6, 13, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (114, 1, 6, 14, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (127, 1, 7, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (128, 1, 7, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (132, 1, 7, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (115, 1, 6, 15, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (107, 1, 6, 7, 'blocked', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (64, 1, 4, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (108, 1, 6, 8, 'blocked', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (69, 1, 4, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (70, 1, 4, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (15, 1, 1, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (133, 1, 7, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (134, 1, 7, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (109, 1, 6, 9, 'blocked', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (66, 1, 4, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (84, 1, 5, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (137, 1, 7, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (138, 1, 7, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (139, 1, 7, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (140, 1, 7, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (151, 1, 8, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (152, 1, 8, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (153, 1, 8, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (154, 1, 8, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (155, 1, 8, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (156, 1, 8, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (157, 1, 8, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (158, 1, 8, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (159, 1, 8, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (164, 1, 8, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (165, 1, 8, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (166, 1, 8, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (167, 1, 8, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (168, 1, 8, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (169, 1, 8, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (170, 1, 8, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (171, 1, 9, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (172, 1, 9, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (176, 1, 9, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (177, 1, 9, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (178, 1, 9, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (181, 1, 9, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (182, 1, 9, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (183, 1, 9, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (184, 1, 9, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (185, 1, 9, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (187, 1, 9, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (188, 1, 9, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (189, 1, 9, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (190, 1, 9, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (191, 1, 10, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (192, 1, 10, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (193, 1, 10, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (194, 1, 10, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (195, 1, 10, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (196, 1, 10, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (197, 1, 10, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (199, 1, 10, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (200, 1, 10, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (201, 1, 10, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (204, 1, 10, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (205, 1, 10, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (206, 1, 10, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (207, 1, 10, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (208, 1, 10, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (209, 1, 10, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (210, 1, 10, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (211, 1, 11, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (212, 1, 11, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (213, 1, 11, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (214, 1, 11, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (215, 1, 11, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (216, 1, 11, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (217, 1, 11, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (218, 1, 11, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (219, 1, 11, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (220, 1, 11, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (221, 1, 11, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (222, 1, 11, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (223, 1, 11, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (224, 1, 11, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (225, 1, 11, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (226, 1, 11, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (227, 1, 11, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (228, 1, 11, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (229, 1, 11, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (230, 1, 11, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (231, 2, 1, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (232, 2, 1, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (233, 2, 1, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (234, 2, 1, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (235, 2, 1, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (236, 2, 1, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (237, 2, 1, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (238, 2, 1, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (239, 2, 1, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (240, 2, 1, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (242, 2, 1, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (243, 2, 1, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (244, 2, 1, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (245, 2, 1, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (246, 2, 1, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (247, 2, 1, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (248, 2, 1, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (249, 2, 1, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (250, 2, 1, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (251, 2, 2, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (252, 2, 2, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (253, 2, 2, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (254, 2, 2, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (255, 2, 2, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (256, 2, 2, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (257, 2, 2, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (258, 2, 2, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (259, 2, 2, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (260, 2, 2, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (261, 2, 2, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (262, 2, 2, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (263, 2, 2, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (264, 2, 2, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (265, 2, 2, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (266, 2, 2, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (267, 2, 2, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (268, 2, 2, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (269, 2, 2, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (270, 2, 2, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (271, 2, 3, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (272, 2, 3, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (273, 2, 3, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (274, 2, 3, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (275, 2, 3, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (276, 2, 3, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (277, 2, 3, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (278, 2, 3, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (282, 2, 3, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (202, 1, 10, 12, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (281, 2, 3, 11, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (160, 1, 8, 10, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (161, 1, 8, 11, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (162, 1, 8, 12, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (186, 1, 9, 16, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (163, 1, 8, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (179, 1, 9, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (280, 2, 3, 10, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (279, 2, 3, 9, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (198, 1, 10, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (173, 1, 9, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (174, 1, 9, 4, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (283, 2, 3, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (284, 2, 3, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (285, 2, 3, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (290, 2, 3, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (291, 2, 4, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (292, 2, 4, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (295, 2, 4, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (296, 2, 4, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (297, 2, 4, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (298, 2, 4, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (299, 2, 4, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (300, 2, 4, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (301, 2, 4, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (302, 2, 4, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (303, 2, 4, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (304, 2, 4, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (305, 2, 4, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (306, 2, 4, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (308, 2, 4, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (309, 2, 4, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (310, 2, 4, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (311, 2, 5, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (312, 2, 5, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (313, 2, 5, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (314, 2, 5, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (315, 2, 5, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (316, 2, 5, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (317, 2, 5, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (324, 2, 5, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (325, 2, 5, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (326, 2, 5, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (327, 2, 5, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (328, 2, 5, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (329, 2, 5, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (330, 2, 5, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (331, 2, 6, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (332, 2, 6, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (333, 2, 6, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (334, 2, 6, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (335, 2, 6, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (336, 2, 6, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (337, 2, 6, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (338, 2, 6, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (339, 2, 6, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (340, 2, 6, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (341, 2, 6, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (342, 2, 6, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (347, 2, 6, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (348, 2, 6, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (349, 2, 6, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (350, 2, 6, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (351, 2, 7, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (352, 2, 7, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (353, 2, 7, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (354, 2, 7, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (355, 2, 7, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (356, 2, 7, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (357, 2, 7, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (358, 2, 7, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (359, 2, 7, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (363, 2, 7, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (364, 2, 7, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (365, 2, 7, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (366, 2, 7, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (367, 2, 7, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (368, 2, 7, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (369, 2, 7, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (370, 2, 7, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (371, 2, 8, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (372, 2, 8, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (373, 2, 8, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (374, 2, 8, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (375, 2, 8, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (376, 2, 8, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (377, 2, 8, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (378, 2, 8, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (379, 2, 8, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (381, 2, 8, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (382, 2, 8, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (383, 2, 8, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (384, 2, 8, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (385, 2, 8, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (386, 2, 8, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (387, 2, 8, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (388, 2, 8, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (389, 2, 8, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (390, 2, 8, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (391, 3, 1, 1, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (392, 3, 1, 2, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (393, 3, 1, 3, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (394, 3, 1, 4, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (395, 3, 1, 5, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (396, 3, 1, 6, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (397, 3, 1, 7, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (398, 3, 1, 8, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (399, 3, 1, 9, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (400, 3, 1, 10, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (401, 3, 1, 11, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (402, 3, 1, 12, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (403, 3, 1, 13, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (404, 3, 1, 14, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (405, 3, 1, 15, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (411, 3, 2, 1, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (412, 3, 2, 2, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (413, 3, 2, 3, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (414, 3, 2, 4, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (415, 3, 2, 5, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (416, 3, 2, 6, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (417, 3, 2, 7, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (418, 3, 2, 8, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (419, 3, 2, 9, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (420, 3, 2, 10, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (421, 3, 2, 11, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (422, 3, 2, 12, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (423, 3, 2, 13, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (286, 2, 3, 16, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (293, 2, 4, 3, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (361, 2, 7, 11, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (362, 2, 7, 12, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (318, 2, 5, 8, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (319, 2, 5, 9, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (307, 2, 4, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (320, 2, 5, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (294, 2, 4, 4, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (323, 2, 5, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (343, 2, 6, 13, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (344, 2, 6, 14, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (345, 2, 6, 15, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (346, 2, 6, 16, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (380, 2, 8, 10, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (288, 2, 3, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (289, 2, 3, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (424, 3, 2, 14, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (425, 3, 2, 15, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (431, 3, 3, 1, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (432, 3, 3, 2, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (433, 3, 3, 3, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (434, 3, 3, 4, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (435, 3, 3, 5, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (438, 3, 3, 8, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (441, 3, 3, 11, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (442, 3, 3, 12, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (443, 3, 3, 13, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (444, 3, 3, 14, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (445, 3, 3, 15, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (451, 3, 4, 1, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (452, 3, 4, 2, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (453, 3, 4, 3, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (454, 3, 4, 4, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (455, 3, 4, 5, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (456, 3, 4, 6, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (460, 3, 4, 10, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (461, 3, 4, 11, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (462, 3, 4, 12, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (463, 3, 4, 13, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (464, 3, 4, 14, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (465, 3, 4, 15, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (471, 3, 5, 1, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (472, 3, 5, 2, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (473, 3, 5, 3, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (474, 3, 5, 4, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (475, 3, 5, 5, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (476, 3, 5, 6, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (477, 3, 5, 7, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (479, 3, 5, 9, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (480, 3, 5, 10, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (481, 3, 5, 11, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (482, 3, 5, 12, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (483, 3, 5, 13, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (484, 3, 5, 14, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (485, 3, 5, 15, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (491, 3, 6, 1, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (492, 3, 6, 2, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (493, 3, 6, 3, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (495, 3, 6, 5, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (496, 3, 6, 6, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (498, 3, 6, 8, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (499, 3, 6, 9, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (500, 3, 6, 10, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (501, 3, 6, 11, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (502, 3, 6, 12, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (503, 3, 6, 13, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (511, 3, 7, 1, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (512, 3, 7, 2, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (513, 3, 7, 3, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (514, 3, 7, 4, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (515, 3, 7, 5, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (518, 3, 7, 8, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (519, 3, 7, 9, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (600, 3, 7, 10, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (601, 3, 7, 11, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (602, 3, 7, 12, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (603, 3, 7, 13, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (604, 3, 7, 14, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (605, 3, 7, 15, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (612, 4, 1, 2, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (613, 4, 1, 3, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (614, 4, 1, 4, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (615, 4, 1, 5, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (616, 4, 1, 6, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (617, 4, 1, 7, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (618, 4, 1, 8, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (619, 4, 1, 9, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (620, 4, 1, 10, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (621, 4, 1, 11, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (622, 4, 1, 12, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (623, 4, 1, 13, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (624, 4, 1, 14, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (631, 4, 2, 1, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (632, 4, 2, 2, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (633, 4, 2, 3, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (634, 4, 2, 4, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (635, 4, 2, 5, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (636, 4, 2, 6, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (637, 4, 2, 7, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (638, 4, 2, 8, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (639, 4, 2, 9, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (640, 4, 2, 10, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (641, 4, 2, 11, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (642, 4, 2, 12, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (643, 4, 2, 13, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (644, 4, 2, 14, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (645, 4, 2, 15, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (651, 4, 3, 1, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (652, 4, 3, 2, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (653, 4, 3, 3, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (654, 4, 3, 4, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (655, 4, 3, 5, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (656, 4, 3, 6, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (659, 4, 3, 9, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (660, 4, 3, 10, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (661, 4, 3, 11, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (662, 4, 3, 12, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (663, 4, 3, 13, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (664, 4, 3, 14, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (665, 4, 3, 15, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (671, 4, 4, 1, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (672, 4, 4, 2, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (673, 4, 4, 3, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (674, 4, 4, 4, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (675, 4, 4, 5, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (676, 4, 4, 6, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (680, 4, 4, 10, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (681, 4, 4, 11, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (682, 4, 4, 12, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (683, 4, 4, 13, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (684, 4, 4, 14, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (625, 4, 1, 15, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (497, 3, 6, 7, 'sales', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (504, 3, 6, 14, 'sales', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (517, 3, 7, 7, 'sales', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (494, 3, 6, 4, 'sales', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (657, 4, 3, 7, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (658, 4, 3, 8, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (677, 4, 4, 7, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (678, 4, 4, 8, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (679, 4, 4, 9, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (611, 4, 1, 1, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (436, 3, 3, 6, 'sales', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (437, 3, 3, 7, 'sales', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (457, 3, 4, 7, 'sales', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (439, 3, 3, 9, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (459, 3, 4, 9, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (685, 4, 4, 15, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (691, 4, 5, 1, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (692, 4, 5, 2, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (693, 4, 5, 3, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (694, 4, 5, 4, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (695, 4, 5, 5, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (697, 4, 5, 7, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (698, 4, 5, 8, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (699, 4, 5, 9, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (700, 4, 5, 10, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (701, 4, 5, 11, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (702, 4, 5, 12, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (703, 4, 5, 13, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (704, 4, 5, 14, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (705, 4, 5, 15, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (711, 4, 6, 1, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (712, 4, 6, 2, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (713, 4, 6, 3, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (714, 4, 6, 4, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (715, 4, 6, 5, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (716, 4, 6, 6, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (717, 4, 6, 7, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (720, 4, 6, 10, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (721, 4, 6, 11, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (722, 4, 6, 12, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (723, 4, 6, 13, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (724, 4, 6, 14, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (725, 4, 6, 15, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (731, 4, 7, 1, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (732, 4, 7, 2, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (733, 4, 7, 3, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (734, 4, 7, 4, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (735, 4, 7, 5, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (736, 4, 7, 6, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (737, 4, 7, 7, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (738, 4, 7, 8, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (739, 4, 7, 9, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (740, 4, 7, 10, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (741, 4, 7, 11, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (742, 4, 7, 12, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (743, 4, 7, 13, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (744, 4, 7, 14, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (745, 4, 7, 15, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (751, 5, 1, 1, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (752, 5, 1, 2, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (753, 5, 1, 3, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (754, 5, 1, 4, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (755, 5, 1, 5, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (756, 5, 1, 6, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (757, 5, 1, 7, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (758, 5, 1, 8, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (759, 5, 1, 9, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (760, 5, 1, 10, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (761, 5, 1, 11, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (762, 5, 1, 12, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (763, 5, 1, 13, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (764, 5, 1, 14, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (765, 5, 1, 15, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (771, 5, 2, 1, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (772, 5, 2, 2, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (773, 5, 2, 3, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (774, 5, 2, 4, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (775, 5, 2, 5, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (776, 5, 2, 6, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (781, 5, 2, 11, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (782, 5, 2, 12, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (783, 5, 2, 13, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (784, 5, 2, 14, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (785, 5, 2, 15, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (791, 5, 3, 1, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (792, 5, 3, 2, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (793, 5, 3, 3, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (794, 5, 3, 4, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (795, 5, 3, 5, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (796, 5, 3, 6, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (797, 5, 3, 7, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (798, 5, 3, 8, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (799, 5, 3, 9, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (800, 5, 3, 10, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (801, 5, 3, 11, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (802, 5, 3, 12, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (803, 5, 3, 13, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (811, 5, 4, 1, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (812, 5, 4, 2, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (813, 5, 4, 3, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (814, 5, 4, 4, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (815, 5, 4, 5, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (819, 5, 4, 9, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (820, 5, 4, 10, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (821, 5, 4, 11, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (822, 5, 4, 12, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (823, 5, 4, 13, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (824, 5, 4, 14, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (825, 5, 4, 15, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (831, 5, 5, 1, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (832, 5, 5, 2, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (833, 5, 5, 3, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (834, 5, 5, 4, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (835, 5, 5, 5, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (836, 5, 5, 6, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (840, 5, 5, 10, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (841, 5, 5, 11, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (842, 5, 5, 12, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (844, 5, 5, 14, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (845, 5, 5, 15, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (851, 5, 6, 1, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (852, 5, 6, 2, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (853, 5, 6, 3, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (854, 5, 6, 4, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (860, 5, 6, 10, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (861, 5, 6, 11, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (862, 5, 6, 12, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (863, 5, 6, 13, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (864, 5, 6, 14, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (865, 5, 6, 15, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (719, 4, 6, 9, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (816, 5, 4, 6, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (818, 5, 4, 8, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (839, 5, 5, 9, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (843, 5, 5, 13, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (856, 5, 6, 6, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (855, 5, 6, 5, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (805, 5, 3, 15, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (804, 5, 3, 14, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (696, 4, 5, 6, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (837, 5, 5, 7, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (780, 5, 2, 10, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (838, 5, 5, 8, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (779, 5, 2, 9, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (857, 5, 6, 7, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (778, 5, 2, 8, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (777, 5, 2, 7, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (871, 5, 7, 1, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (872, 5, 7, 2, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (873, 5, 7, 3, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (874, 5, 7, 4, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (875, 5, 7, 5, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (876, 5, 7, 6, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (880, 5, 7, 10, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (881, 5, 7, 11, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (882, 5, 7, 12, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (883, 5, 7, 13, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (884, 5, 7, 14, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (885, 5, 7, 15, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (891, 5, 8, 1, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (892, 5, 8, 2, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (893, 5, 8, 3, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (894, 5, 8, 4, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (895, 5, 8, 5, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (896, 5, 8, 6, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (897, 5, 8, 7, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (898, 5, 8, 8, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (899, 5, 8, 9, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (900, 5, 8, 10, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (901, 5, 8, 11, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (902, 5, 8, 12, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (911, 5, 9, 1, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (912, 5, 9, 2, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (913, 5, 9, 3, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (914, 5, 9, 4, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (915, 5, 9, 5, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (916, 5, 9, 6, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (917, 5, 9, 7, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (920, 5, 9, 10, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (921, 5, 9, 11, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (922, 5, 9, 12, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (923, 5, 9, 13, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (924, 5, 9, 14, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (925, 5, 9, 15, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (931, 5, 10, 1, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (932, 5, 10, 2, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (933, 5, 10, 3, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (934, 5, 10, 4, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (935, 5, 10, 5, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (936, 5, 10, 6, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (937, 5, 10, 7, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (938, 5, 10, 8, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (939, 5, 10, 9, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (940, 5, 10, 10, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (941, 5, 10, 11, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (942, 5, 10, 12, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (943, 5, 10, 13, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (944, 5, 10, 14, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (945, 5, 10, 15, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (951, 6, 1, 1, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (952, 6, 1, 2, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (953, 6, 1, 3, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (954, 6, 1, 4, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (955, 6, 1, 5, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (956, 6, 1, 6, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (957, 6, 1, 7, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (958, 6, 1, 8, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (959, 6, 1, 9, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (960, 6, 1, 10, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (961, 6, 1, 11, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (962, 6, 1, 12, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (966, 6, 1, 16, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (967, 6, 1, 17, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (968, 6, 1, 18, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (969, 6, 1, 19, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (971, 6, 2, 1, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (972, 6, 2, 2, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (973, 6, 2, 3, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (974, 6, 2, 4, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (975, 6, 2, 5, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (976, 6, 2, 6, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (977, 6, 2, 7, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (978, 6, 2, 8, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (979, 6, 2, 9, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (980, 6, 2, 10, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (982, 6, 2, 12, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (983, 6, 2, 13, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (984, 6, 2, 14, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (987, 6, 2, 17, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (988, 6, 2, 18, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (989, 6, 2, 19, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (991, 6, 3, 1, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (992, 6, 3, 2, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (993, 6, 3, 3, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (994, 6, 3, 4, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (995, 6, 3, 5, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (996, 6, 3, 6, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (997, 6, 3, 7, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (998, 6, 3, 8, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (999, 6, 3, 9, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1000, 6, 3, 10, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1001, 6, 3, 11, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1002, 6, 3, 12, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1003, 6, 3, 13, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1004, 6, 3, 14, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1005, 6, 3, 15, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1006, 6, 3, 16, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1007, 6, 3, 17, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1008, 6, 3, 18, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1009, 6, 3, 19, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1011, 6, 4, 1, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1012, 6, 4, 2, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1013, 6, 4, 3, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1014, 6, 4, 4, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1015, 6, 4, 5, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1016, 6, 4, 6, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1017, 6, 4, 7, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1018, 6, 4, 8, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1019, 6, 4, 9, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1022, 6, 4, 12, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1023, 6, 4, 13, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1024, 6, 4, 14, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1026, 6, 4, 16, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1027, 6, 4, 17, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1028, 6, 4, 18, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1029, 6, 4, 19, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (964, 6, 1, 14, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (981, 6, 2, 11, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (986, 6, 2, 16, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (877, 5, 7, 7, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (878, 5, 7, 8, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (879, 5, 7, 9, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (903, 5, 8, 13, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (904, 5, 8, 14, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (905, 5, 8, 15, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (918, 5, 9, 8, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (919, 5, 9, 9, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (965, 6, 1, 15, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1021, 6, 4, 11, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1020, 6, 4, 10, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1025, 6, 4, 15, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1031, 6, 5, 1, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1032, 6, 5, 2, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1033, 6, 5, 3, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1035, 6, 5, 5, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1036, 6, 5, 6, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1037, 6, 5, 7, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1038, 6, 5, 8, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1040, 6, 5, 10, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1041, 6, 5, 11, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1044, 6, 5, 14, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1045, 6, 5, 15, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1046, 6, 5, 16, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1047, 6, 5, 17, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1051, 6, 6, 1, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1052, 6, 6, 2, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1053, 6, 6, 3, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1054, 6, 6, 4, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1055, 6, 6, 5, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1056, 6, 6, 6, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1057, 6, 6, 7, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1058, 6, 6, 8, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1059, 6, 6, 9, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1060, 6, 6, 10, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1061, 6, 6, 11, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1063, 6, 6, 13, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1064, 6, 6, 14, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1065, 6, 6, 15, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1066, 6, 6, 16, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1067, 6, 6, 17, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1068, 6, 6, 18, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1069, 6, 6, 19, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1070, 6, 7, 1, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1071, 6, 7, 2, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1072, 6, 7, 3, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1073, 6, 7, 4, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1074, 6, 7, 5, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1081, 6, 7, 11, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1082, 6, 7, 12, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1083, 6, 7, 13, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1084, 6, 7, 14, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1085, 6, 7, 15, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1086, 6, 7, 16, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1087, 6, 7, 17, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1088, 6, 7, 18, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1089, 6, 7, 19, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1090, 6, 8, 1, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1091, 6, 8, 2, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1092, 6, 8, 3, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1093, 6, 8, 4, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1097, 6, 8, 8, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1098, 6, 8, 9, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1099, 6, 8, 10, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1101, 6, 8, 11, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1102, 6, 8, 12, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1103, 6, 8, 13, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1104, 6, 8, 14, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1105, 6, 8, 15, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1106, 6, 8, 16, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1107, 6, 8, 17, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1108, 6, 8, 18, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1109, 6, 8, 19, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1111, 6, 9, 1, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1112, 6, 9, 2, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1113, 6, 9, 3, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1114, 6, 9, 4, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1115, 6, 9, 5, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1116, 6, 9, 6, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1117, 6, 9, 7, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1118, 6, 9, 8, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1119, 6, 9, 9, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1120, 6, 9, 10, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1121, 6, 9, 11, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1122, 6, 9, 12, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1123, 6, 9, 13, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1124, 6, 9, 14, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1125, 6, 9, 15, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1126, 6, 9, 16, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1127, 6, 9, 17, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1128, 6, 9, 18, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1129, 6, 9, 19, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1130, 7, 1, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1131, 7, 1, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1132, 7, 1, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1133, 7, 1, 4, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1134, 7, 1, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1135, 7, 1, 6, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1136, 7, 1, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1137, 7, 1, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1138, 7, 1, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1139, 7, 1, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1140, 7, 2, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1141, 7, 2, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1142, 7, 2, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1143, 7, 2, 4, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1144, 7, 2, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1145, 7, 2, 6, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1146, 7, 2, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1147, 7, 2, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1148, 7, 2, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1149, 7, 2, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1150, 7, 3, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1151, 7, 3, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1152, 7, 3, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1153, 7, 3, 4, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1154, 7, 3, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1156, 7, 3, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1157, 7, 3, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1158, 7, 3, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1159, 7, 3, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1160, 7, 4, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1161, 7, 4, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1162, 7, 4, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1163, 7, 4, 4, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1167, 7, 4, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1168, 7, 4, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1169, 7, 4, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1170, 7, 5, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1048, 6, 5, 18, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1034, 6, 5, 4, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1049, 6, 5, 19, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1062, 6, 6, 12, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1043, 6, 5, 13, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1076, 6, 7, 7, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1077, 6, 7, 8, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1079, 6, 7, 9, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1080, 6, 7, 10, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1075, 6, 7, 6, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1094, 6, 8, 5, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1095, 6, 8, 6, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1096, 6, 8, 7, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1155, 7, 3, 6, 'blocked', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1164, 7, 4, 5, 'sales', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1171, 7, 5, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1172, 7, 5, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1178, 7, 5, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1179, 7, 5, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1180, 7, 6, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1181, 7, 6, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1182, 7, 6, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1183, 7, 6, 4, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1184, 7, 6, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1185, 7, 6, 6, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1186, 7, 6, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1187, 7, 6, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1188, 7, 6, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1189, 7, 6, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1190, 7, 7, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1191, 7, 7, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1192, 7, 7, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1193, 7, 7, 4, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1196, 7, 7, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1197, 7, 7, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1198, 7, 7, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1199, 7, 7, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1200, 7, 8, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1201, 7, 8, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1202, 7, 8, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1207, 7, 8, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1208, 7, 8, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1209, 7, 8, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1210, 8, 1, 1, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1211, 8, 1, 2, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1212, 8, 1, 3, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1213, 8, 1, 4, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1214, 8, 1, 5, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1215, 8, 1, 6, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1216, 8, 1, 7, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1217, 8, 1, 8, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1218, 8, 1, 9, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1219, 8, 1, 10, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1220, 8, 2, 1, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1221, 8, 2, 2, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1222, 8, 2, 3, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1223, 8, 2, 4, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1224, 8, 2, 5, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1225, 8, 2, 6, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1226, 8, 2, 7, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1227, 8, 2, 8, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1228, 8, 2, 9, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1229, 8, 2, 10, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1230, 8, 3, 1, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1231, 8, 3, 2, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1232, 8, 3, 3, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1237, 8, 3, 8, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1238, 8, 3, 9, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1239, 8, 3, 10, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1240, 8, 4, 1, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1241, 8, 4, 2, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1249, 8, 4, 10, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1250, 8, 5, 1, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1251, 8, 5, 2, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1252, 8, 5, 3, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1253, 8, 5, 4, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1256, 8, 5, 7, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1257, 8, 5, 8, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1258, 8, 5, 9, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1259, 8, 5, 10, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1260, 8, 6, 1, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1261, 8, 6, 2, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1262, 8, 6, 3, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1265, 8, 6, 6, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1266, 8, 6, 7, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1267, 8, 6, 8, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1268, 8, 6, 9, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1269, 8, 6, 10, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (61, 1, 4, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (505, 3, 6, 15, 'sales', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (203, 1, 10, 13, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (287, 2, 3, 17, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (516, 3, 7, 6, 'sales', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (718, 4, 6, 8, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (817, 5, 4, 7, 'sales', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1194, 7, 7, 5, 'sales', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1195, 7, 7, 6, 'sales', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1203, 7, 8, 4, 'sales', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1248, 8, 4, 9, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1246, 8, 4, 7, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1235, 8, 3, 6, 'sales', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1039, 6, 5, 9, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (963, 6, 1, 13, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (985, 6, 2, 15, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (360, 2, 7, 10, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (241, 2, 1, 11, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1255, 8, 5, 6, 'sales', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1254, 8, 5, 5, 'sales', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1042, 6, 5, 12, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1234, 8, 3, 5, 'sales', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1243, 8, 4, 4, 'sales', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1205, 7, 8, 6, 'sales', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1206, 7, 8, 7, 'sales', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1173, 7, 5, 4, 'blocked', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1174, 7, 5, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1175, 7, 5, 6, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1264, 8, 6, 5, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1263, 8, 6, 4, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1204, 7, 8, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (90, 1, 5, 10, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1176, 7, 5, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1236, 8, 3, 7, 'sales', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1247, 8, 4, 8, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1244, 8, 4, 5, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1245, 8, 4, 6, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1233, 8, 3, 4, 'sales', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1242, 8, 4, 3, 'sales', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1177, 7, 5, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1270, 9, 1, 1, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1271, 9, 1, 2, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1272, 9, 1, 3, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1273, 9, 1, 4, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1274, 9, 1, 5, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1275, 9, 1, 6, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1276, 9, 1, 7, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1277, 9, 1, 8, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1278, 9, 1, 9, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1279, 9, 1, 10, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1280, 9, 2, 1, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1281, 9, 2, 2, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1282, 9, 2, 3, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1283, 9, 2, 4, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1284, 9, 2, 5, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1285, 9, 2, 6, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1286, 9, 2, 7, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1287, 9, 2, 8, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1288, 9, 2, 9, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1289, 9, 2, 10, 'sales', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1290, 9, 3, 1, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1291, 9, 3, 2, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1292, 9, 3, 3, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1293, 9, 3, 4, 'sales', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1294, 9, 3, 5, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1295, 9, 3, 6, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1296, 9, 3, 7, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1297, 9, 3, 8, 'sales', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1298, 9, 3, 9, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1299, 9, 3, 10, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1300, 9, 4, 1, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1301, 9, 4, 2, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1302, 9, 4, 3, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1303, 9, 4, 4, 'sales', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1304, 9, 4, 5, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1305, 9, 4, 6, 'sales', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1306, 9, 4, 7, 'sales', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1307, 9, 4, 8, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1308, 9, 4, 9, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1310, 9, 5, 1, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1311, 9, 5, 2, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1312, 9, 5, 3, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1313, 9, 5, 4, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1314, 9, 5, 5, 'sales', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1315, 9, 5, 6, 'sales', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1316, 9, 5, 7, 'sales', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1317, 9, 5, 8, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1318, 9, 5, 9, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1319, 9, 5, 10, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1320, 9, 6, 1, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1321, 9, 6, 2, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1322, 9, 6, 3, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1325, 9, 6, 6, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1326, 9, 6, 7, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1327, 9, 6, 8, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1328, 9, 6, 9, 'sales', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1329, 9, 6, 10, 'sales', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1323, 9, 6, 4, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (440, 3, 3, 10, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (478, 3, 5, 8, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (88, 1, 5, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (110, 1, 6, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (89, 1, 5, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (458, 3, 4, 8, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (130, 1, 7, 10, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (322, 2, 5, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1324, 9, 6, 5, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (94, 1, 5, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (321, 2, 5, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1309, 9, 4, 10, 'free', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (180, 1, 9, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1331, 10, 1, 1, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1332, 10, 1, 2, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1333, 10, 1, 3, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1334, 10, 1, 4, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1335, 10, 1, 5, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1336, 10, 1, 6, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1337, 10, 1, 7, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1338, 10, 1, 8, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1339, 10, 1, 9, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1340, 10, 1, 10, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1341, 10, 1, 11, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1342, 10, 1, 12, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1343, 10, 1, 13, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1344, 10, 1, 14, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1345, 10, 1, 15, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1346, 10, 2, 1, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1347, 10, 2, 2, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1348, 10, 2, 3, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1349, 10, 2, 4, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1350, 10, 2, 5, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1351, 10, 2, 6, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1352, 10, 2, 7, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1353, 10, 2, 8, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1354, 10, 2, 9, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1355, 10, 2, 10, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1356, 10, 2, 11, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1357, 10, 2, 12, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1358, 10, 2, 13, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1359, 10, 2, 14, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1360, 10, 2, 15, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1366, 10, 3, 1, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1367, 10, 3, 2, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1368, 10, 3, 3, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1369, 10, 3, 4, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1370, 10, 3, 5, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1371, 10, 3, 6, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1372, 10, 3, 7, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1373, 10, 3, 8, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1374, 10, 3, 9, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1375, 10, 3, 10, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1376, 10, 3, 11, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1377, 10, 3, 12, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1378, 10, 3, 13, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1379, 10, 3, 14, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1380, 10, 3, 15, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1386, 10, 4, 1, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1387, 10, 4, 2, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1388, 10, 4, 3, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1389, 10, 4, 4, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1390, 10, 4, 5, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1391, 10, 4, 6, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1392, 10, 4, 7, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1396, 10, 4, 11, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1397, 10, 4, 12, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1398, 10, 4, 13, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1399, 10, 4, 14, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1400, 10, 4, 15, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1406, 10, 5, 1, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1407, 10, 5, 2, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1408, 10, 5, 3, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1409, 10, 5, 4, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1410, 10, 5, 5, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1411, 10, 5, 6, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1416, 10, 5, 11, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1417, 10, 5, 12, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1418, 10, 5, 13, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1419, 10, 5, 14, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1420, 10, 5, 15, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1426, 10, 6, 1, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1427, 10, 6, 2, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1428, 10, 6, 3, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1429, 10, 6, 4, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1430, 10, 6, 5, 'sales', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1431, 10, 6, 6, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1432, 10, 6, 7, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1433, 10, 6, 8, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1434, 10, 6, 9, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1435, 10, 6, 10, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1436, 10, 6, 11, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1437, 10, 6, 12, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1438, 10, 6, 13, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1439, 10, 6, 14, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1440, 10, 6, 15, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1446, 10, 7, 1, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1447, 10, 7, 2, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1448, 10, 7, 3, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1449, 10, 7, 4, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1450, 10, 7, 5, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1451, 10, 7, 6, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1452, 10, 7, 7, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1453, 10, 7, 8, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1454, 10, 7, 9, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1455, 10, 7, 10, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1456, 10, 7, 11, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1457, 10, 7, 12, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1458, 10, 7, 13, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1459, 10, 7, 14, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1460, 10, 7, 15, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1531, 11, 1, 1, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1532, 11, 1, 2, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1533, 11, 1, 3, 'sales', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1534, 11, 1, 4, 'sales', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1535, 11, 1, 5, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1536, 11, 1, 6, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1537, 11, 1, 7, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1538, 11, 1, 8, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1539, 11, 1, 9, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1540, 11, 1, 10, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1541, 11, 1, 11, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1542, 11, 1, 12, 'sales', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1543, 11, 1, 13, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1544, 11, 1, 14, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1545, 11, 1, 15, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1546, 11, 2, 1, 'sales', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1547, 11, 2, 2, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1548, 11, 2, 3, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1549, 11, 2, 4, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1550, 11, 2, 5, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1551, 11, 2, 6, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1552, 11, 2, 7, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1553, 11, 2, 8, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1554, 11, 2, 9, 'sales', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1555, 11, 2, 10, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1556, 11, 2, 11, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1557, 11, 2, 12, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1558, 11, 2, 13, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1559, 11, 2, 14, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1560, 11, 2, 15, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1566, 11, 3, 1, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1567, 11, 3, 2, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1568, 11, 3, 3, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1569, 11, 3, 4, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1570, 11, 3, 5, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1571, 11, 3, 6, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1572, 11, 3, 7, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1573, 11, 3, 8, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1574, 11, 3, 9, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1575, 11, 3, 10, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1576, 11, 3, 11, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1577, 11, 3, 12, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1578, 11, 3, 13, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1579, 11, 3, 14, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1580, 11, 3, 15, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1586, 11, 4, 1, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1587, 11, 4, 2, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1588, 11, 4, 3, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1589, 11, 4, 4, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1590, 11, 4, 5, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1591, 11, 4, 6, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1592, 11, 4, 7, 'sales', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1593, 11, 4, 8, 'sales', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1594, 11, 4, 9, 'sales', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1595, 11, 4, 10, 'sales', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1597, 11, 4, 12, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1598, 11, 4, 13, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1599, 11, 4, 14, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1596, 11, 4, 11, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1412, 10, 5, 7, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1413, 10, 5, 8, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1415, 10, 5, 10, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1414, 10, 5, 9, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1600, 11, 4, 15, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1606, 11, 5, 1, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1607, 11, 5, 2, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1608, 11, 5, 3, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1609, 11, 5, 4, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1610, 11, 5, 5, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1611, 11, 5, 6, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1612, 11, 5, 7, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1613, 11, 5, 8, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1614, 11, 5, 9, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1615, 11, 5, 10, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1616, 11, 5, 11, 'sales', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1617, 11, 5, 12, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1618, 11, 5, 13, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1619, 11, 5, 14, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1620, 11, 5, 15, 'sales', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1626, 11, 6, 1, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1627, 11, 6, 2, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1628, 11, 6, 3, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1629, 11, 6, 4, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1630, 11, 6, 5, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1631, 11, 6, 6, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1632, 11, 6, 7, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1633, 11, 6, 8, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1634, 11, 6, 9, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1635, 11, 6, 10, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1636, 11, 6, 11, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1637, 11, 6, 12, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1638, 11, 6, 13, 'sales', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1639, 11, 6, 14, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1640, 11, 6, 15, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1646, 11, 7, 1, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1647, 11, 7, 2, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1648, 11, 7, 3, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1649, 11, 7, 4, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1650, 11, 7, 5, 'sales', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1651, 11, 7, 6, 'sales', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1652, 11, 7, 7, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1653, 11, 7, 8, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1654, 11, 7, 9, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1655, 11, 7, 10, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1656, 11, 7, 11, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1657, 11, 7, 12, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1658, 11, 7, 13, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1659, 11, 7, 14, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1660, 11, 7, 15, 'free', 420);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1730, 12, 1, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1731, 12, 1, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1732, 12, 1, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1733, 12, 1, 4, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1734, 12, 1, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1735, 12, 1, 6, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1736, 12, 1, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1737, 12, 1, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1738, 12, 1, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1739, 12, 1, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1740, 12, 2, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1741, 12, 2, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1742, 12, 2, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1743, 12, 2, 4, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1744, 12, 2, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1745, 12, 2, 6, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1746, 12, 2, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1747, 12, 2, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1748, 12, 2, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1749, 12, 2, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1750, 12, 3, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1751, 12, 3, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1752, 12, 3, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1753, 12, 3, 4, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1754, 12, 3, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1755, 12, 3, 6, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1756, 12, 3, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1757, 12, 3, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1758, 12, 3, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1759, 12, 3, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1760, 12, 4, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1761, 12, 4, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1762, 12, 4, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1763, 12, 4, 4, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1764, 12, 4, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1765, 12, 4, 6, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1766, 12, 4, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1767, 12, 4, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1768, 12, 4, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1769, 12, 4, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1770, 12, 5, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1771, 12, 5, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1772, 12, 5, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1773, 12, 5, 4, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1774, 12, 5, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1775, 12, 5, 6, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1776, 12, 5, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1777, 12, 5, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1778, 12, 5, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1779, 12, 5, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1780, 12, 6, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1781, 12, 6, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1782, 12, 6, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1783, 12, 6, 4, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1784, 12, 6, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1785, 12, 6, 6, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1786, 12, 6, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1787, 12, 6, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1788, 12, 6, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1789, 12, 6, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1790, 12, 7, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1791, 12, 7, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1792, 12, 7, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1793, 12, 7, 4, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1794, 12, 7, 5, 'sales', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1795, 12, 7, 6, 'sales', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1796, 12, 7, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1797, 12, 7, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1798, 12, 7, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1799, 12, 7, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1800, 12, 8, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1801, 12, 8, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1802, 12, 8, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1803, 12, 8, 4, 'sales', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1804, 12, 8, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1805, 12, 8, 6, 'sales', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1806, 12, 8, 7, 'sales', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1807, 12, 8, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1808, 12, 8, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1809, 12, 8, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1830, 17, 1, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (859, 5, 6, 9, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (858, 5, 6, 8, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1831, 17, 1, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1832, 17, 1, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1833, 17, 1, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1395, 10, 4, 10, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1834, 17, 1, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1835, 17, 1, 6, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1836, 17, 1, 7, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1837, 17, 1, 8, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1838, 17, 1, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1839, 17, 1, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1840, 17, 2, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1841, 17, 2, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1842, 17, 2, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1843, 17, 2, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1844, 17, 2, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1845, 17, 2, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1846, 17, 2, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1847, 17, 2, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1848, 17, 2, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1849, 17, 2, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1850, 17, 3, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1851, 17, 3, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1852, 17, 3, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1857, 17, 3, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1858, 17, 3, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1859, 17, 3, 10, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1860, 17, 4, 1, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1861, 17, 4, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1862, 17, 4, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1863, 17, 4, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1864, 17, 4, 5, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1865, 17, 4, 6, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1866, 17, 4, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1867, 17, 4, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1868, 17, 4, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1869, 17, 4, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1870, 17, 5, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1871, 17, 5, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1872, 17, 5, 3, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1873, 17, 5, 4, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1874, 17, 5, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1875, 17, 5, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1876, 17, 5, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1877, 17, 5, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1878, 17, 5, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1879, 17, 5, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1880, 17, 6, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1881, 17, 6, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1882, 17, 6, 3, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1883, 17, 6, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1884, 17, 6, 5, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1885, 17, 6, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1886, 17, 6, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1887, 17, 6, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1888, 17, 6, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1889, 17, 6, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1930, 18, 1, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1931, 18, 1, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1932, 18, 1, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1933, 18, 1, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1934, 18, 1, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1935, 18, 1, 6, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1937, 18, 1, 8, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1938, 18, 1, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1939, 18, 1, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1940, 18, 2, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1941, 18, 2, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1942, 18, 2, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1943, 18, 2, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1944, 18, 2, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1945, 18, 2, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1947, 18, 2, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1948, 18, 2, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1949, 18, 2, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1950, 18, 3, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1951, 18, 3, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1952, 18, 3, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1957, 18, 3, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1958, 18, 3, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1959, 18, 3, 10, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1960, 18, 4, 1, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1961, 18, 4, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1962, 18, 4, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1963, 18, 4, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1965, 18, 4, 6, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1966, 18, 4, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1967, 18, 4, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1968, 18, 4, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1969, 18, 4, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1970, 18, 5, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1971, 18, 5, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1972, 18, 5, 3, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1973, 18, 5, 4, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1976, 18, 5, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1977, 18, 5, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1979, 18, 5, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1980, 18, 6, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1981, 18, 6, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1982, 18, 6, 3, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1984, 18, 6, 5, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1987, 18, 6, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1988, 18, 6, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1989, 18, 6, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2030, 19, 1, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2031, 19, 1, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2032, 19, 1, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2033, 19, 1, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2034, 19, 1, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2036, 19, 1, 7, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2037, 19, 1, 8, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2038, 19, 1, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2039, 19, 1, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2040, 19, 2, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2041, 19, 2, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2044, 19, 2, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2045, 19, 2, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2046, 19, 2, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2047, 19, 2, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2048, 19, 2, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2049, 19, 2, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1954, 18, 3, 5, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1953, 18, 3, 4, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1974, 18, 5, 5, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1978, 18, 5, 9, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1964, 18, 4, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1983, 18, 6, 4, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1975, 18, 5, 6, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2035, 19, 1, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2042, 19, 2, 3, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2043, 19, 2, 4, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1955, 18, 3, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1853, 17, 3, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1854, 17, 3, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1985, 18, 6, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1986, 18, 6, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2050, 19, 3, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2051, 19, 3, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2052, 19, 3, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2057, 19, 3, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2058, 19, 3, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2059, 19, 3, 10, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2060, 19, 4, 1, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2061, 19, 4, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2063, 19, 4, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2064, 19, 4, 5, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2065, 19, 4, 6, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2067, 19, 4, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2068, 19, 4, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2069, 19, 4, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2070, 19, 5, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2071, 19, 5, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2072, 19, 5, 3, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2073, 19, 5, 4, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2075, 19, 5, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2076, 19, 5, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2078, 19, 5, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2079, 19, 5, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2080, 19, 6, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2081, 19, 6, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2082, 19, 6, 3, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2083, 19, 6, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2084, 19, 6, 5, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2085, 19, 6, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2087, 19, 6, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2088, 19, 6, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2089, 19, 6, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2130, 20, 1, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2131, 20, 1, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2132, 20, 1, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2133, 20, 1, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2134, 20, 1, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2135, 20, 1, 6, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2137, 20, 1, 8, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2138, 20, 1, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2139, 20, 1, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2140, 20, 2, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2143, 20, 2, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2144, 20, 2, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2145, 20, 2, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2146, 20, 2, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2147, 20, 2, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2148, 20, 2, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2154, 20, 3, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2155, 20, 3, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2156, 20, 3, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2157, 20, 3, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2158, 20, 3, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2159, 20, 3, 10, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2160, 20, 4, 1, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2161, 20, 4, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2162, 20, 4, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2163, 20, 4, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2166, 20, 4, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2167, 20, 4, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2168, 20, 4, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2172, 20, 5, 3, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2173, 20, 5, 4, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2174, 20, 5, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2175, 20, 5, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2176, 20, 5, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2177, 20, 5, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2178, 20, 5, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2180, 20, 6, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2181, 20, 6, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2182, 20, 6, 3, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2184, 20, 6, 5, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2185, 20, 6, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2186, 20, 6, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2187, 20, 6, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2188, 20, 6, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2230, 21, 1, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2231, 21, 1, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2232, 21, 1, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2233, 21, 1, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2234, 21, 1, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2238, 21, 1, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2239, 21, 1, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2240, 21, 2, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2241, 21, 2, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2242, 21, 2, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2243, 21, 2, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2248, 21, 2, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2249, 21, 2, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2250, 21, 3, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2251, 21, 3, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2252, 21, 3, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2255, 21, 3, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2256, 21, 3, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2257, 21, 3, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2258, 21, 3, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2259, 21, 3, 10, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2260, 21, 4, 1, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2262, 21, 4, 3, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2263, 21, 4, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2066, 19, 4, 7, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2062, 19, 4, 3, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2086, 19, 6, 7, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2077, 19, 5, 8, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2136, 20, 1, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2142, 20, 2, 3, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2149, 20, 2, 10, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2150, 20, 3, 1, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2151, 20, 3, 2, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2152, 20, 3, 3, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2164, 20, 4, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2165, 20, 4, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2171, 20, 5, 2, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2179, 20, 5, 10, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2183, 20, 6, 4, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2189, 20, 6, 10, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2169, 20, 4, 10, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2141, 20, 2, 2, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2153, 20, 3, 4, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2236, 21, 1, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2237, 21, 1, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2244, 21, 2, 5, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2245, 21, 2, 6, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2246, 21, 2, 7, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2247, 21, 2, 8, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2253, 21, 3, 4, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2254, 21, 3, 5, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2261, 21, 4, 2, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2264, 21, 4, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2235, 21, 1, 6, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2054, 19, 3, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2056, 19, 3, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2266, 21, 4, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2267, 21, 4, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2268, 21, 4, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2269, 21, 4, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2270, 21, 5, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2271, 21, 5, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2272, 21, 5, 3, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2273, 21, 5, 4, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2275, 21, 5, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2276, 21, 5, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2277, 21, 5, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2278, 21, 5, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2279, 21, 5, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2280, 21, 6, 1, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2281, 21, 6, 2, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2282, 21, 6, 3, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2283, 21, 6, 4, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2284, 21, 6, 5, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2286, 21, 6, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2287, 21, 6, 8, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2288, 21, 6, 9, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2289, 21, 6, 10, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2330, 22, 1, 1, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2331, 22, 1, 2, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2332, 22, 1, 3, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2333, 22, 1, 4, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2334, 22, 1, 5, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2337, 22, 1, 8, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2341, 22, 1, 12, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2342, 22, 1, 13, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2343, 22, 1, 14, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2344, 22, 1, 15, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2345, 22, 2, 1, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2346, 22, 2, 2, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2347, 22, 2, 3, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2348, 22, 2, 4, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2349, 22, 2, 5, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2350, 22, 2, 6, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2351, 22, 2, 7, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2352, 22, 2, 8, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2358, 22, 2, 14, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2359, 22, 2, 15, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2360, 22, 3, 1, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2361, 22, 3, 2, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2362, 22, 3, 3, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2363, 22, 3, 4, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2364, 22, 3, 5, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2365, 22, 3, 6, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2366, 22, 3, 7, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2367, 22, 3, 8, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2368, 22, 3, 9, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2369, 22, 3, 10, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2371, 22, 3, 12, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2372, 22, 3, 13, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2373, 22, 3, 14, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2374, 22, 3, 15, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2375, 22, 4, 1, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2376, 22, 4, 2, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2377, 22, 4, 3, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2378, 22, 4, 4, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2379, 22, 4, 5, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2380, 22, 4, 6, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2381, 22, 4, 7, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2382, 22, 4, 8, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2383, 22, 4, 9, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2384, 22, 4, 10, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2388, 22, 4, 14, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2389, 22, 4, 15, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2390, 22, 5, 1, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2391, 22, 5, 2, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2392, 22, 5, 3, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2393, 22, 5, 4, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2394, 22, 5, 5, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2395, 22, 5, 6, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2396, 22, 5, 7, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2397, 22, 5, 8, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2402, 22, 5, 13, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2403, 22, 5, 14, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2404, 22, 5, 15, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2405, 22, 6, 1, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2406, 22, 6, 2, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2407, 22, 6, 3, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2409, 22, 6, 5, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2410, 22, 6, 6, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2411, 22, 6, 7, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2412, 22, 6, 8, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2413, 22, 6, 9, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2414, 22, 6, 10, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2417, 22, 6, 13, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2418, 22, 6, 14, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2419, 22, 6, 15, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2420, 22, 7, 1, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2421, 22, 7, 2, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2422, 22, 7, 3, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2423, 22, 7, 4, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2424, 22, 7, 5, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2426, 22, 7, 7, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2427, 22, 7, 8, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2431, 22, 7, 12, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2432, 22, 7, 13, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2433, 22, 7, 14, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2434, 22, 7, 15, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2501, 23, 1, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2502, 23, 1, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2503, 23, 1, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2504, 23, 1, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2505, 23, 1, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2285, 21, 6, 6, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2335, 22, 1, 6, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2336, 22, 1, 7, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2338, 22, 1, 9, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2339, 22, 1, 10, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2340, 22, 1, 11, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2353, 22, 2, 9, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2354, 22, 2, 10, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2355, 22, 2, 11, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2356, 22, 2, 12, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2357, 22, 2, 13, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2370, 22, 3, 11, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2387, 22, 4, 13, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2386, 22, 4, 12, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2385, 22, 4, 11, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2408, 22, 6, 4, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2416, 22, 6, 12, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2425, 22, 7, 6, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (112, 1, 6, 12, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2401, 22, 5, 12, 'blocked', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2398, 22, 5, 9, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2428, 22, 7, 9, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2429, 22, 7, 10, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2430, 22, 7, 11, 'free', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2506, 23, 1, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2507, 23, 1, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2508, 23, 1, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2509, 23, 1, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2510, 23, 1, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2511, 23, 1, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2515, 23, 1, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2516, 23, 1, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2517, 23, 1, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2518, 23, 1, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2519, 23, 1, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2520, 23, 1, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2521, 23, 2, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2522, 23, 2, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2523, 23, 2, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2524, 23, 2, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2525, 23, 2, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2526, 23, 2, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2527, 23, 2, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2528, 23, 2, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2529, 23, 2, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2530, 23, 2, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2531, 23, 2, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2532, 23, 2, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2533, 23, 2, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2534, 23, 2, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2535, 23, 2, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2536, 23, 2, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2537, 23, 2, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2538, 23, 2, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2539, 23, 2, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2540, 23, 2, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2541, 23, 3, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2542, 23, 3, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2543, 23, 3, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2544, 23, 3, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2545, 23, 3, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2546, 23, 3, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2550, 23, 3, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2551, 23, 3, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2552, 23, 3, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2553, 23, 3, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2554, 23, 3, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2555, 23, 3, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2556, 23, 3, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2557, 23, 3, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2558, 23, 3, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2559, 23, 3, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2560, 23, 3, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2561, 23, 4, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2562, 23, 4, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2563, 23, 4, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2564, 23, 4, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2565, 23, 4, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2566, 23, 4, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2567, 23, 4, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2568, 23, 4, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2571, 23, 4, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2572, 23, 4, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2573, 23, 4, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2574, 23, 4, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2575, 23, 4, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2576, 23, 4, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2577, 23, 4, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2578, 23, 4, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2579, 23, 4, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2580, 23, 4, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2581, 23, 5, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2582, 23, 5, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2583, 23, 5, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2584, 23, 5, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2585, 23, 5, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2586, 23, 5, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2587, 23, 5, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2588, 23, 5, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2589, 23, 5, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2590, 23, 5, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2591, 23, 5, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2592, 23, 5, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2593, 23, 5, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2594, 23, 5, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2595, 23, 5, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2596, 23, 5, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2597, 23, 5, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2598, 23, 5, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2599, 23, 5, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2600, 23, 5, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2601, 23, 6, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2602, 23, 6, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2603, 23, 6, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2604, 23, 6, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2605, 23, 6, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2606, 23, 6, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2607, 23, 6, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2608, 23, 6, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2609, 23, 6, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2612, 23, 6, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2616, 23, 6, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2617, 23, 6, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2618, 23, 6, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2619, 23, 6, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2620, 23, 6, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2621, 23, 7, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2622, 23, 7, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2623, 23, 7, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2624, 23, 7, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2625, 23, 7, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2626, 23, 7, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2627, 23, 7, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2631, 23, 7, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2632, 23, 7, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2633, 23, 7, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2634, 23, 7, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2635, 23, 7, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2636, 23, 7, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2637, 23, 7, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2638, 23, 7, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2639, 23, 7, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2640, 23, 7, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2641, 23, 8, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2513, 23, 1, 13, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2514, 23, 1, 14, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2548, 23, 3, 8, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2549, 23, 3, 9, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2569, 23, 4, 9, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2570, 23, 4, 10, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2610, 23, 6, 10, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2613, 23, 6, 13, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2614, 23, 6, 14, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2615, 23, 6, 15, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2611, 23, 6, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2642, 23, 8, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2643, 23, 8, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2644, 23, 8, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2645, 23, 8, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2646, 23, 8, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2647, 23, 8, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2651, 23, 8, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2652, 23, 8, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2655, 23, 8, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2656, 23, 8, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2657, 23, 8, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2658, 23, 8, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2659, 23, 8, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2660, 23, 8, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2661, 23, 9, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2662, 23, 9, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2663, 23, 9, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2664, 23, 9, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2665, 23, 9, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2666, 23, 9, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2667, 23, 9, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2668, 23, 9, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2669, 23, 9, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2673, 23, 9, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2674, 23, 9, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2675, 23, 9, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2676, 23, 9, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2677, 23, 9, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2678, 23, 9, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2679, 23, 9, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2680, 23, 9, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2691, 23, 10, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2692, 23, 10, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2693, 23, 10, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2694, 23, 10, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2695, 23, 10, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2696, 23, 10, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2697, 23, 10, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2698, 23, 10, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2699, 23, 10, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2700, 23, 10, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2701, 23, 10, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2702, 23, 10, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2703, 23, 10, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2704, 23, 10, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2705, 23, 10, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2706, 23, 10, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2708, 23, 10, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2709, 23, 10, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2710, 23, 10, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2711, 23, 11, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2712, 23, 11, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2713, 23, 11, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2714, 23, 11, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2715, 23, 11, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2716, 23, 11, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2717, 23, 11, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2718, 23, 11, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2719, 23, 11, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2720, 23, 11, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2721, 23, 11, 11, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2722, 23, 11, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2723, 23, 11, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2724, 23, 11, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2725, 23, 11, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2726, 23, 11, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2727, 23, 11, 17, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2728, 23, 11, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2729, 23, 11, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2730, 23, 11, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1946, 18, 2, 7, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1936, 18, 1, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2053, 19, 3, 4, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2074, 19, 5, 5, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2170, 20, 5, 1, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2265, 21, 4, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2274, 21, 5, 5, 'sales', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2415, 22, 6, 11, 'sales', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2512, 23, 1, 12, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2547, 23, 3, 7, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2648, 23, 8, 8, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2649, 23, 8, 9, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2650, 23, 8, 10, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2653, 23, 8, 13, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2654, 23, 8, 14, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2670, 23, 9, 10, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2671, 23, 9, 11, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2672, 23, 9, 12, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2707, 23, 10, 17, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1165, 7, 4, 6, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1166, 7, 4, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1393, 10, 4, 8, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1394, 10, 4, 9, 'free', 180);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2628, 23, 7, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2629, 23, 7, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2630, 23, 7, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2399, 22, 5, 10, 'blocked', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2400, 22, 5, 11, 'blocked', 215);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1956, 18, 3, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (175, 1, 9, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1855, 17, 3, 6, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1856, 17, 3, 7, 'free', 145);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (2055, 19, 3, 6, 'free', 145);

--
-- Definition for index city_pkey (OID = 33441) :
--
ALTER TABLE ONLY city
    ADD CONSTRAINT city_pkey
    PRIMARY KEY (id);
--
-- Definition for index activity_type_pkey (OID = 33443) :
--
ALTER TABLE ONLY activity_type
    ADD CONSTRAINT activity_type_pkey
    PRIMARY KEY (id);
--
-- Definition for index halls_pkey (OID = 33445) :
--
ALTER TABLE ONLY halls
    ADD CONSTRAINT halls_pkey
    PRIMARY KEY (id);
--
-- Definition for index posters_pkey (OID = 33447) :
--
ALTER TABLE ONLY posters
    ADD CONSTRAINT posters_pkey
    PRIMARY KEY (id);
--
-- Definition for index location_pkey (OID = 33449) :
--
ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey
    PRIMARY KEY (id);
--
-- Definition for index location_city_fk (OID = 33451) :
--
ALTER TABLE ONLY location
    ADD CONSTRAINT location_city_fk
    FOREIGN KEY (city_id) REFERENCES city(id);
--
-- Definition for index activitylocation_pkey (OID = 33456) :
--
ALTER TABLE ONLY activity_location
    ADD CONSTRAINT activitylocation_pkey
    PRIMARY KEY (id);
--
-- Definition for index activity_location_location_fk (OID = 33458) :
--
ALTER TABLE ONLY activity_location
    ADD CONSTRAINT activity_location_location_fk
    FOREIGN KEY (location_id) REFERENCES location(id);
--
-- Definition for index role_pkey (OID = 33463) :
--
ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey
    PRIMARY KEY (id);
--
-- Definition for index user_role_pkey (OID = 33465) :
--
ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_pkey
    PRIMARY KEY (id);
--
-- Definition for index activity_pkey (OID = 33467) :
--
ALTER TABLE ONLY activity
    ADD CONSTRAINT activity_pkey
    PRIMARY KEY (id);
--
-- Definition for index activity_location_fk (OID = 33469) :
--
ALTER TABLE ONLY activity
    ADD CONSTRAINT activity_location_fk
    FOREIGN KEY (location_id) REFERENCES location(id);
--
-- Definition for index activity_posters_fk (OID = 33474) :
--
ALTER TABLE ONLY activity
    ADD CONSTRAINT activity_posters_fk
    FOREIGN KEY (poster_id) REFERENCES posters(id);
--
-- Definition for index users_pkey (OID = 33479) :
--
ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey
    PRIMARY KEY (id);
--
-- Definition for index activity_date_halls_pkey (OID = 33481) :
--
ALTER TABLE ONLY activity_date_halls
    ADD CONSTRAINT activity_date_halls_pkey
    PRIMARY KEY (id);
--
-- Definition for index activity_date_halls_halls_fk (OID = 33483) :
--
ALTER TABLE ONLY activity_date_halls
    ADD CONSTRAINT activity_date_halls_halls_fk
    FOREIGN KEY (halls_id) REFERENCES halls(id);
--
-- Definition for index activity_date_halls_activity_fk (OID = 33488) :
--
ALTER TABLE ONLY activity_date_halls
    ADD CONSTRAINT activity_date_halls_activity_fk
    FOREIGN KEY (activity_id) REFERENCES activity(id);
--
-- Definition for index tickets_pkey (OID = 33493) :
--
ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_pkey
    PRIMARY KEY (id);
--
-- Definition for index tickets_adh_fk (OID = 33495) :
--
ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_adh_fk
    FOREIGN KEY (act_date_halls_id) REFERENCES activity_date_halls(id);
--
-- Definition for index users_activity_pkey (OID = 33500) :
--
ALTER TABLE ONLY users_activity
    ADD CONSTRAINT users_activity_pkey
    PRIMARY KEY (id);
--
-- Definition for index users_activity_user_fk (OID = 33502) :
--
ALTER TABLE ONLY users_activity
    ADD CONSTRAINT users_activity_user_fk
    FOREIGN KEY (user_id) REFERENCES users(id);
--
-- Definition for index users_activity_activity_fk (OID = 33507) :
--
ALTER TABLE ONLY users_activity
    ADD CONSTRAINT users_activity_activity_fk
    FOREIGN KEY (activity_id) REFERENCES activity(id);
--
-- Definition for index users_activity_ticket_fk (OID = 33512) :
--
ALTER TABLE ONLY users_activity
    ADD CONSTRAINT users_activity_ticket_fk
    FOREIGN KEY (tickets_id) REFERENCES tickets(id);
--
-- Definition for index users_city_fk (OID = 33517) :
--
ALTER TABLE ONLY users
    ADD CONSTRAINT users_city_fk
    FOREIGN KEY (city_id) REFERENCES city(id);
--
-- Definition for index user_role_user_fk (OID = 33522) :
--
ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_user_fk
    FOREIGN KEY (user_id) REFERENCES users(id);
--
-- Definition for index user_role_role_fk (OID = 33527) :
--
ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_role_fk
    FOREIGN KEY (role_id) REFERENCES role(id);
--
-- Definition for index activity_type_fk (OID = 33532) :
--
ALTER TABLE ONLY activity
    ADD CONSTRAINT activity_type_fk
    FOREIGN KEY (type_id) REFERENCES activity_type(id);
--
-- Definition for index activity_location_halls_fk (OID = 33537) :
--
ALTER TABLE ONLY activity_location
    ADD CONSTRAINT activity_location_halls_fk
    FOREIGN KEY (halls_id) REFERENCES halls(id);
--
-- Data for sequence public.city_id_seq (OID = 33342)
--
SELECT pg_catalog.setval('city_id_seq', 5, true);
--
-- Data for sequence public.activity_type_id_seq (OID = 33348)
--
SELECT pg_catalog.setval('activity_type_id_seq', 2, true);
--
-- Data for sequence public.halls_id_seq (OID = 33354)
--
SELECT pg_catalog.setval('halls_id_seq', 11, true);
--
-- Data for sequence public.posters_id_seq (OID = 33363)
--
SELECT pg_catalog.setval('posters_id_seq', 12, true);
--
-- Data for sequence public.location_id_seq (OID = 33372)
--
SELECT pg_catalog.setval('location_id_seq', 5, true);
--
-- Data for sequence public.activity_location_id_seq (OID = 33378)
--
SELECT pg_catalog.setval('activity_location_id_seq', 13, true);
--
-- Data for sequence public.role_id_seq (OID = 33389)
--
SELECT pg_catalog.setval('role_id_seq', 2, true);
--
-- Data for sequence public.user_role_id_seq (OID = 33395)
--
SELECT pg_catalog.setval('user_role_id_seq', 13, true);
--
-- Data for sequence public.activity_id_seq (OID = 33401)
--
SELECT pg_catalog.setval('activity_id_seq', 29, true);
--
-- Data for sequence public.users_id_seq (OID = 33407)
--
SELECT pg_catalog.setval('users_id_seq', 42, true);
--
-- Data for sequence public.activity_date_halls_id_seq (OID = 33413)
--
SELECT pg_catalog.setval('activity_date_halls_id_seq', 35, true);
--
-- Data for sequence public.tickets_id_seq (OID = 33429)
--
SELECT pg_catalog.setval('tickets_id_seq', 28, true);
--
-- Data for sequence public.users_activity_id_seq (OID = 33435)
--
SELECT pg_catalog.setval('users_activity_id_seq', 250, true);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
COMMENT ON TABLE public.city IS 'Таблица городов';
COMMENT ON COLUMN public.city.id IS 'Идентификатор строки города';
COMMENT ON COLUMN public.city.city IS 'Название города';
COMMENT ON COLUMN public.city.time_zone IS 'Таймзона (на самом деле LocalID в виде ''en-US'')';
COMMENT ON TABLE public.activity_type IS 'Таблица типов мероприятий (Концерт, Кино, Театр, Шоу, Другое и так далее)';
COMMENT ON COLUMN public.activity_type.id IS 'Идентификатор';
COMMENT ON COLUMN public.activity_type.activity_type IS 'Тип мероприятия (Концерт, Кино, Театр, Шоу, Другое и так далее)';
COMMENT ON TABLE public.halls IS 'Таблица залов';
COMMENT ON COLUMN public.halls.id IS 'Идентификатор';
COMMENT ON COLUMN public.halls.number IS 'Номер зала';
COMMENT ON COLUMN public.halls.tickets_count IS 'Количество мест в зале';
COMMENT ON COLUMN public.halls.scheme IS 'Схема зала';
COMMENT ON TABLE public.posters IS 'Таблица постеров';
COMMENT ON COLUMN public.posters.id IS 'Идентификатор';
COMMENT ON COLUMN public.posters.poster IS 'Постер мероприятия (если есть)';
COMMENT ON TABLE public.location IS 'Место проведения (кинотеатр, стадион, театр и так далее)';
COMMENT ON COLUMN public.location.id IS 'Идентификатор';
COMMENT ON COLUMN public.location.title_place IS 'Название места (кинотеатр "Победа")';
COMMENT ON COLUMN public.location.city_id IS 'Ссылка на город, в котором находится место (id таблицы city)';
COMMENT ON COLUMN public.location.street IS 'Улица, где находится место';
COMMENT ON COLUMN public.location.house_number IS 'Номер дома (в довольно вольном виде типа "здание 4 корп 2")';
COMMENT ON COLUMN public.location.longitude IS 'Долгота';
COMMENT ON COLUMN public.location.latitude IS 'Широта';
COMMENT ON TABLE public.activity_location IS 'Таблица соответствия Зал связывается с Локацией (кинотеатром, театром, стадионом и пр)';
COMMENT ON COLUMN public.activity_location.id IS 'Идентификатор';
COMMENT ON COLUMN public.activity_location.location_id IS 'Ссылка на место, где проходит мероприятие (id таблицы location)';
COMMENT ON COLUMN public.activity_location.halls_id IS 'Ссылка на таблицу залов (id зала)';
COMMENT ON TABLE public.role IS 'Таблица ролей (SpringSecurity)';
COMMENT ON COLUMN public.role.id IS 'Идентификатор';
COMMENT ON COLUMN public.role.role IS 'Роль (enum из ролей SpringSecurity)';
COMMENT ON TABLE public.user_role IS 'Таблица соответствия ролей юзерам';
COMMENT ON COLUMN public.user_role.id IS 'Идентификатор';
COMMENT ON COLUMN public.user_role.user_id IS 'Ссылка на таблицу пользователей (id таблицы user)';
COMMENT ON COLUMN public.user_role.role_id IS 'Ссылка на таблицу ролей (id таблицы role)';
COMMENT ON COLUMN public.activity.id IS 'Идентификатор';
COMMENT ON COLUMN public.activity.type_id IS 'Ссылка на тип мероприятия (id таблицы activity_type)';
COMMENT ON COLUMN public.activity.title IS 'Название мероприятия';
COMMENT ON COLUMN public.activity.location_id IS 'Ссылка на локацию, где происходит мероприятие (id поле таблицы location)';
COMMENT ON COLUMN public.activity.poster_id IS 'Ссылка на постер мероприятия (id таблицы posters)';
COMMENT ON TABLE public.users IS 'Таблица пользователей';
COMMENT ON COLUMN public.users.id IS 'Идентификатор';
COMMENT ON COLUMN public.users.first_name IS 'Имя пользователя';
COMMENT ON COLUMN public.users.last_name IS 'Фамилия пользователя';
COMMENT ON COLUMN public.users.middle_name IS 'Отчество пользователя';
COMMENT ON COLUMN public.users.password IS 'Пароль пользователя';
COMMENT ON COLUMN public.users.email IS 'E-mail пользователя';
COMMENT ON COLUMN public.users.phone IS 'Номер телефона пользователя';
COMMENT ON COLUMN public.users.city_id IS 'Город пользователя';
COMMENT ON TABLE public.activity_date_halls IS 'Таблица времени для определенного мероприятия в определенном зале';
COMMENT ON COLUMN public.activity_date_halls.id IS 'Идентификатор';
COMMENT ON COLUMN public.activity_date_halls.activity_date IS 'Время мероприятия';
COMMENT ON COLUMN public.activity_date_halls.halls_id IS 'Ссылка на зал, в котором проходит мероприятие (id таблицы halls)';
COMMENT ON COLUMN public.activity_date_halls.activity_id IS 'Ссылка на мероприятие, которое проходит в это время в этом зале (id таблицы activity)';
COMMENT ON TYPE enum_ticket_status IS 'blocked - забронирован, temp_blocked - временно забронирован, sales - продан, free - свободен ';
COMMENT ON TABLE public.tickets IS 'Таблица билетов';
COMMENT ON COLUMN public.tickets.id IS 'Идентификатор';
COMMENT ON COLUMN public.tickets.act_date_halls_id IS 'Ссылка на конкретное мероприятие в конкретном месте в конкретное время (id таблицы activity_date_halls)';
COMMENT ON COLUMN public.tickets.row_num IS 'Номер ряда';
COMMENT ON COLUMN public.tickets.place_num IS 'Номер места';
COMMENT ON COLUMN public.tickets.ticket_status IS 'Статус билета: забронирован, временно забронирован, продан, свободен';
COMMENT ON TABLE public.users_activity IS 'Таблица забронированных или купленныхь билетов пользователя';
COMMENT ON COLUMN public.users_activity.id IS 'Идентификатор';
COMMENT ON COLUMN public.users_activity.user_id IS 'Ссылка на пользователя (id таблицы users)';
COMMENT ON COLUMN public.users_activity.activity_id IS 'Ссылка на мероприятие (id таблицы activity)';
COMMENT ON COLUMN public.users_activity.tickets_id IS 'Ссылка на билет (id таблицы tickets)';
COMMENT ON CONSTRAINT location_city_fk ON location IS 'Ссылка на город, в котором находится место (id таблицы city)';
COMMENT ON CONSTRAINT activity_location_location_fk ON activity_location IS 'Ссылка на место, где проходит мероприятие (id таблицы location)';
COMMENT ON CONSTRAINT activity_location_fk ON activity IS 'Ссылка на локацию, где происходит мероприятие (id поле таблицы location)';
COMMENT ON CONSTRAINT activity_posters_fk ON activity IS 'Ссылка на постер мероприятия (id таблицы posters)';
COMMENT ON CONSTRAINT activity_date_halls_halls_fk ON activity_date_halls IS 'Ссылка на идентификатор зала (id таблицы halls)';
COMMENT ON CONSTRAINT activity_date_halls_activity_fk ON activity_date_halls IS 'Ссылка на мероприятие (id таблицы activity)';
COMMENT ON CONSTRAINT tickets_adh_fk ON tickets IS 'Ссылка на конкретное мероприятие в конкретном месте в конкретное время (id таблицы activity_date_halls)';
COMMENT ON CONSTRAINT users_activity_user_fk ON users_activity IS 'Ссылка на пользователя (id таблицы users)';
COMMENT ON CONSTRAINT users_activity_activity_fk ON users_activity IS 'Ссылка на мероприятие (id таблицы activity)';
COMMENT ON CONSTRAINT users_activity_ticket_fk ON users_activity IS 'Ссылка на билет (id таблицы tickets)';
COMMENT ON CONSTRAINT users_city_fk ON users IS 'Город пользователя';
COMMENT ON CONSTRAINT user_role_user_fk ON user_role IS 'Ссылка на таблицу пользователей (id таблицы user)';
COMMENT ON CONSTRAINT user_role_role_fk ON user_role IS 'Ссылка на таблицу ролей (id таблицы role)';
COMMENT ON CONSTRAINT activity_type_fk ON activity IS 'Ссылка на тип мероприятия (id таблицы activity_type)';
COMMENT ON CONSTRAINT activity_location_halls_fk ON activity_location IS 'Ссылка на зал, где проходит мероприятие (id таблицы halls)';
