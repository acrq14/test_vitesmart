-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 24 2022 г., 18:26
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vitasmart`
--

-- --------------------------------------------------------

--
-- Структура таблицы `contracts`
--

CREATE TABLE `contracts` (
  `c_id` int NOT NULL,
  `c_player_id` int NOT NULL,
  `c_team_id` int NOT NULL,
  `c_team` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `contracts`
--

INSERT INTO `contracts` (`c_id`, `c_player_id`, `c_team_id`, `c_team`, `c_year`) VALUES
(1, 1, 1, 'Майями', 4),
(2, 1, 2, 'Кливленд', 10),
(3, 1, 3, 'Лейкерс', 4),
(4, 2, 1, 'Майями', 1),
(5, 2, 2, 'Кливленд', 2),
(6, 2, 3, 'Лейкерс', 3),
(7, 3, 2, 'Кливленд', 4),
(9, 3, 4, 'Клиперс', 5),
(10, 4, 2, 'Кливленд', 7),
(11, 4, 3, 'Лейкерс', 5),
(12, 4, 4, 'Клиперс', 15),
(13, 5, 2, 'Кливленд', 5),
(14, 5, 3, 'Лейкерс', 7),
(15, 5, 4, 'Клиперс', 5),
(16, 6, 1, 'Майями', 7),
(17, 6, 2, 'Кливленд', 5),
(18, 6, 3, 'Лейкерс', 2),
(19, 6, 4, 'Клиперс', 5),
(20, 2, 1, 'Майями', 7),
(21, 6, 5, 'Сакроменто', 2),
(22, 2, 5, 'Сакроменто', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `players`
--

CREATE TABLE `players` (
  `player_id` int NOT NULL,
  `player_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `player_sname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `player_position` varchar(40) NOT NULL,
  `player_level` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `players`
--

INSERT INTO `players` (`player_id`, `player_name`, `player_sname`, `player_position`, `player_level`) VALUES
(1, 'Lebron', 'james', 'sf', 'genka@mail.ru'),
(2, 'Jimmy', 'Butler', 'sg', 'ildar@yandex.ru'),
(3, 'Kawai', 'Leonard', 'sf', 'vasiv@mail.ru'),
(4, 'Nikola', 'Jokic', 'C', 'petfed@yandex.ru'),
(5, 'Chris', 'Paul', 'pg', 'vok@mail.ru'),
(6, 'Gianis', 'Anteketopo', '', 'vvvs@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `teams`
--

CREATE TABLE `teams` (
  `team_id` int NOT NULL,
  `team_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `teams`
--

INSERT INTO `teams` (`team_id`, `team_name`) VALUES
(1, 'Майями'),
(2, 'Кливленд'),
(3, 'Лейкерс'),
(4, 'Клиперс'),
(5, 'Сакраменто');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`c_id`);

--
-- Индексы таблицы `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`);

--
-- Индексы таблицы `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `contracts`
--
ALTER TABLE `contracts`
  MODIFY `c_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `teams`
--
ALTER TABLE `teams`
  MODIFY `team_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
