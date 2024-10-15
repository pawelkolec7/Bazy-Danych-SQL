ZAD1:
insert into pracownicy
select 250, 'KOWALSKI', 'ASYSTENT', NULL, TO_DATE('13/01/2015', 'DD/MM/YYYY'), 1500, NULL, 10 from dual
union all
select 260, 'ADAMSKI', 'ASYSTENT', NULL, TO_DATE('10/09/2014', 'DD/MM/YYYY'), 1500, NULL, 10 from dual
union all
select 270, 'NOWAK', 'ADIUNKT', NULL, TO_DATE('01/05/1990', 'DD/MM/YYYY'), 2050, 540, 20 from dual;

ZAD2:
UPDATE PRACOWNICY
set 
placa_pod = 1.1*PLACA_POD,
placa_dod = NVL(1.2*PLACA_DOD, 100)
WHERE
id_prac in (250, 260, 270);

ZAD3:
insert into ZESPOLY
values(60, 'BAZY DANYCH', 'PIOTROWO 2');
ZAD4:
UPDATE PRACOWNICY
SET
id_zesp = 
(
SELECT id_zesp
from ZESPOLY
where nazwa = 'BAZY DANYCH'
)
WHERE ID_PRAC IN (250, 260, 270);

ZAD5:
update PRACOWNICY
set id_szefa = (
select id_prac
from PRACOWNICY
where NAZWISKO = 'MORZY')
where id_prac in (
SELECT p.id_prac 
from PRACOWNICY p inner join ZESPOLY z on p.ID_ZESP = z.ID_ZESP
where z.NAZWA = 'BAZY DANYCH');

ZAD6:
DELETE FROM ZESPOLY WHERE NAZWA='BAZY DANYCH'
--Nie można, ponieważ ten zespół jest już w innej realcji

ZAD7:
DELETE FROM PRACOWNICY
WHERE ID_PRAC IN 
(select id_prac
from ZESPOLY z inner join PRACOWNICY p on p.ID_ZESP = z.ID_ZESP
where z.NAZWA = 'BAZY DANYCH')
DELETE FROM ZESPOLY
WHERE NAZWA = 'BAZY DANYCH'

ZAD8:
SELECT NAZWISKO, PLACA_POD, S.PODWYZKA
FROM PRACOWNICY P INNER JOIN (
SELECT ID_ZESP, 0.1*AVG(PLACA_POD) AS PODWYZKA
FROM PRACOWNICY
GROUP BY ID_ZESP) S ON P.ID_ZESP = S.ID_ZESP
ORDER BY P.NAZWISKO

ZAD9:
UPDATE PRACOWNICY P
SET PLACA_POD=PLACA_POD+0.1*(SELECT AVG(PLACA_POD) FROM PRACOWNICY
WHERE ID_ZESP = P.ID_ZESP GROUP BY ID_ZESP);

ZAD10:
select *
from PRACOWNICY
order by placa_pod
fetch first row with ties

ZAD11:
update PRACOWNICY
set placa_pod =  (select round(avg(placa_pod), 2) from PRACOWNICY)
where id_prac = (
select id_prac
from PRACOWNICY
order by placa_pod
fetch first row with ties);

ZAD12:
update pracownicy
set
placa_dod = (
select avg(placa_pod) as srednia
from PRACOWNICY
group by id_szefa
having id_szefa = (
select id_prac
from PRACOWNICY
where NAZWISKO = 'MORZY'))
where id_zesp = 20;

ZAD13:
update pracownicy
set placa_pod = placa_pod * 1.25
where id_prac in 
(
select id_prac
from pracownicy p inner join zespoly z on p.id_zesp = z.id_zesp
where z.nazwa = 'SYSTEMY ROZPROSZONE'
);

ZAD14:
delete from pracownicy
where id_prac in
(
select p.id_prac
from pracownicy p inner join pracownicy s on s.id_prac = p.id_szefa
where s.nazwisko = 'MORZY'
);

ZAD15:
select *
from pracownicy

ZAD16:
insert into pracownicy (id_prac, nazwisko, etat, placa_pod, placa_dod)
values (prac_seq.NEXTVAL, 'TRABCZYNSKI', 'STAZYSTA', 1000, 300);

ZAD17:
delete from pracownicy
where nazwisko = 'TRABCZYNSKI'

ZAD18:
update pracownicy
set placa_dod = prac_seq1.currval
where nazwisko = 'TRABCZYNSKI';

ZAD19:
delete from pracownicy
where nazwisko = 'TRABCZYNSKI'

ZAD20:
CREATE SEQUENCE MALA_SEQ1 START WITH 1
INCREMENT BY 5 MAXVALUE 10;

ZAD21:
DROP SEQUENCE MALA_SEQ1;