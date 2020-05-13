create database firma;
comment on database firma is 'moja firma';

create schema ksiegowosc;
comment on schema ksiegowosc is 'dzial ksiegowosci';

create table ksiegowosc.pracownicy 
(
id_pracownika smallint not null primary key,
imie varchar(15),
nazwisko varchar(25),
adres varchar(50),
telefon varchar(14)
);
comment on table ksiegowosc.pracownicy is 'tabela pracownikow';

create table ksiegowosc.godziny
(
id_godziny smallint not null,
"data" timestamp,
liczba_godzin real,
id_pracownika smallint not null references ksiegowosc.pracownicy (id_pracownika) on delete cascade,
constraint pk_id_godziny primary key(id_godziny)
);
comment on table ksiegowosc.godziny is 'tabela godzin';

create table ksiegowosc.pensja
(
id_pensji smallint not null,
stanowisko varchar(35),
kwota money,
primary key(id_pensji)
);
comment on table ksiegowosc.pensja is 'tabela pensji';

create table ksiegowosc.premia
(
id_premii smallint not null, 
rodzaj varchar(40), 
kwota money
);
alter table ksiegowosc.premia add constraint pk_id_premii
primary key (id_premii)
;
comment on table ksiegowosc.premia is 'tabela premii';

create table ksiegowosc.wynagrodzenie
(
id_wynagrodzenia smallint not null primary key, 
"data" timestamp,
id_pracownika smallint not null references ksiegowosc.pracownicy (id_pracownika) on delete cascade, 
id_godziny smallint not null references ksiegowosc.godziny (id_godziny) on delete cascade, 
id_pensji smallint not null references ksiegowosc.pensja (id_pensji) on delete cascade, 
id_premii smallint not null references ksiegowosc.premia (id_premii) on delete cascade
);
comment on table ksiegowosc.wynagrodzenie is 'tabela wynagrodzen';

--pracownicy
insert into ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
values(1,'Wiktoria','Nowakowska','42-400 Zawiercie ul.Jasna 118','666-505-586');
insert into ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
values(2,'Dariusz','Adamczyk','45-425 Opole ul.Czestochowska 55','556-985-965');
insert into ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
values(3,'Bonifacy','Zielinski','93-324 Lodz ul.Opolska 32/3','458-985-521');
insert into ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
values(4,'Kazimierz','Dabrowski','41-300 Dabrowa Gornicza ul.Lubelska 3','214-965-555');
insert into ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
values(5,'Alan','Piotrowski','04-263 Warszawa ul.Poswietna 104','222-985-124');
insert into ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
values(6,'Roza','Zajac','61-113 Poznan ul.Warszawska 80/8','256-844-854');
insert into ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
values(7,'Krzysztof','Wiaczorek','71-790 Szczecin ul.Wapienna 107/4','214-965-852');
insert into ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
values(8,'Klara','Kalinowska','92-440 Lodz ul.Podbipiety Longinusa 69/1','285-854-652');
insert into ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
values(9,'Gabriel','Pawlak','15-706 Bialystok ul.Gruntowa 12/8','523-965-854');
insert into ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
values(10,'Jozef','Wacik','51-180 Wroclaw ul.Pielegniarska 73/26','125-985-986');

--godziny
insert into ksiegowosc.godziny
(id_godziny,"data",liczba_godzin,id_pracownika)
values(1,'2020-03-25',8,3);
insert into ksiegowosc.godziny
(id_godziny,"data",liczba_godzin,id_pracownika)
values(2,'2020-03-25',8,2);
insert into ksiegowosc.godziny
(id_godziny,"data",liczba_godzin,id_pracownika)
values(3,'2020-03-25',8,9);
insert into ksiegowosc.godziny
(id_godziny,"data",liczba_godzin,id_pracownika)
values(4,'2020-03-25',8,10);
insert into ksiegowosc.godziny
(id_godziny,"data",liczba_godzin,id_pracownika)
values(5,'2020-03-25',8,5);
insert into ksiegowosc.godziny
(id_godziny,"data",liczba_godzin,id_pracownika)
values(6,'2020-03-25',8,1);
insert into ksiegowosc.godziny
(id_godziny,"data",liczba_godzin,id_pracownika)
values(7,'2020-03-25',8,4);
insert into ksiegowosc.godziny
(id_godziny,"data",liczba_godzin,id_pracownika)
values(8,'2020-03-26',8,7);
insert into ksiegowosc.godziny
(id_godziny,"data",liczba_godzin,id_pracownika)
values(9,'2020-03-26',8,8);
insert into ksiegowosc.godziny
(id_godziny,"data",liczba_godzin,id_pracownika)
values(10,'2020-03-26',8,6);

--pensja
insert into ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
values(1, 'Przedstawiciel handlowy',3500);
insert into ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
values(2,'Pracownik administracji',3600);
insert into ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
values(3,'Magazynier',3000);
insert into ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
values(4,'Kierownik',4200);
insert into ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
values(5,'Prezes',6000);
insert into ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
values(6,'Konserwator powierzchni plaskich',2800);
insert into ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
values(7,'Montazysta sprzetow elektronicznych',3800);
insert into ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
values(8,'Wozny',3000);
insert into ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
values(9,'Kierowca',3200);
insert into ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
values(10,'Operator wozka widlowego',3500);

--premia
insert into ksiegowosc.premia
(id_premii,rodzaj,kwota)
values(1,'premia indywidualna',300);
insert into ksiegowosc.premia
(id_premii,rodzaj,kwota)
values(2,'premia zespolowa',200);
insert into ksiegowosc.premia
(id_premii,rodzaj,kwota)
values(3,'premia za kwartal',500);
insert into ksiegowosc.premia
(id_premii,rodzaj,kwota)
values(4,'premia roczna',800);
insert into ksiegowosc.premia
(id_premii,rodzaj,kwota)
values(5,'premia swiateczna',400);
insert into ksiegowosc.premia
(id_premii,rodzaj,kwota)
values(6,'premia za nadgodziny',200);
insert into ksiegowosc.premia
(id_premii,rodzaj,kwota)
values(7,'premia dla najlepszego pracownika',900);
insert into ksiegowosc.premia
(id_premii,rodzaj,kwota)
values(8,'premia za specjalne osiagniecia',400);
insert into ksiegowosc.premia
(id_premii,rodzaj,kwota)
values(9,'premia za najwyzsza sprzedaz',550);
insert into ksiegowosc.premia
(id_premii,rodzaj,kwota)
values(10,'premia dodatkowa',150);

--wynagrodzenie
insert into ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
values(1,'2020-03-25',1,6,1,1);
insert into ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
values(2,'2020-03-25',2,2,3,1);
insert into ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
values(3,'2020-03-25',3,1,4,8);
insert into ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
values(4,'2020-03-25',4,7,1,1);
insert into ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
values(5,'2020-03-25',5,5,1,4);
insert into ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
values(6,'2020-03-25',6,10,10,1);
insert into ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
values(7,'2020-03-25',7,8,7,7);
insert into ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
values(8,'2020-03-26',8,9,9,1);
insert into ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
values(9,'2020-03-26',9,3,7,1);
insert into ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
values(10,'2020-03-26',10,4,7,9);