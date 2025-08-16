USE Lab2;
DELIMITER //
CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
	IF EXISTS (SELECT 1 FROM WatchHistory WHERE SubscriberID = sub_id) THEN
        SELECT sub_id as SubscriberID, Title, WatchTime FROM WatchHistory AS wh JOIN Shows AS sh ON wh.ShowID = sh.ShowID WHERE wh.SubscriberID = sub_id;
    ELSE
        SELECT CONCAT('Subscriber ', sub_id, ' has no watch history.') AS Message;
    END IF;
END //

DELIMITER ;
CALL GetWatchHistoryBySubscriber(1);