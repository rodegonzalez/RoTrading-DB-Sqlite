
-- Query: SELECT * FROM rotrading.operations LIMIT 0, 1000

-- Date: 2024-07-31 12:00
-- -------------------------
INSERT INTO `positions` (`id`, `block`, `creation`,`datetimein`,`datetimeout`,`buysell`,`pricein`,`priceout`,`ticks`,`contracts`,`commision`,`euros`,`dollareuro`,`imagepath`, `divisaid`,`accountid`,`status`, `patternid`, `setupid`, `pattern`, `setup`,`tickerid`,`brokerid`,`tppid`,`marketid`,`temporal`) VALUES 
(1,'B001','2023-04-04 00:00:00','2023-04-04 00:00:00','2023-04-04 00:00:00','buy',100.00,180.0,80,1,4.5,80.0,1.090000,' ',2,1,'closed',1,1,"Cont","FV VD-r",1,1,1,1,'m5'), 
(2,'B001','2023-04-04 00:00:00','2023-04-04 00:00:00','2023-04-04 00:00:00','sell',90.00,80.0,-19,1,4.5,-50.0,1.081700,' ',2,1,'closed',1,1,"Facilidad","VD-r",1,1,1,1,'m5');

INSERT INTO `positions` (`id`, `block`, `datetimein`, `datetimeout`, `buysell`,`pricein`, `contracts`,`commision`, `divisaid`,`accountid`,`status`, `patternid`, `setupid`, `pattern`, `setup`, `tickerid`,`brokerid`,`tppid`,`marketid`,`temporal`) VALUES 
(3,'B001','2023-04-04 00:00:00','2000-01-01 00:00:00','buy',100.00,1,4.5,2,1,'opened',1,1,"Giro","VD-r",1,1,1,1,'m5'), 
(4,'B001','2023-04-04 00:00:00','2000-01-01 00:00:00','sell',90.00,1,4.5,2,1,'opened',1,1,"Cont","FV VD-r",1,1,1,1,'m5');