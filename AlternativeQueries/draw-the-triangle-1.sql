DELIMITER $$
CREATE PROCEDURE P(p1 INT)
BEGIN
SET @count:=p1;
WHILE @count>0 DO
SELECT repeat('* ', @count);
SET @count:=@count-1;
END WHILE;
END$$
DELIMITER ;

CALL P(20);



