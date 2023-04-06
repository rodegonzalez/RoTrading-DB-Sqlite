/*
-- Query: SELECT * FROM rotrading.operations
LIMIT 0, 1000

-- Date: 2023-04-04 23:05
*/
INSERT INTO `positions` (`idoperation`,`creation`,`datetimein`,`datetimeout`,`buysell`,`pricein`,`priceout`,`ticks`,`contracts`,`commision`,`euros`,`dollareuro`,`imagepath`,`iddivisa`,`idaccount`,`status`, `pattern`, `setup`, `ticker`) VALUES 
(1,'2023-04-04 00:00:00','2023-04-04 00:00:00','2023-04-04 00:00:00','buy',100.000000,180.000000,80,1,5.000000,80.000000,1.090000,' ',2,1,'opened', 'G','VD-i','MCL'), 
(2,'2023-04-04 00:00:00','2023-04-04 00:00:00','2023-04-04 00:00:00','sell',90.000000,80.000000,-19,1,5.000000,-50.000000,1.081700,' ',2,1,'closed', 'G','VD-i','6E'),
(3,'2023-04-05 14:30:00','2023-04-05 14:30:00','2023-04-05 15:10:00','buy',100.000000,180.000000,80,1,5.000000,80.000000,1.090000,' ',2,1,'closed', 'C','VD-r','MCL');
