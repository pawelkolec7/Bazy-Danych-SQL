ZAD1:
select * from zespoly
order by id_zesp;

ZAD2:
select * from pracownicy
order by id_prac;

ZAD3:
select nazwisko, placa_pod*12 as roczna_placa from pracownicy
order by nazwisko;

ZAD4:
select nazwisko, etat, placa_pod + nvl(placa_dod, 0) as miesieczne_zarobki
from pracownicy
order by miesieczne_zarobki DESC;

ZAD5:
select * from zespoly
order by nazwa;

ZAD6:
select unique etat from pracownicy
order by etat;

ZAD7:
select * from pracownicy
where etat = 'ASYSTENT'
order by nazwisko;

ZAD8:
select id_prac, nazwisko, etat, placa_pod, id_zesp
from pracownicy
where id_zesp in (30, 40)
order by id_zesp DESC, placa_pod DESC;

ZAD9:
select nazwisko, id_zesp, placa_pod
from pracownicy
where placa_pod between 300 and 800
order by nazwisko;

ZAD10:
select nazwisko, etat, id_zesp
from pracownicy
where nazwisko like '%SKI'
order by nazwisko;

ZAD11:
select id_prac, id_szefa, nazwisko, placa_pod
from pracownicy
where placa_pod > 1000 and id_szefa is not null;

ZAD12:
select nazwisko, id_zesp
from pracownicy
where id_zesp = 20 AND (nazwisko like 'M%' or nazwisko like '%SKI')
order by nazwisko;

ZAD13:
select nazwisko, etat, placa_pod/160 as stawka
from pracownicy
where etat not in ('ADIUNKT', 'ASYSTENT', 'STAZYSTA') and placa_pod not between 400 and 800
order by stawka;

ZAD14:
select nazwisko, etat, placa_pod, placa_dod
from pracownicy
where placa_pod + nvl(placa_dod,0) > 1000
order by etat, nazwisko;

ZAD15:
select nazwisko || ' pracuje od ' || zatrudniony || ' i zarabia ' || placa_pod as profesorowie
from pracownicy
where etat = 'PROFESOR'
order by placa_pod DESC;



























