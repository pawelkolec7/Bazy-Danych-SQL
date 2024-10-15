ZAD1:
select nazwisko, p.id_zesp, nazwa
from pracownicy p left outer join zespoly z on p.id_zesp = z.id_zesp
order by nazwisko

ZAD2:
select nazwa, z.id_zesp, nvl(nazwisko, 'brak pracowników') as pracownik
from pracownicy p right outer join zespoly z on p.id_zesp = z.id_zesp
order by nazwa, pracownik

ZAD3:
select nvl(nazwa, 'brak zespołu') as zespol, nvl(nazwisko, 'brak pracowników') as pracownik
from pracownicy p full outer join zespoly z on p.id_zesp=z.id_zesp
order by nazwa, nazwisko

ZAD4:
select z.nazwa, count(all p.id_zesp) as liczba, sum(placa_pod) as suma_plac
from pracownicy p right outer join zespoly z on p.id_zesp = z.id_zesp
group by z.nazwa
order by z.nazwa

ZAD5:
select z.nazwa
from pracownicy p right outer join zespoly z on p.id_zesp = z.id_zesp
group by z.nazwa
having count(p.id_zesp) = 0

ZAD6:
select p.nazwisko as pracownik, p.id_prac as id_prac, s.nazwisko as szef, s.id_prac as id_szefa
from pracownicy p left outer join pracownicy s on p.id_szefa = s.id_prac
order by p.nazwisko

ZAD7:
SELECT s.nazwisko, count(p.nazwisko)
FROM pracownicy p right OUTER JOIN pracownicy s ON p.id_szefa = s.id_prac
GROUP BY s.nazwisko
order by s.nazwisko

ZAD8:
select p.nazwisko, p.etat, p.placa_pod, z.nazwa, s.nazwisko as szef
from (pracownicy p left outer join pracownicy s on p.id_szefa = s.id_prac)
inner join zespoly z on p.id_zesp = z.id_zesp
order by p.nazwisko

ZAD9:
select nazwisko, nazwa
from pracownicy cross join zespoly
order by nazwisko, nazwa

ZAD10:
select count(*)
from pracownicy cross join zespoly cross join etaty

ZAD11:
select unique etat
from pracownicy
where to_char(zatrudniony, 'YYYY') = '1992'
INTERSECT
select unique etat
from pracownicy
where to_char(zatrudniony, 'YYYY') = '1993'

ZAD12:
select id_zesp
from zespoly
EXCEPT
select unique id_zesp
from pracownicy

ZAD13:
select id_zesp, nazwa
from zespoly
except
select unique z.id_zesp, nazwa
from pracownicy p inner join zespoly z on p.id_zesp = z.id_zesp

ZAD14:
select nazwisko, placa_pod, 'Poniżej 480 złotych' as prog
from pracownicy
where placa_pod < 480
UNION
select nazwisko, placa_pod, 'Dokładnie 480 złotych' as prog
from pracownicy
where placa_pod = 480
UNION
select nazwisko, placa_pod, 'Powyżej 480 złotych' as prog
from pracownicy
where placa_pod > 480
order by placa_pod