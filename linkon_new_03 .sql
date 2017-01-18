--============================================================================================================================================================
-- Database Mini Project On "Cricket League Auction Management System" by MD: Ruhul Amin Linkon; Roll: 1307043
--============================================================================================================================================================


---- Deleting the following table if they exist in the database previously.
drop table bidding ;
drop table owner ;
drop table team ;
drop table player ;

----Table PLAYER
create table PLAYER (
player_id number (20) NOT NULL,
name varchar(50),
nationality varchar(20),
matches_played number (10),
player_type varchar (20),
price number (15)
--PRIMARY KEY (player_id)
);

----Deleting,Adding & Renaming Of Columns
ALTER TABLE PLAYER RENAME COLUMN name TO player_name;
ALTER TABLE PLAYER DROP COLUMN price;
ALTER TABLE PLAYER ADD base_price number (10);

----Adding constaraints into TABLE PLAYER
ALTER TABLE PLAYER ADD CONSTRAINT p_id PRIMARY KEY(player_id);


----Table TEAM
create table TEAM (
team_name varchar (20) NOT NULL,
player_id number(20) NOT NULL,
player_name varchar(50),
owner_name varchar(50),
sold_price number(20)
--PRIMARY KEY (team_name),
--FOREIGN KEY (player_id) REFERENCES PLAYER (player_id)
);

----Adding constaraints into TABLE TEAM
ALTER TABLE TEAM ADD CONSTRAINT t_name PRIMARY KEY(team_name);

ALTER TABLE TEAM ADD CONSTRAINT p_id_2 
FOREIGN KEY (player_id) REFERENCES PLAYER (player_id) ON DELETE CASCADE;


----Table Owner
create table OWNER (
owner_id number (20) NOT NULL,
team_name varchar (20),
owner_name varchar (20),
account_ballance number (20),
profession varchar (20),
nationality varchar (20)
--PRIMARY KEY (owner_id),
--FOREIGN KEY (team_name) REFERENCES TEAM (team_name)
);

----Adding constaraints into TABLE OWNER
ALTER TABLE OWNER ADD CONSTRAINT o_id PRIMARY KEY(owner_id);

ALTER TABLE OWNER ADD CONSTRAINT t_name_2 
FOREIGN KEY (team_name) REFERENCES TEAM (team_name) ON DELETE CASCADE;

----Modifying Table to Check Fixed Account Ballance for Bidding Of Each Team
ALTER TABLE OWNER MODIFY account_ballance number(9) check(account_ballance<100000000);


----Table Bidding
create table BIDDING (
bidding_id number (10) NOT NULL,
owner_id number (10),
date_of_auction varchar (20),
time_of_auction varchar (20),
auction_room_number varchar (20),
CONSTRAINT b_id PRIMARY KEY(bidding_id)
--PRIMARY KEY (bidding_id),
--FOREIGN KEY (owner_id) REFERENCES OWNER (owner_id)
);

----Adding CONSTRAINT into TABLE BIDDING
----ALTER TABLE BIDDING ADD CONSTRAINT b_id PRIMARY KEY(bidding_id);

ALTER TABLE BIDDING ADD CONSTRAINT o_id_2 
FOREIGN KEY (owner_id) REFERENCES OWNER (owner_id) ON DELETE CASCADE;

----Description Of Each Table...
DESCRIBE bidding ;
DESCRIBE owner;
DESCRIBE team;
DESCRIBE player;



----Inserting Values Into PLAYER Table

