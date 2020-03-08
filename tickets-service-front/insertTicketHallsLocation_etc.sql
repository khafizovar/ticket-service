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
-- Data for table public.activity_type (OID = 33350) (LIMIT 0,1)
--
INSERT INTO activity_type (id, activity_type)
VALUES (1, 'кино');

--
-- Data for table public.halls (OID = 33356) (LIMIT 0,8)
--
INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (7, 1, 80, '[8,10]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (2, 1, 160, '[8,20]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (3, 2, 105, '[7,15]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (5, 4, 150, '[10,15]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (6, 2, 152, '[9,19]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (8, 3, 60, '[6,10]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (4, 6, 105, '[7,15]');

INSERT INTO halls (id, number, tickets_count, scheme)
VALUES (1, 10, 220, '[11,20]');

--
-- Data for table public.posters (OID = 33365) (LIMIT 0,4)
--
INSERT INTO posters (id, poster)
VALUES (1, 'Led2.jpg');

INSERT INTO posters (id, poster)
VALUES (2, 'Sonik1.jpg');

INSERT INTO posters (id, poster)
VALUES (3, 'Gent.jpg');

INSERT INTO posters (id, poster)
VALUES (4, 'Zov.jpg');

--
-- Data for table public.location (OID = 33374) (LIMIT 0,5)
--
INSERT INTO location (id, title_place, city_id, street, house_number, longitude, latitude)
VALUES (3, 'Алмаз Синема Гранд', 2, 'Спартаковская', '6', NULL, NULL);

INSERT INTO location (id, title_place, city_id, street, house_number, longitude, latitude)
VALUES (1, 'Победа', 5, 'Ленина', '7', NULL, NULL);

INSERT INTO location (id, title_place, city_id, street, house_number, longitude, latitude)
VALUES (2, 'Киносити', 5, 'Фрунзе', '238', NULL, NULL);

INSERT INTO location (id, title_place, city_id, street, house_number, longitude, latitude)
VALUES (4, 'Korston', 1, 'Николая Ершова', '1А', NULL, NULL);

INSERT INTO location (id, title_place, city_id, street, house_number, longitude, latitude)
VALUES (5, 'Киномир', 5, 'Рубиновая', '9', NULL, NULL);

--
-- Data for table public.activity_location (OID = 33380) (LIMIT 0,8)
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
VALUES (4, 3, 4);

INSERT INTO activity_location (id, location_id, halls_id)
VALUES (6, 4, 6);

--
-- Data for table public.role (OID = 33391) (LIMIT 0,2)
--
INSERT INTO role (id, role)
VALUES (1, 'ROLE_USER');

INSERT INTO role (id, role)
VALUES (2, 'ROLE_ADMIN');

--
-- Data for table public.user_role (OID = 33397) (LIMIT 0,3)
--
INSERT INTO user_role (id, user_id, role_id)
VALUES (1, 3, 1);

INSERT INTO user_role (id, user_id, role_id)
VALUES (2, 4, 1);

INSERT INTO user_role (id, user_id, role_id)
VALUES (7, 36, 1);

--
-- Data for table public.activity (OID = 33403) (LIMIT 0,9)
--
INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (2, 1, 'Лёд2', 1, 1);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (5, 1, 'Соник', 3, 2);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (6, 1, 'Джентельмены', 5, 3);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (7, 1, 'Джентельмены', 3, 3);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (3, 1, 'Зов предков', 2, 4);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (8, 1, 'Зов предков', 5, 4);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (1, 1, 'Соник', 1, 2);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (4, 1, 'Соник', 2, 2);

INSERT INTO activity (id, type_id, title, location_id, poster_id)
VALUES (9, 1, 'Соник', 5, 2);

--
-- Data for table public.users (OID = 33409) (LIMIT 0,5)
--
INSERT INTO users (id, first_name, last_name, middle_name, password, email, phone, city_id)
VALUES (4, 'Иван', 'Андреев', 'Васильевич', '234567', '456@456.com', '89135678485', 2);

INSERT INTO users (id, first_name, last_name, middle_name, password, email, phone, city_id)
VALUES (1, 'Мария', 'Завидова', 'Петровна', '222222', '222@22.com', '89162347658', 3);

INSERT INTO users (id, first_name, last_name, middle_name, password, email, phone, city_id)
VALUES (5, 'Ольга', 'Сказкина', 'Игоревна', '111111', '111@111.com', '89135634589', 1);

INSERT INTO users (id, first_name, last_name, middle_name, password, email, phone, city_id)
VALUES (3, 'Николай', 'Кузнецов', 'Петрович', '123456', '111@123.com', '89134144111', 5);

INSERT INTO users (id, first_name, last_name, middle_name, password, email, phone, city_id)
VALUES (36, 'Иван', 'Сидоров', 'Игоревич', '$2a$10$ns9pHkVTUmi2Uy9XHBUQZO5rjRPBG9enhlij7RAnxvFpvDPFFwq0m', '123@123.com', '89134623245', 5);

--
-- Data for table public.activity_date_halls (OID = 33415) (LIMIT 0,9)
--
INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (1, '2020-02-18 11:25:00', 1, 1);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (2, '2020-02-18 13:00:00', 2, 1);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (3, '2020-02-18 11:25:00', 3, 4);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (4, '2020-02-20 17:15:00', 2, 1);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (5, '2020-02-21 10:25:30', 8, 6);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (7, '2020-02-23 16:30:00', 8, 6);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (8, '2020-02-24 18:40:00', 3, 3);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (6, '2020-02-22 19:00:00', 3, 4);

INSERT INTO activity_date_halls (id, activity_date, halls_id, activity_id)
VALUES (9, '2020-02-19 15:00:00', 4, 7);

--
-- Data for table public.tickets (OID = 33431) (LIMIT 0,1111)
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
VALUES (50, 1, 3, 10, 'free', 140);

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
VALUES (64, 1, 4, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (65, 1, 4, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (66, 1, 4, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (67, 1, 4, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (68, 1, 4, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (69, 1, 4, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (70, 1, 4, 10, 'free', 140);

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
VALUES (84, 1, 5, 4, 'free', 140);

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
VALUES (107, 1, 6, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (112, 1, 6, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (113, 1, 6, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (114, 1, 6, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (115, 1, 6, 15, 'free', 140);

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
VALUES (127, 1, 7, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (133, 1, 7, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (134, 1, 7, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (135, 1, 7, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (136, 1, 7, 16, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (15, 1, 1, 15, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (62, 1, 4, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (74, 1, 4, 14, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (73, 1, 4, 13, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (128, 1, 7, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (93, 1, 5, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (92, 1, 5, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (86, 1, 5, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (132, 1, 7, 12, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (85, 1, 5, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (91, 1, 5, 11, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (131, 1, 7, 11, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (87, 1, 5, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (25, 1, 2, 5, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (26, 1, 2, 6, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (109, 1, 6, 9, 'blocked', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (111, 1, 6, 11, 'blocked', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (129, 1, 7, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (108, 1, 6, 8, 'free', 140);

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
VALUES (163, 1, 8, 13, 'free', 140);

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
VALUES (173, 1, 9, 3, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (174, 1, 9, 4, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (175, 1, 9, 5, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (176, 1, 9, 6, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (177, 1, 9, 7, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (178, 1, 9, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (179, 1, 9, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (180, 1, 9, 10, 'free', 140);

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
VALUES (186, 1, 9, 16, 'free', 140);

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
VALUES (198, 1, 10, 8, 'free', 140);

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
VALUES (279, 2, 3, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (280, 2, 3, 10, 'free', 140);

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
VALUES (283, 2, 3, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (284, 2, 3, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (285, 2, 3, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (288, 2, 3, 18, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (289, 2, 3, 19, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (290, 2, 3, 20, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (291, 2, 4, 1, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (292, 2, 4, 2, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (294, 2, 4, 4, 'free', 140);

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
VALUES (343, 2, 6, 13, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (344, 2, 6, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (345, 2, 6, 15, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (346, 2, 6, 16, 'free', 140);

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
VALUES (380, 2, 8, 10, 'free', 140);

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
VALUES (320, 2, 5, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (307, 2, 4, 17, 'sales', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (323, 2, 5, 13, 'free', 140);

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
VALUES (777, 5, 2, 7, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (778, 5, 2, 8, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (779, 5, 2, 9, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (780, 5, 2, 10, 'free', 230);

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
VALUES (837, 5, 5, 7, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (838, 5, 5, 8, 'free', 230);

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
VALUES (857, 5, 6, 7, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (858, 5, 6, 8, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (859, 5, 6, 9, 'free', 230);

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
VALUES (903, 5, 8, 13, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (904, 5, 8, 14, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (905, 5, 8, 15, 'free', 230);

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
VALUES (918, 5, 9, 8, 'free', 230);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (919, 5, 9, 9, 'free', 230);

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
VALUES (965, 6, 1, 15, 'free', 195);

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
VALUES (1020, 6, 4, 10, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1021, 6, 4, 11, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1022, 6, 4, 12, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1023, 6, 4, 13, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1024, 6, 4, 14, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1025, 6, 4, 15, 'free', 195);

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
VALUES (1048, 6, 5, 18, 'free', 195);

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
VALUES (1075, 6, 7, 6, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1076, 6, 7, 7, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1077, 6, 7, 8, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1079, 6, 7, 9, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1080, 6, 7, 10, 'free', 195);

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
VALUES (1094, 6, 8, 5, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1095, 6, 8, 6, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1096, 6, 8, 7, 'free', 195);

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
VALUES (1155, 7, 3, 6, 'free', 200);

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
VALUES (1164, 7, 4, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1165, 7, 4, 6, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1166, 7, 4, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1167, 7, 4, 8, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1168, 7, 4, 9, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1169, 7, 4, 10, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1170, 7, 5, 1, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1034, 6, 5, 4, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1049, 6, 5, 19, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1062, 6, 6, 12, 'sales', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1043, 6, 5, 13, 'free', 195);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1171, 7, 5, 2, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1172, 7, 5, 3, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1173, 7, 5, 4, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1174, 7, 5, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1175, 7, 5, 6, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1176, 7, 5, 7, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1177, 7, 5, 8, 'free', 200);

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
VALUES (1233, 8, 3, 4, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1235, 8, 3, 6, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1236, 8, 3, 7, 'free', 300);

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
VALUES (1242, 8, 4, 3, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1244, 8, 4, 5, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1245, 8, 4, 6, 'free', 300);

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
VALUES (1246, 8, 4, 7, 'sales', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1247, 8, 4, 8, 'sales', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1248, 8, 4, 9, 'sales', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1264, 8, 6, 5, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1263, 8, 6, 4, 'free', 300);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1204, 7, 8, 5, 'free', 200);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (90, 1, 5, 10, 'sales', 140);

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
VALUES (1309, 9, 4, 10, 'free', 350);

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
VALUES (1323, 9, 6, 4, 'blocked', 350);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (1324, 9, 6, 5, 'blocked', 350);

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
VALUES (440, 3, 3, 10, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (478, 3, 5, 8, 'free', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (130, 1, 7, 10, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (88, 1, 5, 8, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (89, 1, 5, 9, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (322, 2, 5, 12, 'blocked', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (458, 3, 4, 8, 'blocked', 210);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (321, 2, 5, 11, 'blocked', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (94, 1, 5, 14, 'free', 140);

INSERT INTO tickets (id, act_date_halls_id, row_num, place_num, ticket_status, sign_num)
VALUES (110, 1, 6, 10, 'blocked', 140);

--
-- Data for table public.users_activity (OID = 33437) (LIMIT 0,7)
--
INSERT INTO users_activity (id, user_id, activity_id, tickets_id)
VALUES (87, 36, 1, 307);

INSERT INTO users_activity (id, user_id, activity_id, tickets_id)
VALUES (88, 36, 1, 321);

INSERT INTO users_activity (id, user_id, activity_id, tickets_id)
VALUES (89, 36, 1, 322);

INSERT INTO users_activity (id, user_id, activity_id, tickets_id)
VALUES (91, 36, 3, 1246);

INSERT INTO users_activity (id, user_id, activity_id, tickets_id)
VALUES (92, 36, 3, 1247);

INSERT INTO users_activity (id, user_id, activity_id, tickets_id)
VALUES (93, 36, 3, 1248);

INSERT INTO users_activity (id, user_id, activity_id, tickets_id)
VALUES (94, 36, 4, 458);


