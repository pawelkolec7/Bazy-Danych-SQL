ZAD1:
CREATE TABLE projekty (
    ID_PROJEKTU NUMBER(4) GENERATED ALWAYS AS IDENTITY,
    OPIS_PROJEKTU VARCHAR2(100 CHAR),
    DATA_ROZPOCZECIA DATE DEFAULT CURRENT_DATE,
    DATA_ZAKONCZENIA DATE,
    FUNDUSZ NUMBER(7,2));

ZAD2:
insert into projekty (opis_projektu, data_rozpoczecia, data_zakonczenia, fundusz)
values ('Indeksy bitmapowe', TO_DATE('02/04/1999', 'DD/MM/YYYY'), TO_DATE('31/08/2001', 'DD/MM/YYYY'), 25000);
insert into projekty (opis_projektu, data_rozpoczecia, fundusz)
values ('Sieci kręgosłupowe', DEFAULT, 19000);

ZAD3:
select * from projekty;
ZAD4:
insert into projekty (opis_projektu, data_rozpoczecia, data_zakonczenia, fundusz)
values ('Indeksy drzewiaste', TO_DATE('24/12/2013', 'DD/MM/YYYY'), TO_DATE('01/01/2014', 'DD/MM/YYYY'), 1200);

ZAD5:
update projekty
set id_projektu = 10
where opis_projektu = 'Indeksy drzewiaste';

ZAD6:
create table PROJEKTY_KOPIA
AS SELECT * FROM projekty;

ZAD7:
insert into PROJEKTY_KOPIA (id_projektu, opis_projektu, data_rozpoczecia, data_zakonczenia, fundusz)
values (10,'Sieci lokalne',current_date, current_date + interval '1' year , 1200);

ZAD8:
DELETE FROM projekty
where opis_projektu = 'Indeksy drzewiaste';

ZAD9:
SELECT table_name FROM user_tables;