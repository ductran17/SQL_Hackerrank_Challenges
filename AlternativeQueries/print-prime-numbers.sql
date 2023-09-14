DELIMITER $$
CREATE PROCEDURE Prime(p1 int)
BEGIN
SET @count:=3;
SET @num:=2;
SET @result:='2';
SET @isPrime:=1;
loop1: WHILE @count<=p1 do
    loop2: WHILE @num<=SQRT(@count) do
        IF mod(@count,@num)=0 THEN
            SET @isPrime:=0;
            LEAVE loop2;
        END IF;
        SET @num:=@num+1;
    END WHILE loop2;
    IF @isPrime=1 THEN
        SET @result=CONCAT(@result,'&',@count);
    END IF;
    SET @count:=@count+1;
    SET @num:=2;
    SET @isPrime:=1;
END WHILE loop1;

SELECT @result AS primeNumbers;

END$$
DELIMITER ;
                        
CALL Prime(1000);