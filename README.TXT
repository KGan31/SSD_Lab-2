Assumptions and execution steps for all Questions:
Initally load all schema and data from the given Assignment pdf.

1) q1.sql: Execute q1.sql and then execute command
    CALL ListAllSubscribers();
    Here all the subscriber names are listed in differnt sets.

2) q2.sql: Execute q2.sql and then execute command
    CALL GetWatchHistoryBySubscriber(<sub_id>);

    Assumption: If the SubscriberId has no watch history then printing "Subscriber <sub_id> has no watch history".

3) q3.sql: Execute q3.sql and then execute command 
    CALL AddSubscriberIfNotExists(<subName>);

    Assumption: The new Subscriber will have current date as the subscription date and the (total_rows + 1) as the primary key.

4) q4.sql: Execute q4.sql and then execute command 
    CALL SendWatchTimeReport();

5) q5.sql: Execute q5.sql and then execute command 
    CALL SendWatchTimeReportForAll();

    Assumption: The only difference in q5 and q4 is that in q4 we only print watch history for subscribers who have non empty watch history. Whereas in q5 we print history for all subscribers irrespective of whether they have watch history or not. In case they don't then "Subscriber <sub_id> has no watch history is printed


