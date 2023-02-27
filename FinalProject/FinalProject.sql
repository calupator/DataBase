CREATE TABLE IF NOT EXISTS  `education` (
  `edu_id` int(11) PRIMARY KEY AUTO_INCREMENT  COMMENT 'ID программы обучения',
  `type_event` int(11) DEFAULT NULL COMMENT 'Тип программы обучения',
  `edu_name` text COLLATE utf8mb4_unicode_ci COMMENT 'Имя программы обучения',
  `edu_desc` text COLLATE utf8mb4_unicode_ci COMMENT 'Описание программы обучения',
  `time_length` time DEFAULT NULL COMMENT 'Время выполнения',
  `format_edu_id` int(11) DEFAULT NULL COMMENT 'Формат обучения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS  `format_education` (
  `format_edu_id` int(11)  PRIMARY KEY AUTO_INCREMENT COMMENT 'ID формата обучения',
  `format_name` text COLLATE utf8mb4_unicode_ci COMMENT 'Формат обучения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS  `material_list` (
  `material_list_id` int(11) PRIMARY KEY AUTO_INCREMENT COMMENT 'ID материала',
  `task_list` int(11) DEFAULT NULL COMMENT 'ID задания',
  `type_material` int(11) DEFAULT NULL COMMENT 'ID типа материала',
  `material_list_name` text COLLATE utf8mb4_unicode_ci COMMENT 'Название материала',
  `material_list_desc` text COLLATE utf8mb4_unicode_ci COMMENT 'Описание материала'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS  `task_list` (
  `task_list_id` int(11) PRIMARY KEY AUTO_INCREMENT COMMENT 'ID задания',
  `type_task_id` int(11) DEFAULT NULL COMMENT 'Тип задания',
  `edu` int(11) DEFAULT NULL COMMENT 'ID мероприятия',
  `task_desc` text COLLATE utf8mb4_unicode_ci COMMENT 'Описание задания'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `type_event` (
  `type_event_id` int(11)   PRIMARY KEY AUTO_INCREMENT COMMENT 'ID мероприятия',
  `event_name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Описание вида мероприятия'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS  `type_material` (
  `type_material_id` int(11) PRIMARY KEY AUTO_INCREMENT COMMENT 'ID типа материала',
  `material_name` text COLLATE utf8mb4_unicode_ci COMMENT 'Описание типа материала'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `type_task` (
  `task_id` int(11) PRIMARY KEY AUTO_INCREMENT COMMENT 'ID вида задания',
  `task_name` text COLLATE utf8mb4_unicode_ci COMMENT 'Описание вида задания'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `format_education` (`format_edu_id`, `format_name`) VALUES
(NULL, 'Online'),
(NULL, 'Offline');

INSERT INTO `type_event` (`type_event_id`, `event_name`) VALUES
(NULL, 'Хакатон'),
(NULL, 'Конференция'),
(NULL, 'Семинар'),
(NULL, 'Лекция'),
(NULL, 'Практикум');

INSERT INTO `type_material` (`type_material_id`, `material_name`) VALUES
(NULL, 'Видео'),
(NULL, 'Аудио'),
(NULL, 'Текстовые (книги, статьи)'),
(NULL, 'Ссылка');

INSERT INTO `type_task` (`task_id`, `task_name`) VALUES
(NULL, 'Тест'),
(NULL, 'Д/З');

INSERT INTO `education` (`edu_id`, `type_event`, `edu_name`, `edu_desc`, `time_length`, `format_edu_id`) VALUES
(NULL, 2, 'Введение в C# - лекция', 'Введение в программирование на C# - лекция', '02:00:00', 2),
(NULL, 5, 'Введение в C# - семинар', 'Введение в C# + тесты', NULL, 1);

INSERT INTO `task_list` (`task_list_id`, `type_task_id`, `edu`, `task_desc`) VALUES
(NULL, 2, 1, 'Посмотреть видео'),
(NULL, 1, 1, 'Пройти тест по C#'),
(NULL, 2, 1, 'Вполнить д/з по C#'),
(NULL, 1, 2, 'Пройти тест по C#');

INSERT INTO `material_list` (`material_list_id`, `task_list`, `type_material`, `material_list_name`, `material_list_desc`) VALUES
(NULL, 1, 1, 'C# - Начало', 'Вводный курс по C#'),
(NULL, 1, 2, 'C# - Начало', 'Вводный курс по C#'),
(NULL, 1, 3, 'C# - Начало', 'Вводный курс по C#'),
(NULL, 1, 4, 'C# - Начало', 'Вводный курс по C#');


ALTER TABLE `education`
  ADD CONSTRAINT `edu_task_list_fk` FOREIGN KEY (`format_edu_id`) REFERENCES `format_education` (`format_edu_id`);
ALTER TABLE `education`
  ADD CONSTRAINT `edu_type_event_fk` FOREIGN KEY (`type_event`) REFERENCES `type_event` (`type_event_id`);

ALTER TABLE `material_list`
  ADD CONSTRAINT `material_list_task_list_fk` FOREIGN KEY (`task_list`) REFERENCES `task_list` (`task_list_id`);
ALTER TABLE `material_list`
  ADD CONSTRAINT `material_list_type_material_fk` FOREIGN KEY (`type_material`) REFERENCES `type_material` (`type_material_id`);
  
ALTER TABLE `task_list`
  ADD CONSTRAINT `task_list_format_edu_fk` FOREIGN KEY (`edu`) REFERENCES `education` (`edu_id`);
ALTER TABLE `task_list`
  ADD CONSTRAINT `task_list_type_task_fk` FOREIGN KEY (`type_task_id`) REFERENCES `type_task` (`task_id`);


SELECT `task_name`, `task_desc`, `material_name`, `material_list_name`, `material_list_desc`, `format_name`, `time_length` FROM `type_task`, `task_list`, `type_material`, `material_list`, `format_education`, `education` WHERE 1;


SELECT DISTINCT `task_name`, `task_desc`, `material_name`, `material_list_name`, `material_list_desc`, `format_name`, `time_length` FROM `type_task`, `task_list`, `type_material`, `material_list`, `format_education`, `education` WHERE `type_material_id` = 1 ORDER BY `type_task`.`task_name` ASC;

SELECT DISTINCT `task_name`, `task_desc`, `material_name`, `material_list_name`, `material_list_desc`, `format_name`, `time_length` FROM `type_task`, `task_list`, `type_material`, `material_list`, `format_education`, `education` WHERE `type_material_id` = 1 AND `format_name` = "Offline" ORDER BY `type_task`.`task_name` ASC;

SELECT DISTINCT `task_name`, `task_desc`, `material_name`, `material_list_name`, `material_list_desc`, `format_name`, `time_length` FROM `type_task`, `task_list`, `type_material`, `material_list`, `format_education`, `education` WHERE `material_name` = "Аудио" AND `format_name` = "Offline" ORDER BY `type_task`.`task_name` ASC;





