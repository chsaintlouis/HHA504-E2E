use christest;
show tables;

SELECT * FROM H1N1 LIMIT 15;

delimiter $$
CREATE TRIGGER h1n1_concern_trigger BEFORE INSERT ON H1N1 FOR EACH ROW

BEGIN

IF NEW.h1n1_concern >3 THEN

SIGNAL SQLSTATE '45000'

SET MESSAGE_TEXT ='ERROR: H1N1 CONCERN SHOULD BE A NUMERICAL VALUE BETWEEN 0 AND 3. PLEASE TRY AGAIN'

;END IF;

END $$
#testing to see if trigger works
INSERT INTO H1N1 (h1n1_concern) VALUES (5);
Error Code: 1644. ERROR: H1N1 CONCERN SHOULD BE A NUMERICAL VALUE BETWEEN 0 AND 3. PLEASE TRY AGAIN

