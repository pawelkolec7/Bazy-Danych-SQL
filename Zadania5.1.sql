ZAD1:
select nazwisko, etat, id_zesp, nazwa
from pracownicy natural inner join zespoly
order by nazwisko

ZAD2:
select nazwisko, etat, id_zesp, nazwa
from pracownicy natural inner join zespoly
where adres = 'PIOTROWO 3A'
order by nazwisko

ZAD3:
select nazwisko, etat, placa_pod, placa_min, placa_max
from pracownicy inner join etaty on etat = nazwa
order by etat

ZAD4:
select nazwisko, etat, placa_pod, placa_min, placa_max,
case
when placa_pod >= placa_min and placa_pod <= placa_max then 'OK'
else 'NIE'
end as czy_pensja_ok
from pracownicy inner join etaty on etat = nazwa
order by etat

ZAD5:
select nazwisko, etat, placa_pod, placa_min, placa_max
from pracownicy inner join etaty on etat = nazwa
where placa_pod <= placa_min and placa_pod >= placa_max
order by etat

ZAD6:
select nazwisko, placa_pod, etat, nazwa as kat_plac, placa_min, placa_max
from pracownicy inner join etaty on placa_pod between placa_min and placa_max
order by nazwisko, nazwa

ZAD7:
select nazwisko, placa_pod, etat, nazwa as kat_plac, placa_min, placa_max
from pracownicy inner join etaty on placa_pod between placa_min and placa_max
where nazwa = 'SEKRETARKA'
order by nazwisko

ZAD8:
select p.nazwisko as pracownik, p.id_prac as id_prac, s.nazwisko as szef, s.id_prac as id_szefa
from pracownicy p inner join pracownicy s on p.id_szefa = s.id_prac
order by p.nazwisko

ZAD9:
select p.nazwisko as pracownik, p.zatrudniony as prac_zatrudniony, s.nazwisko as szef, 
s.zatrudniony as szef_zatrudniony, floor(months_between(p.zatrudniony, s.zatrudniony)/12) as lata
from pracownicy p inner join pracownicy s on p.id_szefa = s.id_prac
where floor(months_between(p.zatrudniony, s.zatrudniony)/12)<10
order by p.zatrudniony

ZAD10:
select z.nazwa, count(*) as liczba, avg(placa_pod) as srednia_placa
from pracownicy p inner join zespoly z on p.id_zesp = z.id_zesp
group by z.nazwa

ZAD11:
select z.nazwa,
case
when count(*) <= 2 then 'mały'
when count(*) > 2 and count(*) < 7 then 'średni'
when count(*) >= 7 then 'duży'
end as etykieta
from pracownicy p inner join zespoly z on p.id_zesp = z.id_zesp
group by z.nazwa