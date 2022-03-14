PRAGMA synchronous = OFF;
PRAGMA journal_mode = MEMORY;
BEGIN TRANSACTION;
CREATE TABLE `user` (
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `name` varchar(255) DEFAULT NULL
,  `token` varchar(255) DEFAULT NULL
,  `leader_card_id` integer DEFAULT NULL
,  UNIQUE (`token`)
);
CREATE TABLE `room` (
  `room_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `live_id` integer NOT NULL
,  `joined_user_count` integer NOT NULL
,  `max_user_count` integer NOT NULL
,  `is_start` BOOLEAN NOT NULL
);
CREATE TABLE `room_member` (
  `room_member_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `room_id` integer NOT NULL
,  `user_id` integer NOT NULL
,  `select_difficulty` integer NOT NULL
,  `is_host` BOOLEAN NOT NULL
,  `judge_miss` integer NOT NULL
,  `judge_bad` integer NOT NULL
,  `judge_good` integer NOT NULL
,  `judge_great` integer NOT NULL
,  `judge_perfect` integer NOT NULL
,  `score` integer NOT NULL
,  FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE
,  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
);
END TRANSACTION;