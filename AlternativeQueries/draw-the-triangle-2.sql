DELIMITER $$
CREATE PROCEDURE P(p1 INT)
BEGIN
SET @count:=1;
WHILE @count<=p1 do
SELECT repeat('* ',@count);
SET @count:=@count+1;
END WHILE;
END $$
DELIMITER ;
 
CALL P(20);