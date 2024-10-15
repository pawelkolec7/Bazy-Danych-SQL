ZAD1:
CREATE OR REPLACE VIEW asystenci
(nazwisko, placa, staz)
AS
SELECT nazwisko, placa_pod + nvl(placa_dod, 0),
'lat: ' || floor(MONTHS_BETWEEN(DATE'2024-01-01', zatrudniony)/ 12) || ', miesięcy: ' || 
floor(mod(MONTHS_BETWEEN(DATE'2024-01-01', zatrudniony),12))
FROM pracownicy
where etat = 'ASYSTENT';

ZAD2:
CREATE VIEW PLACE (ID_ZESP, SREDNIA, MINIMUM, MAXIMUM, FUNDUSZ, L_PENSJI, L_DODATKOW)
AS
SELECT
id_zesp, avg(placa_pod), min(placa_pod), max(placa_pod), sum(placa_pod) + sum(placa_dod), count(placa_pod), count(placa_dod)
FROM pracownicy
group by id_zesp;

ZAD3:
select p.nazwisko, p.placa_pod
from pracownicy p inner join place pl on p.id_zesp = pl.id_zesp
where p.placa_pod + p.placa_dod > pl.srednia;

ZAD4:
CREATE VIEW PLACE_MINIMALNE (ID_PRAC, NAZWISKO, ETAT, PLACA_POD)
AS
SELECT ID_PRAC, NAZWISKO, ETAT, PLACA_POD
FROM PRACOWNICY
WHERE PLACA_POD < 700
WITH CHECK OPTION CONSTRAINT za_wysoka_placa;

ZAD5:
UPDATE PLACE_MINIMALNE
SET PLACA_POD = 800
WHERE NAZWISKO = 'HAPKE';

ZAD6:
CREATE VIEW PRAC_SZEF (ID_PRAC, ID_SZEFA, PRACOWNIK, ETAT, SZEF)
AS
SELECT p.id_prac, p.id_szefa, p.nazwisko, p. etat, s.nazwisko
from pracownicy p inner join pracownicy s on p.id_szefa = s.id_prac;

ZAD7:
CREATE VIEW ZAROBKI (ID_PRAC, NAZWISKO, ETAT, PLACA_POD)
AS
SELECT p.id_prac, p.nazwisko, p. etat, p.placa_pod
from pracownicy p inner join pracownicy s on p.id_szefa = s.id_prac
where p.placa_pod < s.placa_pod
WITH CHECK OPTION CONSTRAINT za_wysoka_placa_ziomka;

ZAD8:
FROM USER_UPDATABLE_COLUMNS WHERE TABLE_NAME = 'PRAC_SZEF';

