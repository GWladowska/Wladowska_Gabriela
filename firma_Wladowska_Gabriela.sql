-- tables
-- Table: godziny
CREATE TABLE godziny (
    id_godziny int  NOT NULL,
    data date  NOT NULL,
    liczba_godzin int  NOT NULL,
    id_pracownika int  NOT NULL,
    CONSTRAINT godziny_pk PRIMARY KEY (id_godziny)
);

-- Table: pensje
CREATE TABLE pensje (
    id_pensji int  NOT NULL,
    stanowisko char(60)  NULL,
    kwota int  NOT NULL,
    id_premii int  NOT NULL,
    CONSTRAINT pensje_pk PRIMARY KEY (id_pensji)
);

-- Table: pracownicy
CREATE TABLE pracownicy (
    id_pracownika int  NOT NULL,
    imie char(25)  NOT NULL,
    nazwisko char(60)  NOT NULL,
    adres char(60)  NULL,
    telefon varchar(15)  NULL,
    CONSTRAINT pracownicy_pk PRIMARY KEY (id_pracownika)
);

-- Table: premie
CREATE TABLE premie (
    id_premii int  NOT NULL,
    rodzaj char(60)  NULL,
    kwota int  NOT NULL,
    CONSTRAINT premie_pk PRIMARY KEY (id_premii)
);

-- foreign keys
-- Reference: godziny_pracownicy (table: godziny)
ALTER TABLE godziny ADD CONSTRAINT godziny_pracownicy
    FOREIGN KEY (id_pracownika)
    REFERENCES pracownicy (id_pracownika)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: pensje_premie (table: pensje)
ALTER TABLE pensje ADD CONSTRAINT pensje_premie
    FOREIGN KEY (id_premii)
    REFERENCES premie (id_premii)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

--pracownicy
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(1, 'Miron                    ', 'Wlodarczyk                                                  ', '31-241 Krako Al. 29 Listopada 210/5                        ', '229443912');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(2, 'Jacek                    ', 'Stepien                                                     ', '30-376 Krakow ul. Balnki 5/9                               ', '566871228');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(3, 'Mariusz                  ', 'Kowalski                                                    ', '30-094 Krakow ul. Ginna 26/9                                ', '329903611');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(4, 'Norbert                  ', 'Chmielewski                                                 ', '30-132 Krakow ul. Niedzialowskiego Mieczyslawa 12/5        ', '246496326');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(5, 'Emil                     ', 'Sadowski                                                    ', '31-917 Krakow Osiedle Hutnicze 2/5                          ', '324363530');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(6, 'Anita                    ', 'Nowak-Mazur                                                 ', '31-587 Krakow ul. Szafrska 21/5                           ', '722416936');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(7, 'Boguslawa                ', 'Marciniak                                                   ', '30-415 Krakow ul. Bonarka 12/6                              ', '981987069');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(8, 'Lucyna                   ', 'Kowalczyk-Starowicz                                         ', '30-898 Krakow ul. Galla 22/5                               ', '327905037');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(9, 'Matylda                  ', 'Zielinska                                                   ', '31-056 Krakow ul. Jozefa 62/1                               ', '201101573');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(10, 'Antonina                 ', 'Gajewska                                                    ', '30-003 Krakow ul. Lubelska 27/31                            ', '597618876');

--godziny
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(1, '2020-03-25', 8, 3);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(2, '2020-03-25', 8, 2);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(3, '2020-03-25', 8, 9);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(4, '2020-03-25', 8, 10);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(5, '2020-03-25', 8, 5);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(6, '2020-03-25', 8, 1);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(7, '2020-03-25', 8, 4);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(8, '2020-03-26', 8, 7);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(9, '2020-03-26', 8, 8);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(10, '2020-03-26', 8, 6);

--premie
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(1, 'premia indywidualna                                         ', 300);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(2, 'premia indywidualna                                         ', 300);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(3, 'premia indywidualna                                         ', 300);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(4, 'premia indywidualna                                         ', 300);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(5, 'premia indywidualna                                         ', 300);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(6, 'premia zespolowa                                            ', 200);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(7, 'premia zespolowa                                            ', 200);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(8, 'premia zespolowa                                            ', 200);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(9, 'premia dlugoterminowa                                       ', 150);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(10, 'premia dlugoterminowa                                       ', 150);

--pensje
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(1, 'Przedstawiciel handlowy                                     ', 3500, 1);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(2, 'Pracownik administracji                                     ', 3600, 9);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(3, 'Pracownik administracji                                     ', 3600, 10);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(4, 'Przedstawiciel handlowy                                     ', 3500, 2);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(5, 'Przedstawiciel handlowy                                     ', 3500, 3);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(6, 'Magazynier                                                  ', 3000, 6);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(7, 'Kierownik                                                   ', 4200, 4);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(8, 'Magazynier                                                  ', 3000, 7);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(9, 'Przedstawiciel handlowy                                     ', 3500, 5);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(10, 'Magazynier                                                  ', 3000, 8);
