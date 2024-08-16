-- 2024-08-09
-- 2024-08-11
-- 2024-08-14
-- 2024-08-16
-- -------------------------

INSERT INTO tpps (`id`, `name`) VALUES (1,"tpp 1"), (2,"tpp 2");
INSERT INTO sessions (`id`,`usdeur`) values (20240809,0.92),(20240811,0.93);
INSERT INTO tppblocks (id, tppid, tppblocksec) VALUES (1,1,1), (2,2,1);
INSERT INTO tppblocksecuences (id, tppid, tppblocksec,sec, positionid) VALUES (1,1,1,1,1),(2,1,1,2,2),(3,1,1,3,3),(4,2,1,1,4);


-- TODO:
-- Cambiar pattern1id a highpattern
-- Cambiar pattern2id a pattern
-- Cambiar setup1id a setup
-- Cambiar setup2id a setuptemporality
INSERT INTO `positions` (`id`,`sessionid`,`tppid`,`tppblocksec`,`sec`,`timein`,`timeout`,`buysell`,`pricein`,`priceout`,`opresultticks`,`contracts`,
`commission`,`opresult`,`usdeur`,`divisaid`,`accountid`,
 `pattern1id`,`pattern2id`, `setup1id`, `setup2id`,`tickerid`,`status`) VALUES 
(1,20240809,1,1,1, '14:00','14:30','buy',100.00,180.0, 80,1, 4.5,80.0,0.92,1,1,   1,'Giro',"m5",1, 1,'opened'), 
(2,20240809,1,1,2, '14:40','14:55','sell',90.00,80.0, -19,1, 4.5,-50.0,0.92,1,1,   2,'Fac',"m3",1, 1,'opened'),
(3,20240811,1,1,3, '14:00','14:30','buy',100.00,180.0, 80,1, 4.5,80.0,0.92,1,1,  1,'Giro',"m5",1, 1,'closed'), 
(4,20240811,2,1,1, '14:40','14:55','sell',90.00,80.0, -19,1, 4.5,-50.0,0.92,1,1,   1,'Cont',"m3",1, 1,'opened');
