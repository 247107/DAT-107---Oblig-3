DROP SCHEMA IF EXISTS Oblig3 CASCADE;
CREATE SCHEMA Oblig3;
SET search_path TO Oblig3;
    
CREATE TABLE Ansatt
(
	AnsattID SERIAL,
	Brukernavn VARCHAR(4),
	Fornavn VARCHAR(50),
	Etternavn VARCHAR(50),
	Ansettelsedato DATE,
	Stilling VARCHAR(100),
	Mandeslonn NUMERIC, 
	AvdelingID INTEGER NOT NULL,
	CONSTRAINT AnsattPK PRIMARY KEY (AnsattID),
	CONSTRAINT AnsattUnik UNIQUE (AnsattID, Brukernavn)
);

CREATE TABLE Avdeling
(
	AvdelingID SERIAL, 
	Navn VARCHAR(50),
	SjefID INTEGER NOT NULL,
	CONSTRAINT AvdelingPK PRIMARY KEY (AvdelingID),
	CONSTRAINT AnsattFK FOREIGN KEY (SjefID) REFERENCES Ansatt(AnsattID),
	CONSTRAINT AvdelingUnik UNIQUE (AvdelingID)
);
CREATE TABLE Prosjekt
(
	ProsjektID SERIAL,
	Navn VARCHAR(225),
	Beskrivelse VARCHAR(225),
	CONSTRAINT ProsjektPK PRIMARY KEY (ProsjektID),
	CONSTRAINT ProsjektUnik UNIQUE (ProsjektID)
);
CREATE TABLE AnsattProsjekt (
	AnsattProsjektID SERIAL, 
	AnsattID INTEGER,
	ProsjektID INTEGER, 
	Timer INTEGER,
	Rolle VARCHAR(55),
	CONSTRAINT AnsattProsjektPK PRIMARY KEY (AnsattProsjektID),
	CONSTRAINT AnsattProsjektFK FOREIGN KEY (AnsattID) REFERENCES Ansatt(AnsattID),
	CONSTRAINT AnsattProsjekt2FK FOREIGN KEY (ProsjektID) REFERENCES Prosjekt(ProsjektID)
);	

INSERT INTO Ansatt(Brukernavn, Fornavn, Etternavn, Ansettelsedato, Stilling, Mandeslonn, AvdelingID)
VALUES
 	('aa', 'Arun', 'Amir', '2018-06-17', 'Leder', 55000, 1),
    ('lfg', 'Jonathan', 'Aloy', '2017-03-16', 'Sjef', 40000, 2),
    ('gtf', 'Sharun', 'Amir', '2017-10-02', 'Medarbeider', 37000, 3);
 INSERT INTO Avdeling(Navn, SjefID)
VALUES
	('Administrasjon', 1),
	('Teknisk avdeling',2),
	('Salg',3);
INSERT INTO Prosjekt(Navn, Beskrivelse)
VALUES
	('Prosjekt1', 'Nytt spennende prosjekt.');
INSERT INTO AnsattProsjekt(AnsattID, ProsjektID, Timer, Rolle)
VALUES
	(1, 1, 6, 'Leder');
	ALTER TABLE Ansatt ADD CONSTRAINT AvdelingFK 
FOREIGN KEY (AvdelingID) REFERENCES Avdeling(AvdelingID);
