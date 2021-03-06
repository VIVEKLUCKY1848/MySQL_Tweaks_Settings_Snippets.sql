-- Turn on query logging and store logs into table instead of file(default)
SET GLOBAL log_output = 'TABLE';
SET GLOBAL general_log = 'ON';
-- Now open phpMyAdmin and select database "mysql" and go to table "general_log" to find your logged queries
-- Also don't forget to revert these settings or your mysql server might become slow due to clogging of queries into this table.
SET GLOBAL log_output = 'FILE';
SET GLOBAL general_log = 'OFF';


-- Turn on query logging and store queries into file.
SET GLOBAL log_output = 'FILE';
SET GLOBAL general_log_file='<path_to_file.log>';
SET GLOBAL general_log_file='C:\wamp\www\magento1924';
SET GLOBAL general_log = 1;


-- Display all variables having "log" word in their names
SHOW VARIABLES LIKE '%log%';


-- Clean the "general_log" table when you're finished debugging
TRUNCATE TABLE `mysql`.`general_log`;
TRUNCATE `mysql`.`general_log`;
DELETE FROM `mysql`.`general_log` WHERE TRUE;
DELETE FROM `mysql`.`general_log` WHERE 1;
--Or much better way
SET GLOBAL `general_log` = 'OFF';
RENAME TABLE `mysql.general_log` TO `mysql.general_log_temp`;
DELETE FROM `mysql.general_log_temp` WHERE `event_time` < DATE(NOW());
RENAME TABLE `mysql.general_log_temp` TO `mysql.general_log`;
SET GLOBAL `general_log` = 'ON';


-- Show create table query for any table
SHOW CREATE TABLE `<database_name>`.`<table_name>`;
-- examples
SHOW CREATE TABLE `mysql`.`general_log`;
SHOW CREATE TABLE `general_log`;


-- Create table "general_log" inside "mysql" database
CREATE TABLE `general_log` (
 `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `user_host` mediumtext NOT NULL,
 `thread_id` bigint(21) unsigned NOT NULL,
 `server_id` int(10) unsigned NOT NULL,
 `command_type` varchar(64) NOT NULL,
 `argument` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log'
-- Or
CREATE TABLE `mysql`.`general_log` (
 `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `user_host` mediumtext NOT NULL,
 `thread_id` bigint(21) unsigned NOT NULL,
 `server_id` int(10) unsigned NOT NULL,
 `command_type` varchar(64) NOT NULL,
 `argument` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log'
