--zad6
--a
select id_pracownika, nazwisko from ksiegowosc.pracownicy
--b
select id_pracownika from ksiegowosc.wynagrodzenie join ksiegowosc.pensja on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
--where kwota > '1000';
--c
select id_pracownika from ksiegowosc.wynagrodzenie join ksiegowosc.pensja on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
where pensja.kwota > '2000' and wynagrodzenie.id_premii is null 
--d
select * from ksiegowosc.pracownicy where imie like 'J%'
--e
select * from ksiegowosc.pracownicy where nazwisko like '%n%' and imie like '%a'
--f
select imie,nazwisko,((liczba_godzin * 20)-160) as nadgodziny from ksiegowosc.pracownicy 
join ksiegowosc.godziny on ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
--g
select imie,nazwisko from ksiegowosc.pracownicy join ksiegowosc.wynagrodzenie on ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
join ksiegowosc.pensja on ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
where kwota between '1500' and '3000'
--h
select imie, nazwisko from ksiegowosc.pracownicy join ksiegowosc.godziny on ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
join ksiegowosc.wynagrodzenie on ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
join ksiegowosc.premia  on ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii 
where liczba_godzin > 8 and premia is null
--i
select pracownicy.*,kwota from ksiegowosc.pracownicy join ksiegowosc.wynagrodzenie on ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
join ksiegowosc.pensja on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
order by kwota
--j
select pracownicy.*,pensja.kwota,premia.kwota from ksiegowosc.pracownicy join ksiegowosc.wynagrodzenie on ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
join ksiegowosc.pensja on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
join ksiegowosc.premia on ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii
order by pensja.kwota,premia.kwota desc
--k
select stanowisko,count(stanowisko) as "pracownicy na stanowisku" from ksiegowosc.pracownicy join ksiegowosc.wynagrodzenie on ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
join ksiegowosc.pensja on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
group by stanowisko 
--l
select min(pensja.kwota::numeric + premia.kwota::numeric) as "minimum",avg(pensja.kwota::numeric + premia.kwota::numeric) as "srednia",max(pensja.kwota::numeric + premia.kwota::numeric) as "maksimum" from ksiegowosc.pensja 
join ksiegowosc.wynagrodzenie on ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
join ksiegowosc.premia on ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii 
where stanowisko like 'Kierownik'
--m
select sum(pensja.kwota)+sum(premia.kwota) as "suma wszystkich wynagrodzen" from ksiegowosc.pensja 
join ksiegowosc.wynagrodzenie on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
join ksiegowosc.premia on ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii 
--f
select sum(pensja.kwota)+sum(premia.kwota) as "suma wynagrodzen",stanowisko from ksiegowosc.pensja 
join ksiegowosc.wynagrodzenie on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
join ksiegowosc.premia on ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii
group by stanowisko 
--g
select count(premia.kwota) as "ilosc wystapien premii",stanowisko from ksiegowosc.premia 
join ksiegowosc.wynagrodzenie on ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii 
join ksiegowosc.pensja on ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
group by stanowisko 
--h
delete from ksiegowosc.pracownicy 
where id_pracownika in (
select ksiegowosc.pracownicy.id_pracownika from ksiegowosc.pracownicy 
join ksiegowosc.wynagrodzenie on ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
join ksiegowosc.pensja on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
where ksiegowosc.pensja.kwota < '1200'
);


