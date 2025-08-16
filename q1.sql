USE Lab2;
DELIMITER //
CREATE PROCEDURE ListAllSubscribers()
BEGIN
	DECLARE sub_name varchar(200);
    DECLARE done INT DEFAULT FALSE;
	DECLARE sub_cursor CURSOR FOR SELECT SubscriberName FROM Subscribers;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done  = TRUE;
    OPEN sub_cursor;
    read_loop: LOOP
		FETCH sub_cursor into sub_name;
        IF done THEN 
			LEAVE read_loop;
        END IF;
        SELECT sub_name as Subscriber_Name;
	END LOOP;
	CLOSE sub_cursor;

END //

DELIMITER ;
CALL ListAllSubscribers();