ZAD1:
SELECT min(placa_pod), max(placa_pod), max(placa_pod) - min(placa_pod) as roznica
from pracownicy

ZAD2:
select etat, avg(placa_pod)
from pracownicy 
group by etat
order by avg(placa_pod) DESC
ZAD3:
select count(*) as profesorowie
from pracownicy
where etat = 'PROFESOR'

ZAD4:
select id_zesp, sum(placa_pod) + sum(nvl(placa_dod,0)) as sumaryczne_place
from pracownicy
group by id_zesp
order by id_zesp

ZAD5:
select max(sum(placa_pod) + sum(nvl(placa_dod,0))) as max_sum_placa
from pracownicy
group by id_zesp

ZAD6:
select min(placa_pod)
from pracownicy
where id_szefa is not null
group by id_szefa
order by min(placa_pod) DESC

ZAD7:
select id_zesp, count(*)
from pracownicy
group by id_zesp
order by count(*) DESC

ZAD8:
select id_zesp, count(*)
from pracownicy
group by id_zesp
having count(*) >= 3
order by count(*) DESC

ZAD9:
SELECT COUNT(*)
FROM pracownicy
GROUP BY id_prac
HAVING COUNT(*) > 1

ZAD10:
select etat, avg(placa_pod), count(*)
from pracownicy
where zatrudniony < date '1990-01-01'
group by etat
order by etat

ZAD11:
select id_zesp, etat, round(avg(placa_pod + nvl(placa_dod, 0))) as srednia, 
round(max(placa_pod + nvl(placa_dod, 0))) as maksymalna
from pracownicy
where etat in ('ASYSTENT', 'PROFESOR')
group by id_zesp, etat
order by id_zesp, etat

ZAD12:
select to_char(zatrudniony, 'YYYY') as rok, count(*)
from pracownicy
group by to_char(zatrudniony, 'YYYY')
order by rok

ZAD13:
select length(nazwisko) as "ile liter" , count(*) as "w ilu nazwiskach"
from pracownicy
group by length(nazwisko)
order by length(nazwisko)

ZAD14:
select count(*) as "ile nazwisk z A"
from pracownicy
where instr(nazwisko, 'A') > 0 or instr(nazwisko, 'a') > 0

ZAD15:
select 
sum(case 
when nazwisko like ('%A%') then 1
when nazwisko like ('%a%') then 1
else 0
end) as "ile nazwisk z a",
sum(case 
when nazwisko like ('%E%') then 1
when nazwisko like ('%e%') then 1
else 0
end) as "ile nazwisk z e"
from pracownicy

ZAD16:
select id_zesp, sum(placa_pod) as suma_plac,
listagg(nazwisko||':'||placa_pod||';')
WITHIN GROUP (ORDER BY nazwisko) as pracownicy
from pracownicy
group by id_zesp
order by id_zesp