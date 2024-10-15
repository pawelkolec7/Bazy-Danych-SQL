ZAD1:
SELECT *
FROM ZESPOLY Z
WHERE NOT EXISTS (
SELECT Z.ID_ZESP
FROM PRACOWNICY P 
WHERE P.ID_ZESP = Z.ID_ZESP)

ZAD2:
SELECT nazwisko, placa_pod, etat
FROM pracownicy p
WHERE placa_pod >
(SELECT avg(placa_pod)
FROM pracownicy
WHERE etat = p.etat)
order by placa_pod DESC

ZAD3:
select nazwisko, placa_pod
from pracownicy p
where placa_pod >= 0.75*(
select placa_pod
from pracownicy
where id_prac = p.id_szefa)

ZAD4:
select nazwisko
from pracownicy s
where etat = 'PROFESOR' and not exists (
select nazwisko
from pracownicy 
where etat = 'STAZYSTA' and s.id_prac = id_szefa);

ZAD5:
select nazwa, maks_suma_plac
from (
select max(suma) as maks_suma_plac
from (
select sum(placa_pod) as suma
from pracownicy
group by id_zesp)) T0
left outer join 
(select id_zesp, sum(placa_pod) as suma1
from pracownicy
group by id_zesp) T1 
on T0.maks_suma_plac = T1.suma1
left outer join zespoly z on T1.id_zesp = z.id_zesp

ZAD6:
select nazwisko, placa_pod
from pracownicy p
where 3 > (
select count(*)
from pracownicy
where placa_pod > p.placa_pod)

ZAD7:
1.select nazwisko, placa_pod, placa_pod - s.srednia
from pracownicy p 
inner join 
(select id_zesp, avg(placa_pod) as srednia
from pracownicy
group by id_zesp) s
on p.id_zesp = s.id_zesp
order by nazwisko
2.select nazwisko, placa_pod, 
placa_pod - 
(select avg(placa_pod)
from pracownicy
group by id_zesp
having id_zesp = p.id_zesp) as roznica
from pracownicy p
order by nazwisko

ZAD8:
1.select nazwisko, placa_pod, placa_pod - s.srednia
from pracownicy p 
inner join 
(select id_zesp, avg(placa_pod) as srednia
from pracownicy
group by id_zesp) s
on p.id_zesp = s.id_zesp
where placa_pod - s.srednia > 0
order by nazwisko
2.select nazwisko, placa_pod, 
placa_pod - 
(select avg(placa_pod)
from pracownicy
group by id_zesp
having id_zesp = p.id_zesp) as roznica
from pracownicy p
where placa_pod - (select avg(placa_pod)
from pracownicy
group by id_zesp
having id_zesp = p.id_zesp) > 0
order by nazwisko

ZAD9:
SELECT p.nazwisko,
(
select count(*)
from pracownicy
where id_szefa = p.id_prac
) as podwladni
FROM pracownicy p
JOIN zespoly z ON p.id_zesp = z.id_zesp
WHERE z.adres = 'PIOTROWO 3A' AND p.etat = 'PROFESOR'

ZAD10:
select z.nazwa, avg(p.placa_pod) as srednia,
(select round(avg(placa_pod), 2)
from pracownicy) as srednia_ogolna,
CASE
WHEN avg(p.placa_pod) > (select round(avg(placa_pod), 2) from pracownicy) THEN ':)'
WHEN avg(p.placa_pod) < (select round(avg(placa_pod), 2) from pracownicy) THEN ':('
ELSE '???'
END AS NASTROJE 
from pracownicy p right outer join zespoly z on z.id_zesp = p.id_zesp
group by z.id_zesp, z.nazwa
order by nazwa

ZAD11:
select *
from etaty e
order by
(
select count(*)
from pracownicy
where etat = e.nazwa
group by etat
) DESC, nazwa