INSERT INTO PLAYER VALUES ( 100, 'AB de Villiars' , 'South African' ,50 , 'International',95000);
INSERT INTO PLAYER VALUES ( 101, 'Chris Gayle' , 'West Indian' ,70 , 'International',60000);
INSERT INTO PLAYER VALUES ( 102, 'Virat Kohli' , 'Indian' ,40 , 'Local',90000);
INSERT INTO PLAYER VALUES ( 103, 'Shaheed Afridi' , 'Pakistan' ,80 , 'International',60000);
INSERT INTO PLAYER VALUES ( 104, 'Sakib Al Hasan' , 'Bangladesh' ,68 , 'International',70000);
INSERT INTO PLAYER VALUES ( 105, 'Mustafizur Rahman' , 'Bangladesh' ,30 , 'International',75000);
INSERT INTO PLAYER VALUES ( 106, 'Michel Starc' , 'Australian' ,45 , 'International',55000);
INSERT INTO PLAYER VALUES ( 107, 'Goutam Gambhir' , 'Indian' ,50 , 'Local',40000);
INSERT INTO PLAYER VALUES ( 108, 'Suresh Rayna' , 'Indian' ,60 , 'Local',65000);
INSERT INTO PLAYER VALUES ( 109, 'Kumar Sangakara' , 'Srilankan' ,62 , 'International',60000);
INSERT INTO PLAYER VALUES ( 110, 'Mohammad Amir' , 'Pakistan' ,66 , 'International',65000);
INSERT INTO PLAYER VALUES ( 111, 'David Warner' , 'Australian' ,75 , 'International',45000);
INSERT INTO PLAYER VALUES ( 112, 'Mohammad Nabi' , 'Afganistan' ,72 , 'International',40000);
INSERT INTO PLAYER VALUES ( 113, 'Sayeed Ajmal' , 'Pakistan' ,60 , 'International',75000);
INSERT INTO PLAYER VALUES ( 114, 'Mutthaya Muralidharan' , 'Srilankan' ,70 , 'International',85000);

----Inserting Values Into Team Table
INSERT INTO TEAM VALUES ( 'RCB',100,'AB de Villiars',' VIJOY MALIYA',5000000);
----INSERT INTO TEAM VALUES ( 'RCB',102,'Virat Kohli',' VIJOY MALIYA',3000000);

INSERT INTO TEAM VALUES ( 'KKR',101,'Chris Gayle','SHAH RUKH KHAN',2500000);
----INSERT INTO TEAM VALUES ( 'KKR',104,'Sakib Al Hasan','SHAH RUKH KHAN',3500000);

INSERT INTO TEAM VALUES ( 'MI',114,'Mutthaya Muralidharan','MUKESH AMBANI',3700000);
----INSERT INTO TEAM VALUES ( 'MI',113,'Sayeed Ajmal','MUKESH AMBANI',4200000);

INSERT INTO TEAM VALUES ( 'XXIP',111,'David Warner','PRITY JINTA',3200000);
----INSERT INTO TEAM VALUES ( 'XXIP',109,'Kumar Sangakara','PRITY JINTA',4800000);

INSERT INTO TEAM VALUES ( 'SRH',106,'Michel Starc','SHEKHAR ROY',4500000);
----INSERT INTO TEAM VALUES ( 'SRH',108,'Suresh Rayna','SHEKHAR ROY',4100000);

----Inserting Values Into OWNER Table
INSERT INTO OWNER VALUES ( 500, 'RCB' , ' VIJOY MALIYA', 90000000 ,'BUSINESSMAN','INDIAN');
INSERT INTO OWNER VALUES ( 501, 'KKR' , 'SHAH RUKH KHAN',90000000,'ACTOR' ,'INDIAN');
INSERT INTO OWNER VALUES ( 502, 'MI' , 'MUKESH AMBANI',90000000,'BUSINESSMAN' ,'INDIAN');
INSERT INTO OWNER VALUES ( 503, 'XXIP' , 'PRITY JINTA',90000000,'ACTRESS' ,'INDIAN');
INSERT INTO OWNER VALUES ( 504, 'SRH' , 'SHEKHAR ROY',90000000,'ENTERPRENAUR' ,'INDIAN');

----Inserting Values Into BIDDING Table
INSERT INTO BIDDING VALUES ( 1000, 500 , '16-08-2016', '6 P.M.', 100);
INSERT INTO BIDDING VALUES ( 1001, 501 , '16-08-2016', '6 P.M.', 100);
INSERT INTO BIDDING VALUES ( 1002, 502 , '16-08-2016', '6 P.M.', 100);
INSERT INTO BIDDING VALUES ( 1003, 503 , '16-08-2016', '6 P.M.', 100);
INSERT INTO BIDDING VALUES ( 1004, 504 , '16-08-2016', '6 P.M.', 100);

INSERT INTO BIDDING VALUES ( 1005, 501 , '16-04-2016', '6 P.M.', 101);
INSERT INTO BIDDING VALUES ( 1006, 502 , '16-04-2016', '6 P.M.', 102);

----Select Operations on all the Exixting Tables
SELECT * FROM bidding;
SELECT * FROM owner;
SELECT * FROM team;
SELECT * FROM player;


----Finding players whose base price is  more than 70,000/=
SELECT player_name from PLAYER WHERE base_price>70000;


----Finding player name & his country who played game from 50 to 100 
SELECT player_name,nationality from PLAYER WHERE matches_played BETWEEN 50 and 100;


