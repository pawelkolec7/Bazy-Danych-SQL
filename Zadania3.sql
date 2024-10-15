ZAD1:
select nazwisko, substr(etat, 1, 2)||id_prac as kod
from pracownicy;

ZAD2:
select nazwisko, translate(nazwisko, 'KLM', 'XXX') as wojna_literom
from pracownicy;

ZAD3:
select nazwisko
from pracownicy
where instr(nazwisko, 'L') between 1 and length(nazwisko)/2;

ZAD4:
select nazwisko, ROUND(placa_pod*1.15) as podwyzka
from pracownicy

ZAD5:
select nazwisko, placa_pod, 0.2*placa_pod as inwestycja, 0.2*placa_pod*power(1.1, 10) as kapital,
0.2*placa_pod*power(1.1, 10) - 0.2*placa_pod as zysk
from pracownicy;

ZAD6:
select nazwisko, zatrudniony,
floor(months_between(to_date('01/01/2000', 'DD/MM/YYYY'), zatrudniony)/12) as staz_w_2000
from pracownicy;

ZAD7:
select nazwisko, TO_CHAR(ZATRUDNIONY, 'MONTH, DD YYYY') as data_zatrudnienia
from pracownicy
where id_zesp = 20

ZAD8:
select to_char(current_date, 'DAY') as dzis
from dual

ZAD9:
select nazwa, adres,
case
when adres like 'PIOTROWO%' then 'NOWE MIASTO'
when adres like 'STRZELECKA%' then 'STARE MIASTO'
when adres like 'WLODKOWICA%' then 'GRUNWALD'
when adres like 'MIELZYNSKIEGO%' then 'STARE MIASTO'
end as dzielnica
from zespoly

ZAD10:
select nazwisko, placa_pod,
case
when placa_pod > 480 then 'Powyżej 480'
when placa_pod < 480 then 'Poniżej 480'
when placa_pod = 480 then 'Dokładnie 480'
end as "PRÓG"
from pracownicy
order by placa_pod DESC

ZAD11:
SELECT NAZWISKO, PLACA_POD,
DECODE(SIGN(PLACA_POD - 480),
        1, 'Powyżej 480',
        0, 'Dokładnie 480',
        -1, 'Poniżej 480') AS PRÓG
FROM PRACOWNICY
ORDER BY PLACA_POD DESC

