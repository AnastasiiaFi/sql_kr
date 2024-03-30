CREATE DATABASE IF NOT EXISTS homework_06;
USE homework_06;


/*
Задание 01
Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'
*/
DROP PROCEDURE IF EXISTS format_seconds;
DELIMITER $$
CREATE PROCEDURE format_seconds(seconds INT)

BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE secs INT;
    DECLARE result VARCHAR(512);

    SET days = FLOOR(seconds / (24 * 3600));
    SET seconds = seconds % (24 * 3600);
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    SET minutes = FLOOR(seconds / 60);
    SET secs = seconds % 60;
    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', secs, ' seconds');

    SELECT result;
END;

CALL format_seconds(123456789);




/*
Задание 02
Выведите только четные числа от 1 до 10 (Через цикл).
Пример: 2,4,6,8,10
*/
DROP PROCEDURE IF EXISTS print_numbers;
DELIMITER $$
CREATE PROCEDURE print_numbers (IN max_number INT)
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE result VARCHAR(100) DEFAULT " ";

    REPEAT
        IF counter % 2 = 0 THEN
            SET result = CONCAT(result, " ", counter);
        END IF;
        SET counter = counter + 1;
		UNTIL counter > max_number
	END REPEAT;

    SELECT result;
END ;

CALL print_numbers(10);