--Finding owner name of those who are actors in profession
--Problem !!!!
SELECT owner_name,profession from OWNER WHERE profession LIKE ‘%BUSINESSMAN%’;


----Player details in ascending & descinding order
SELECT player_name,base_price,player_type from PLAYER ORDER BY matches_played desc;
SELECT player_name,base_price,player_type from PLAYER ORDER BY matches_played asc;


----To find the player who had played highest match
SELECT MAX(matches_played) FROM PLAYER;


----Use of different aggregate functions
SELECT COUNT(*),MAX(matches_played),MAX(base_price),AVG(matches_played),AVG(base_price),MIN(base_price),SUM(matches_played) from PLAYER;

SELECT player_name, COUNT(matches_played) FROM PLAYER GROUP BY player_name;
SELECT player_name, COUNT(matches_played) FROM PLAYER WHERE base_price>60000 GROUP BY player_name;


----To find specific owner using owner ID
SELECT team_name,owner_name FROM OWNER WHERE owner_id IN (500,501);


----Subquery, How to make subquery from two tables ??

SELECT owner_name,team_name FROM OWNER WHERE owner_id=502;


----Different Subquery Operations
SELECT team_name,player_name FROM TEAM WHERE team_name IN(SELECT team_name FROM OWNER WHERE owner_id BETWEEN 500 AND 510);
SELECT team_name,player_name FROM TEAM WHERE team_name IN(SELECT team_name FROM OWNER WHERE owner_id NOT BETWEEN 500 AND 510);


----Subquery Operations using Alias
SELECT t.team_name,t.player_name FROM TEAM t WHERE t.team_name IN(SELECT o.team_name FROM OWNER o WHERE o.owner_id>500 OR o.owner_id<510) ;


----All the players in player & team tables using UNION ALL
SELECT player_id,player_name FROM TEAM UNION ALL SELECT player_id,player_name FROM PLAYER;


----All the players in player & team tables using UNION 
SELECT player_id,player_name FROM TEAM UNION SELECT player_id,player_name FROM PLAYER;


----To find The Sold palyers in the bidding
SELECT player_id,player_name FROM PLAYER INTERSECT SELECT player_id,player_name FROM TEAM;


----To find Unsold Palyers in Bidding
SELECT player_id,player_name FROM PLAYER MINUS SELECT player_id,player_name FROM TEAM;


----Player Deatails using JOIN
SELECT t.team_name,t.sold_price,t.player_name,p.player_name,p.base_price,p.player_type FROM TEAM t JOIN PLAYER p ON t.player_name=p.player_name;

----Player Deatails in JOIN with USING
SELECT player_name,t.team_name,t.sold_price,p.base_price,p.player_type FROM TEAM t JOIN PLAYER p USING(player_name);

----Player Deatails using NATURAL JOIN
SELECT player_name,t.team_name,t.sold_price,p.base_price,p.player_type FROM TEAM t NATURAL JOIN PLAYER p;

----Player Deatails using CROSS JOIN
SELECT P.player_name,t.team_name,t.sold_price,p.base_price,p.player_type FROM TEAM t CROSS JOIN PLAYER p;

----Player Deatails using INNER JOIN
SELECT t.team_name,t.sold_price,t.player_name,p.player_name,p.base_price,p.player_type FROM TEAM t INNER JOIN PLAYER p ON t.player_name=p.player_name;

----Player Deatails using LEFT OUTER JOIN
SELECT t.team_name,t.sold_price,t.player_name,p.player_name,p.base_price,p.player_type FROM TEAM t LEFT OUTER JOIN PLAYER p ON t.player_name=p.player_name;

----Player Deatails using RIGHT OUTER JOIN
SELECT t.team_name,t.sold_price,t.player_name,p.player_name,p.base_price,p.player_type FROM TEAM t RIGHT OUTER JOIN PLAYER p ON t.player_name=p.player_name;

----Player Deatails using FULL OUTER JOIN
SELECT t.team_name,t.sold_price,t.player_name,p.player_name,p.base_price,p.player_type FROM TEAM t FULL OUTER JOIN PLAYER p ON t.player_name=p.player_name;


----PL/SQL Operation to find Vat for Each Sold Player

SET SERVEROUTPUT ON
DECLARE
vat_price TEAM.sold_price%type;
name VARCHAR2(100);

