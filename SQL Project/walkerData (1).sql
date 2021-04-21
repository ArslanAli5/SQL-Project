/*
Imperial Walker Data for stormtrooper_java Database
Created by Gene Locklear
*/

SELECT 'Accessing Walker Data File' AS Msg;
SELECT SLEEP(2)AS 'Script Preparing....';
-- Populating Imperial Walker Types
SELECT 'Populating Walker Types' AS MSG;
SELECT SLEEP(5) AS 'LOADING....';
INSERT INTO imperial_walker_type VALUES('H1','AT-AT',20,22,5,125,5,24,12,720);
INSERT INTO imperial_walker_type VALUES('S1','AT-ST',5,2,2,8,2,4,30,200);
SELECT 'Population of Walker Types Complete' AS MSG;
SELECT SLEEP(2) AS 'LOADING....';
-- Populating Walker Units
SELECT 'Populating Walker Units' AS MSG;
SELECT SLEEP(5) AS 'LOADING....';
INSERT INTO walker_units VALUES('WU01','BG_1',50,0);
INSERT INTO walker_units VALUES('WU02','BG_1',40,0);
INSERT INTO walker_units VALUES('WSU01','BG_1',30,0);
INSERT INTO walker_units VALUES('WU04','BG_2',10,10);
INSERT INTO walker_units VALUES('WU05','BG_2',20,20);
INSERT INTO walker_units VALUES('WSU02','BG_2',30,30);
SELECT 'Population of Walker Units Complete' AS MSG;
SELECT SLEEP(2) AS 'LOADING...';
-- Populating Walkers
SELECT 'Populating Walker' AS MSG;
SELECT SLEEP(5) AS 'LOADING....';
INSERT INTO imperial_walkers_assign VALUES('W1','WU01','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W2','WU01','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W3','WU01','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W4','WU01','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W5','WU01','AT-AT','Damaged');
INSERT INTO imperial_walkers_assign VALUES('W6','WU01','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W7','WU01','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W8','WU01','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W9','WU01','AT-AT','Damaged');
INSERT INTO imperial_walkers_assign VALUES('W10','WU01','AT-AT','Operational');
SELECT SLEEP(1) AS 'LOADING....';
INSERT INTO imperial_walkers_assign VALUES('W11','WU02','AT-AT','Damaged');
INSERT INTO imperial_walkers_assign VALUES('W12','WU02','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W13','WU02','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W14','WU02','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W15','WU02','AT-AT','Damaged');
INSERT INTO imperial_walkers_assign VALUES('W16','WU02','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W17','WU02','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W18','WU02','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W19','WU02','AT-AT','Damaged');
INSERT INTO imperial_walkers_assign VALUES('W20','WU02','AT-AT','Operational');
SELECT SLEEP(1) AS 'LOADING....';
INSERT INTO imperial_walkers_assign VALUES('W21','WU04','AT-AT','Damaged');
INSERT INTO imperial_walkers_assign VALUES('W22','WU04','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W23','WU04','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W24','WU04','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W25','WU04','AT-AT','Damaged');
INSERT INTO imperial_walkers_assign VALUES('W26','WU04','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W27','WU04','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W28','WU04','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W29','WU04','AT-AT','Damaged');
INSERT INTO imperial_walkers_assign VALUES('W30','WU04','AT-AT','Operational');
SELECT SLEEP(1) AS 'LOADING....';
INSERT INTO imperial_walkers_assign VALUES('W31','WU05','AT-AT','Damaged');
INSERT INTO imperial_walkers_assign VALUES('W32','WU05','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W33','WU05','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W34','WU05','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W35','WU05','AT-AT','Damaged');
INSERT INTO imperial_walkers_assign VALUES('W36','WU05','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W37','WU05','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W38','WU05','AT-AT','Operational');
INSERT INTO imperial_walkers_assign VALUES('W39','WU05','AT-AT','Damaged');
INSERT INTO imperial_walkers_assign VALUES('W40','WU05','AT-AT','Operational');

INSERT INTO imperial_walkers_assign VALUES('SW1','WSU01','AT-ST','Operational');
INSERT INTO imperial_walkers_assign VALUES('SW2','WSU01','AT-ST','Operational');
INSERT INTO imperial_walkers_assign VALUES('SW3','WSU01','AT-ST','Damaged');
INSERT INTO imperial_walkers_assign VALUES('SW4','WSU01','AT-ST','Damaged');
INSERT INTO imperial_walkers_assign VALUES('SW5','WSU01','AT-ST','Damaged');
INSERT INTO imperial_walkers_assign VALUES('SW6','WSU01','AT-ST','Operational');
INSERT INTO imperial_walkers_assign VALUES('SW7','WSU01','AT-ST','Operational');
INSERT INTO imperial_walkers_assign VALUES('SW8','WSU01','AT-ST','Operational');
INSERT INTO imperial_walkers_assign VALUES('SW9','WSU01','AT-ST','Damaged');
INSERT INTO imperial_walkers_assign VALUES('SW10','WSU01','AT-ST','Operational');
SELECT SLEEP(1) AS 'LOADING....';
INSERT INTO imperial_walkers_assign VALUES('SW11','WSU02','AT-ST','Operational');
INSERT INTO imperial_walkers_assign VALUES('SW12','WSU02','AT-ST','Operational');
INSERT INTO imperial_walkers_assign VALUES('SW13','WSU02','AT-ST','Operational');
INSERT INTO imperial_walkers_assign VALUES('SW14','WSU02','AT-ST','Operational');
INSERT INTO imperial_walkers_assign VALUES('SW15','WSU02','AT-ST','Damaged');
INSERT INTO imperial_walkers_assign VALUES('SW16','WSU02','AT-ST','Operational');
INSERT INTO imperial_walkers_assign VALUES('SW17','WSU02','AT-ST','Operational');
INSERT INTO imperial_walkers_assign VALUES('SW18','WSU02','AT-ST','Operational');
INSERT INTO imperial_walkers_assign VALUES('SW19','WSU02','AT-ST','Damaged');
INSERT INTO imperial_walkers_assign VALUES('SW20','WSU02','AT-ST','Operational');
SELECT 'Population of Walker Complete' AS MSG;

SELECT 'Java DB Gurus... Walker Data Population is now Complete' AS MSG;

SELECT 'Java DB Gurus... DATABASE CREATED AND POPULATED' AS MSG;

-- REPLACE THE NEXT LINE OF CODE WITH THE FILEPATH TO YOUR DBCONFIRM.SQL FILE
source C:\\Users\\msgth\\Desktop\\AA_DBProgrammingFall2020\\StormtrooperDB\\dbConfirm.sql
