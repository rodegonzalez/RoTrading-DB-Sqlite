-- -------------------------
-- INITIAL VALUES

-- Date: 2024-07-21 12:00
-- -------------------------
INSERT INTO divisas (id, name) VALUES (1,"dollar"),(2,"euro");
INSERT INTO tpp (id,name) VALUES (1,"tpp default");
INSERT INTO brokers (id, name, status) VALUES (1,"iBroker", "current");

INSERT INTO accounts (id, name,description, status, acctype, brokerid, divisaid) VALUES 
(1,"iBroker","111000-A", "active","REAL",1,1),
(2,"AOP","AOP8000180", "not-active","Funded",1,1);

INSERT INTO positions_pattern (id, name, description) VALUES 
(1,"G","Giro"),
(2,"C","Continuación");

INSERT INTO positions_setup (id, name, description) VALUES 
(1,"F","Falta de volumen"),
(2,"VD-i","Vela direccional - interior"),
(3,"VD-A1","Vela direccional - A1"),
(4,"VD-B3","Vela direccional - B3"),
(5,"VD-r","Vela direccional - rechazo");

INSERT INTO markets (id, name, description) VALUES 
(1,"nymex","Nymex"),
(2,"globex","Globex"),
(3,"eurex","Eurex");

INSERT INTO tickers (id, name, marketid, description, tictype) VALUES 
(1,"MCL", 1, "Micro Crude Oil", "energies"),
(2,"CL", 1, "Crude Oil", "energies"),
(3,"QM", 1, "Mini Crude Oil", "energies"),
(4,"YM", 2, "YM", "indices"),
(5,"6E", 2, "EURUSD", "forex");
