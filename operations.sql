
-- Query: SELECT * FROM rotrading.operations LIMIT 0, 1000

-- Date: 2024-08-09
-- -------------------------

INSERT INTO sessions (`id`,`usdeur`,`haspositions`) values ('20240809',0.92,1);
INSERT INTO `positions` (`sessionid`,`tppid`,`block`,`blocksecuence`,`timein`,`timeout`,`buysell`,`pricein`,`priceout`,`opresultticks`,`contracts`,`commission`,`opresult`,`divisaid`,`accountid`, `pattern1id`,`pattern2id`, `setup1id`, `setup2id`,`tickerid`,`status`) VALUES 
('20240809',1,'B01',1,'14:00','14:30','buy',100.00,180.0,80,1,4.5,80.0,1,1,1,'G',1,"m5",1,'opened'), 
('20240809',1,'B01',2,'14:40','14:55','sell',90.00,80.0,-19,1,4.5,-50.0,1,1,2,'F',1,"m3",1,'closed');
