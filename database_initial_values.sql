-- -------------------------
-- INITIAL VALUES
-- -------------------------
INSERT INTO divisas (iddivisa,name) VALUES (1,"dollar"),(2,"euro");
INSERT INTO brokers (idbroker,name) VALUES (1,"iBroker");
INSERT INTO accounts (name,description, status, type,  idbroker,iddivisa) VALUES 
("iBroker","111000-A", "active","personal",1,2),
("AOP","AOP8000180", "not-active","funded",1,2);
