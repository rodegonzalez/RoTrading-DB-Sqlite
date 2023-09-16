-- -------------------------
-- INITIAL VALUES
-- -------------------------
INSERT INTO divisas (iddivisa,name) VALUES (1,"dollar"),(2,"euro");
INSERT INTO tpp (idtpp,name) VALUES (1,"tpp default");
INSERT INTO brokers (idbroker,name) VALUES (1,"iBroker");
INSERT INTO accounts (name,description, status, acctype,  idbroker,iddivisa) VALUES 
("iBroker","111000-A", "active","personal",1,2),
("AOP","AOP8000180", "not-active","funded",1,2);

INSERT INTO positions_pattern (pattern, name) VALUES 
("G","Giro"),
("C","Continuación");

INSERT INTO positions_setup (setup, name) VALUES 
("F","Falta de volumen"),
("VD-i","Vela direccional - interior"),
("VD-A1","Vela direccional - A1"),
("VD-B3","Vela direccional - B3"),
("VD-r","Vela direccional - rechazo");

INSERT INTO markets (market, name) VALUES 
("nymex","Nymex"),
("globex","Globex"),
("eurex","Eurex");

INSERT INTO tickers (ticker, market, name, description, tictype) VALUES 
("MCL","nymex", "MCL", "Micro Crude Oil", "energies"),
("CL","nymex", "CL", "Crude Oil", "energies"),
("QM","nymex", "QM", "Mini Crude Oil", "energies"),
("YM","globex", "YM", "YM", "indices"),
("6E","globex", "6E", "EURUSD", "forex");
