USE Lab2;
DELIMITER //
CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE is_present BOOL DEFAULT FALSE;
    DECLARE cur_sub_name VARCHAR(100);
    DECLARE size INT;
    DECLARE sub_cursor CURSOR FOR SELECT SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done  = TRUE;
    
    SELECT COUNT(*) INTO size FROM Subscribers;
    
    OPEN sub_cursor;
    
    read_loop: LOOP
		FETCH sub_cursor INTO cur_sub_name;
        
        IF done THEN 
            LEAVE read_loop;
        END IF;
        
        IF cur_sub_name = subName THEN
			SET is_present = TRUE;
		END IF;
	END LOOP;
    CLOSE sub_cursor;
    IF is_present = FALSE THEN
		INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate) values (size+1, subName, CURDATE());
	END IF;
END //

DELIMITER ;
CALL AddSubscriberIfNotExists('Alice Wan');