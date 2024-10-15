ZAD1:
1.select nazwisko, placa_pod
from pracownicy
order by placa_pod DESC
FETCH FIRST 3 ROWS ONLY;
2.select rownum as pozycja, nazwisko, placa_pod
from
(
select nazwisko, placa_pod
from pracownicy
order by placa_pod DESC
)
WHERE ROWNUM <= 3;

ZAD2:
1.select nazwisko, placa_pod
from pracownicy
order by placa_pod DESC
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY
2.select nazwisko, placa_pod
from
(
select rownum as pozycja, nazwisko, placa_pod
from (
select nazwisko, placa_pod
from pracownicy
order by placa_pod DESC
)
where rownum <= 10
)
where pozycja > 5

ZAD3:
with srednia as
(select avg(placa_pod) as srednia_placa, id_zesp
from pracownicy
group by id_zesp)
select p.nazwisko, p.placa_pod, p.placa_pod - s.srednia_placa as roznica
from pracownicy p inner join srednia s on p.id_zesp = s.id_zesp
where p.placa_pod - s.srednia_placa > 0
order by nazwisko

ZAD4:
with lata as
(select to_char(zatrudniony, 'YYYY') as rok, id_prac
from pracownicy)
select l.rok, count(*) as liczba
from pracownicy p inner join lata l on p.id_prac = l.id_prac
group by l.rok
order by liczba DESC, l.rok

ZAD5:
with lata as
(select to_char(zatrudniony, 'YYYY') as rok, id_prac
from pracownicy)
select l.rok, count(*) as liczba
from pracownicy p inner join lata l on p.id_prac = l.id_prac
group by l.rok
order by liczba DESC
fetch first row with ties

ZAD6:
with asystenci as 
(select nazwisko, id_zesp, etat
from pracownicy 
where etat = 'ASYSTENT'),
piotrowo as
(select *
from zespoly
where adres = 'PIOTROWO 3A')
select a.nazwisko, a.etat, p.nazwa, p.adres
from asystenci a inner join piotrowo p on a.id_zesp = p.id_zesp

ZAD7:
with suma_plac as
(select sum(placa_pod) as suma, id_zesp
from pracownicy
group by id_zesp)
select z.nazwa, s.suma as maks_suma_plac
from suma_plac s inner join zespoly z on s.id_zesp = z.id_zesp
order by s.suma DESC
fetch first 1 row only

ZAD8:
1.WITH
podwladni (id_prac, id_szefa, nazwisko, poziom) AS
-- definicja korzenia hierarchii
(SELECT id_prac, id_szefa, nazwisko, 1
FROM pracownicy
WHERE nazwisko = 'BRZEZINSKI'
UNION ALL
-- rekurencyjna definicja niższych poziomów
SELECT p.id_prac, p.id_szefa, p.nazwisko, poziom+1
FROM podwladni s JOIN pracownicy p ON s.id_prac = p.id_szefa)
-- wskazanie sposobu przeszukiwania hierarchii i sortowania rekordów-dzieci
SEARCH DEPTH FIRST BY nazwisko SET porzadek_potomkow
SELECT nazwisko, poziom
FROM podwladni
ORDER BY porzadek_potomkow
2.SELECT nazwisko, LEVEL AS poziom
FROM pracownicy
CONNECT BY id_szefa = PRIOR id_prac
START WITH nazwisko = 'BRZEZINSKI'
ORDER SIBLINGS BY nazwisko;

ZAD9:
with drzewo as (
SELECT nazwisko, LEVEL AS poziom
FROM pracownicy
CONNECT BY id_szefa = PRIOR id_prac
START WITH nazwisko = 'BRZEZINSKI'
ORDER SIBLINGS BY nazwisko)
SELECT 
case
when poziom = 1 then nazwisko
when poziom = 2 then ' '||nazwisko
when poziom = 3 then '  '||nazwisko
end
as nazwisko, poziom
from drzewo

















