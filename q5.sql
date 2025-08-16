USE Lab2;
DELIMITER //
CREATE PROCEDURE SendWatchTimeReportForAll()
BEGIN
	DECLARE cur_sub_id INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_cursor CURSOR for SELECT SubscriberID from Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done  = TRUE;
    OPEN sub_cursor;
    
    read_loop: LOOP
		FETCH sub_cursor INTO cur_sub_id;
        
        IF done THEN 
            LEAVE read_loop;
        END IF;
        
        CALL GetWatchHistoryBySubscriber(cur_sub_id);
	END LOOP;
	CLOSE sub_cursor;
END //

DELIMITER ;
CALL SendWatchTimeReportForAll();