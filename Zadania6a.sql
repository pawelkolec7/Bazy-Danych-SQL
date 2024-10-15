ZAD1:
select nazwisko, etat, id_zesp
from pracownicy 
where id_zesp = (
select id_zesp
from pracownicy
where nazwisko = 'BRZEZINSKI')
order by nazwisko

ZAD2:
select nazwisko, etat, nazwa
from pracownicy p inner join zespoly z on p.id_zesp = z.id_zesp
where z.id_zesp = (
select id_zesp
from pracownicy
where nazwisko = 'BRZEZINSKI')
order by nazwisko

ZAD3:
select nazwisko, etat, to_char(zatrudniony, 'YYYY/MM/DD') as zatrudniony
from pracownicy
where zatrudniony = (
select min(zatrudniony)
from pracownicy
where etat = 'PROFESOR') and etat = 'PROFESOR'

ZAD4:
select nazwisko, zatrudniony, id_zesp
from pracownicy
where (zatrudniony, id_zesp) in (
select max(zatrudniony), id_zesp
from pracownicy
group by id_zesp)
order by zatrudniony

ZAD5:
select id_zesp, nazwa, adres
from zespoly
where id_zesp not in (
select unique id_zesp 
from pracownicy
where id_zesp is not NULL)

ZAD6:
select nazwisko
from pracownicy 
where etat = 'PROFESOR' and id_prac not in (
select id_szefa
from pracownicy
where etat = 'STAZYSTA')

ZAD7:
select id_zesp, sum(placa_pod) as suma_plac
from pracownicy
group by id_zesp
having sum(placa_pod) = (
select max(sum(placa_pod))
from pracownicy
group by id_zesp
)

ZAD8:
select z.nazwa, sum(placa_pod) as suma_plac
from pracownicy p inner join zespoly z on p.id_zesp = z.id_zesp
group by z.nazwa
having sum(placa_pod) = (
select max(sum(placa_pod))
from pracownicy
group by id_zesp
)

ZAD9:
select z.nazwa, count(*) as ilu_pracownikow
from pracownicy p inner join zespoly z on p.id_zesp = z.id_zesp
group by z.nazwa
having count(*) > (
select count(*)
from pracownicy p inner join zespoly z on p.id_zesp = z.id_zesp
group by z.nazwa
having z.nazwa = 'ADMINISTRACJA')

ZAD10:
select etat
from pracownicy
group by etat
having count(*) = (
select max(count(*))
from pracownicy
group by etat)
order by etat

ZAD11:
SELECT etat,
LISTAGG(nazwisko, ',')
WITHIN GROUP (ORDER BY nazwisko) AS pracownicy FROM pracownicy 
GROUP BY etat
HAVING etat in (
select etat
from pracownicy
group by etat
having count(*) = (
select max(count(*))
from pracownicy
group by etat)
)
order by etat

ZAD12:
select p.nazwisko as pracownik, s.nazwisko as szef
from pracownicy p inner join pracownicy s on p.id_szefa = s.id_prac
where s.placa_pod - p.placa_pod = (
select min(s.placa_pod - p.placa_pod)
from pracownicy p inner join pracownicy s on p.id_szefa = s.id_prac)