BEGIN
name := 'Chris Gayle';
SELECT sold_price INTO vat_price
FROM TEAM
WHERE player_name like name ;
IF vat_price < 3000000 THEN
vat_price := vat_price*0.05;
ELSIF vat_price>=3000000 and vat_price<4000000 THEN
vat_price := vat_price*0.07;
ELSIF vat_price>=4000000 and vat_price<5000000 THEN
vat_price := vat_price*0.09;
ELSE
vat_price := vat_price*0.1; 
END IF;
DBMS_OUTPUT.PUT_LINE ('Total Vat For ' || name || ' is : '|| vat_price 
);
EXCEPTION
WHEN others THEN
DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/
SHOW errors


----Cursur to find out all the International Players in Player Table

SET SERVEROUTPUT ON
DECLARE
	CURSOR playertype IS SELECT player_name,nationality,base_price,matches_played FROM PLAYER WHERE player_type='International';
	accessVar	     playertype%ROWTYPE;
	rowCounting int;
BEGIN
	OPEN playertype;
	SELECT COUNT(*) INTO rowCounting FROM  PLAYER WHERE player_type='International';
	DBMS_OUTPUT.PUT_LINE('PLAYER NAME   NATIONALITY       BASE PRICE            MATCHES PLAYED');
	DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
	LOOP

		FETCH playertype INTO accessVar;
		DBMS_OUTPUT.PUT_LINE(accessVar.player_name || '      ' || accessVar.nationality || '    ' || accessVar.base_price || '      ' || accessVar.matches_played);
		DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
EXIT WHEN playertype%ROWCOUNT>rowCounting-1;
	END LOOP;
	CLOSE playertype;
END;
/


----Update Into PLAYER Table  Using PROCEDURE

CREATE OR REPLACE PROCEDURE Updateplayer(pid PLAYER.player_id%type, pn PLAYER.player_name%type, nat PLAYER.nationality%type, mp PLAYER.matches_played%type, pt PLAYER.player_type%type,bp PLAYER.base_price%type) IS
BEGIN
	UPDATE PLAYER SET player_name=pn,nationality=nat,matches_played=mp,player_type=pt,base_price=bp WHERE player_id=pid;
	commit;
END Updateplayer;
/

----Calling the PROCEDURE for Updating into PLAYER Table

SET SERVEROUTPUT ON
BEGIN
	Updateplayer(112, 'Mohammad Nabi' , 'Pakistan' ,72 , 'International',40000);
END;
/

SELECT * FROM PLAYER;

----Deleting A Player From PLAYER table Using Procedure

CREATE OR REPLACE PROCEDURE Delatingplayer(pid NUMBER) IS
BEGIN
	DELETE FROM PLAYER WHERE player_id=pid;
	commit;
END Delatingplayer;
/

----Calling the PROCEDURE for Delating from PLAYER
SET SERVEROUTPUT ON
BEGIN
	Delatingplayer(113);
END;
/

SELECT * FROM PLAYER;


----Selling Price Of Any Player using ID in FUNCTION

CREATE OR REPLACE FUNCTION Saleprice(pid2 TEAM.player_id%type) RETURN NUMBER IS
	price TEAM.sold_price%type;
BEGIN
	SELECT sold_price INTO price FROM TEAM WHERE player_id=pid2;
	RETURN price;
END Saleprice;
/

----Calling the FUNCTION for Calculating Sold Price 

SET SERVEROUTPUT ON
DECLARE
	id TEAM.player_id%type;
BEGIN
	DBMS_OUTPUT.PUT_LINE('The Sale Price For Player ID-111 is : '||Saleprice('111'));
END;
/


----Transaction Management Operations
---- Rollback Operation

SELECT * FROM TEAM;
DELETE FROM TEAM;
SELECT * FROM TEAM;
ROLLBACK;
SELECT * FROM TEAM;

--Savepoint Operation
INSERT INTO OWNER VALUES(505, 'PW' , 'KUNTI ROY',90000000,'BUSINESSMAN' ,'INDIAN');
SAVEPOINT INSERT1;
INSERT INTO OWNER VALUES(506, 'HR' , 'M.KUMAR',90000000,'ACTOR' ,'INDIAN');
SAVEPOINT INSERT2;
INSERT INTO OWNER VALUES(507, 'CE' , 'M.MITTAL',90000000,'BUSINESSMAN' ,'INDIAN');
SAVEPOINT INSERT3;

ROLLBACK TO INSERT1;

SELECT * FROM OWNER;

  --<<<<<<<<<<======================================((((((((()))))))))===================================================>>>>>>>