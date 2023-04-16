-- --------------------- Utworzenie bazy danych -----------------------------------------
create database ecodomDB;

-- --------------------- Utworzenie tabel ------------------------------------------------
CREATE TABLE ecodomDB.Pomieszczenia (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nazwa VARCHAR(255),
    powierzchnia DECIMAL(10,2)
);

CREATE TABLE ecodomDB.Urzadzenia (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_pomieszczenia INT,
    nazwa VARCHAR(255),
    moc DECIMAL(10,2),
    harmonogram VARCHAR(255),
    FOREIGN KEY (id_pomieszczenia) REFERENCES Pomieszczenia(id) ON DELETE CASCADE
);

CREATE TABLE ecodomDB.ZuzycieEnergii (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_urzadzenia INT,
    data DATE,
    godzina TIME,
    zuzycie DECIMAL(10,2),
    FOREIGN KEY (id_urzadzenia) REFERENCES Urzadzenia(id) ON DELETE CASCADE
);

CREATE TABLE ecodomDB.KosztyPradu (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE,
    taryfa_dzienna DECIMAL(10,2),
    taryfa_nocna DECIMAL(10,2),
    koszt_jednostkowy DECIMAL(10,2)
);

CREATE TABLE ecodomDB.PanelFotowoltaiczny (
    id INT PRIMARY KEY AUTO_INCREMENT,
    powierzchnia_paneli DECIMAL(10,2),
    ilosc_paneli INT,
    pojemnosc_akumulatorow DECIMAL(10,2)
);

-- --------------------- Wstawienie danych do tabel -------------------------------------
INSERT INTO Pomieszczenia (id, nazwa, powierzchnia)
VALUES (1, 'Salon', 30.50),
       (2, 'Kuchnia', 15.25),
       (3, 'Sypialnia', 20.75),
       (4, 'Łazienka', 10.00),
       (5, 'Garaż', 25.00);

INSERT INTO ecodomDB.Urzadzenia (id, id_pomieszczenia, nazwa, moc, harmonogram) 
VALUES  (1, 1, 'Telewizor', 100.00, 'PN-ND'),
        (2, 1, 'Klimatyzacja', 1500.00, 'PN-PT'),
        (3, 2, 'Lodówka', 200.00, 'PN-ND'),
        (4, 3, 'Oświetlenie', 50.00, 'PN-ND'),
        (5, 4, 'Grzejnik', 800.00, 'CZ-ND'),
        (6, 5, 'Oświetlenie', 100.00, 'PN-ND');
       
INSERT INTO ZuzycieEnergii (id, id_urzadzenia, data, godzina, zuzycie)
VALUES (1, 1, '2023-04-13', '20:30:00', 0.5),
       (2, 1, '2023-04-14', '21:45:00', 0.7),
       (3, 2, '2023-04-13', '08:15:00', 0.3),
       (4, 3, '2023-04-14', '19:30:00', 0.8),
       (5, 5, '2023-04-14', '10:00:00', 0.2);

INSERT INTO KosztyPradu (id, data, taryfa_dzienna, taryfa_nocna, koszt_jednostkowy)
VALUES (1, '2023-04-13', 0.25, 0.10, 0.50),
       (2, '2023-04-14', 0.30, 0.12, 0.55);

INSERT INTO ecodomDB.PanelFotowoltaiczny (id, powierzchnia_paneli, ilosc_paneli, pojemnosc_akumulatorow) 
VALUES  (1, 10.50, 6, 12.00),
        (2, 5.25, 4, 8.50),
        (3, 7.75, 5, 10.00),
        (4, 3.20, 2, 5.50),
        (5, 8.90, 7, 15.00);

-- --------------------- Usuwanie tabel --------------------------------------------------
DROP TABLE ecodomDB.ZuzycieEnergii;
DROP TABLE ecodomDB.Urzadzenia;
DROP TABLE ecodomDB.KosztyPradu;
DROP TABLE ecodomDB.PanelFotowoltaiczny;
DROP TABLE ecodomDB.Pomieszczenia;