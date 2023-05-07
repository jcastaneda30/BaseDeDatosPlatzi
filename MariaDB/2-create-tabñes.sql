CREATE TABLE `lines` (
  `id` bigint(20) UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `color` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `trains` (
  `serial_number` varchar(10) PRIMARY KEY NOT NULL,
  `line_id` bigint(20) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL,
  `year` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `stations` (
  `id` bigint(20) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `lines_stations` (
  `id` bigint(20) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `line_id` bigint(20) unsigned NOT NULL,
  `station_id` bigint(20) unsigned NOT NULL
);
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `locations` (
  `id` bigint(20) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `station_id` bigint(20) unsigned NOT NULL,
  `location` point NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `drivers` (
  `id` bigint(20) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `status` boolean NOT NULL DEFAULT false,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
CREATE TABLE `active_drivers` (
  `id` bigint(20) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `driver_id` bigint(20) unsigned NOT NULL,
  `status` boolean NOT NULL DEFAULT false,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `trains` ADD FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `lines_stations` ADD FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `lines_stations` ADD FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `locations` ADD FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `active_drivers` ADD FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
