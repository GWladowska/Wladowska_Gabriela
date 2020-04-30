create table Pracownicy 
(
IDPracownika varchar(5) not null,
Imie varchar(15),
Nazwisko varchar(25),
constraint pk_pracownicy primary key (IDPracownika)
);

create table Pacjenci 
(
IDPacjenta varchar(4) not null,
Imie varchar(15),
Nazwisko varchar(25),
constraint pk_pacjenci primary key (IDPacjenta)
);

create table Zabiegi 
(
IDZabiegu varchar(4) not null,
NazwaZabiegu varchar(25),
constraint pk_zabiegi primary key (IDZabiegu)
);

create table Wizyty
(
IDWizyty smallint not null,
DataGodzinaWizyty timestamptz,
IDPracownika varchar(5),
IDPacjenta varchar(4),
IDZabiegu varchar(4),
constraint pk_wizyty primary key (IDWizyty)
);

alter table Wizyty add constraint wizyty_pracownicy
foreign key (IDPracownika)
references Pracownicy (IDPracownika)
not deferrable
initially immediate
;

alter table Wizyty add constraint wizyty_pacjenci
foreign key (IDPacjenta)
references Pacjenci (IDPacjenta)
not deferrable
initially immediate
;

alter table Wizyty add constraint wizyty_zabiegi
foreign key (IDZabiegu)
references Zabiegi (IDZabiegu)
not deferrable
initially immediate
;

create table Dostawcy
(
Dostawca varchar(30),
KodPocztowy varchar(6),
Miasto varchar(25),
Ulica varchar(30),
NumerBudynku varchar(4),
NumerMieszkania smallint,
constraint pk_dostawcy primary key (Dostawca)
);

create table Produkty 
(
NazwaProduktu varchar(25),
CenaNetto money,
CenaBrutto money,
constraint pk_produkty primary key (NazwaProduktu)
);

create table DostawyProduktow
(
IDDostawcy smallint,
NazwaProduktu varchar(25),
Dostawca varchar(30),
constraint pk_dostawyproduktow primary key (IDDostawcy)
);

alter table DostawyProduktow add constraint dostawyproduktow_produkty
foreign key (NazwaProduktu)
references Produkty (NazwaProduktu)
not deferrable
initially immediate
;

alter table DostawyProduktow add constraint dostawyproduktow_dostawcy
foreign key (Dostawca)
references Dostawcy (Dostawca)
not deferrable
initially immediate
;









