-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 03 2023 г., 07:37
-- Версия сервера: 5.6.51
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `GeekBrains`
--

-- --------------------------------------------------------

--
-- Структура таблицы `program`
--

CREATE TABLE `program` (
  `id_prog` int(10) NOT NULL COMMENT 'Идентификатор образовательной программы'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Программа';

-- --------------------------------------------------------

--
-- Структура таблицы `type_event`
--

CREATE TABLE `type_event` (
  `id_type_event` int(10) NOT NULL COMMENT 'Идентификатор типа мероприятия',
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Тип мероприятия'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Тип мероприятия';

--
-- Дамп данных таблицы `type_event`
--

INSERT INTO `type_event` (`id_type_event`, `type`) VALUES
(1, 'Хакатон'),
(2, 'Конференция'),
(3, 'Семинар'),
(4, 'Лекция'),
(5, 'Практикум');

-- --------------------------------------------------------

--
-- Структура таблицы `type_event_list`
--

CREATE TABLE `type_event_list` (
  `id_event_list` int(10) NOT NULL COMMENT 'Идентификатор вида мероприятия',
  `event_type` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Формат обучения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Вид мероприятия';

--
-- Дамп данных таблицы `type_event_list`
--

INSERT INTO `type_event_list` (`id_event_list`, `event_type`) VALUES
(1, 'Синхронный'),
(2, 'Не синхронный');

-- --------------------------------------------------------

--
-- Структура таблицы `type_material`
--

CREATE TABLE `type_material` (
  `id_material` int(10) NOT NULL,
  `materials` text CHARACTER SET cp1251
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Тип материала';

--
-- Дамп данных таблицы `type_material`
--

INSERT INTO `type_material` (`id_material`, `materials`) VALUES
(1, 'Видео'),
(2, 'Аудио'),
(3, 'Текстовые (книги, статьи)');

-- --------------------------------------------------------

--
-- Структура таблицы `type_task`
--

CREATE TABLE `type_task` (
  `id_task` int(11) NOT NULL COMMENT 'Идентификатор задания',
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Тип задания'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Тип задания';

--
-- Дамп данных таблицы `type_task`
--

INSERT INTO `type_task` (`id_task`, `type`) VALUES
(1, 'Тест'),
(2, 'Д/З');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id_user` int(10) NOT NULL COMMENT 'Идентификатор пользователя',
  `surname` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Фамилия',
  `name` int(255) NOT NULL COMMENT 'Имя',
  `patronymic` int(255) NOT NULL COMMENT 'Отчество',
  `birthday` date NOT NULL COMMENT 'Дата рождения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Данные пользователя';

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id_user`, `surname`, `name`, `patronymic`, `birthday`) VALUES
(1, '[value-2]', 0, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `user_mail`
--

CREATE TABLE `user_mail` (
  `id_mail` int(10) NOT NULL COMMENT 'Идентификатор E-mail',
  `mail` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'E-mail пользователя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='E-mail пользователя';

-- --------------------------------------------------------

--
-- Структура таблицы `user_phone`
--

CREATE TABLE `user_phone` (
  `id_user_phone` int(10) NOT NULL COMMENT 'Идентификатор телефона',
  `phone` int(32) NOT NULL COMMENT 'Номер телефона пользователя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Номер телефона пользователя';

-- --------------------------------------------------------

--
-- Структура таблицы `user_status`
--

CREATE TABLE `user_status` (
  `id_status` int(10) NOT NULL COMMENT 'Идентификатор типа/статуса пользователя',
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Тип/статус пользователя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Статус пользователя';

--
-- Дамп данных таблицы `user_status`
--

INSERT INTO `user_status` (`id_status`, `type`) VALUES
(1, 'Ученик'),
(2, 'Преподаватель'),
(3, 'Наставник'),
(4, 'Ревьюер'),
(5, 'Администратор'),
(6, 'Директор');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`id_prog`);

--
-- Индексы таблицы `type_event`
--
ALTER TABLE `type_event`
  ADD PRIMARY KEY (`id_type_event`);

--
-- Индексы таблицы `type_event_list`
--
ALTER TABLE `type_event_list`
  ADD PRIMARY KEY (`id_event_list`);

--
-- Индексы таблицы `type_material`
--
ALTER TABLE `type_material`
  ADD PRIMARY KEY (`id_material`);

--
-- Индексы таблицы `type_task`
--
ALTER TABLE `type_task`
  ADD PRIMARY KEY (`id_task`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Индексы таблицы `user_mail`
--
ALTER TABLE `user_mail`
  ADD PRIMARY KEY (`id_mail`);

--
-- Индексы таблицы `user_phone`
--
ALTER TABLE `user_phone`
  ADD PRIMARY KEY (`id_user_phone`);

--
-- Индексы таблицы `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id_status`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `program`
--
ALTER TABLE `program`
  MODIFY `id_prog` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор образовательной программы';

--
-- AUTO_INCREMENT для таблицы `type_event`
--
ALTER TABLE `type_event`
  MODIFY `id_type_event` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор типа мероприятия', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `type_event_list`
--
ALTER TABLE `type_event_list`
  MODIFY `id_event_list` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор вида мероприятия', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `type_material`
--
ALTER TABLE `type_material`
  MODIFY `id_material` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `type_task`
--
ALTER TABLE `type_task`
  MODIFY `id_task` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор задания', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор пользователя', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `user_mail`
--
ALTER TABLE `user_mail`
  MODIFY `id_mail` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор E-mail';

--
-- AUTO_INCREMENT для таблицы `user_phone`
--
ALTER TABLE `user_phone`
  MODIFY `id_user_phone` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор телефона';

--
-- AUTO_INCREMENT для таблицы `user_status`
--
ALTER TABLE `user_status`
  MODIFY `id_status` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор типа/статуса пользователя', AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
