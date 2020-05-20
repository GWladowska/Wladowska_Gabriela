--0 zmiana d³ugoœci varchar - aby zmieœci³y sie modyfikacje numeru telefonu
ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon TYPE varchar(17) USING telefon::varchar;
--1
update ksiegowosc.pracownicy set telefon = '(+48) ' || telefon
--2
update ksiegowosc.pracownicy set telefon =substring(telefon,1,9) || '-' || substring(telefon,10,3) || '-' || substring(telefon,13,3) 
--3
select ksiegowosc.pracownicy.* from ksiegowosc.pracownicy order by char_length(nazwisko) desc limit 1
--4
select ksiegowosc.pracownicy.*,md5(ksiegowosc.pensja.kwota::text) as kwota from ksiegowosc.pracownicy 
join ksiegowosc.wynagrodzenie on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika 
join ksiegowosc.pensja on ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
--5
select ksiegowosc.pracownicy.*,ksiegowosc.pensja.kwota as pensja,ksiegowosc.premia.kwota as premia from ksiegowosc.pracownicy 
left join ksiegowosc.wynagrodzenie on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika 
left join ksiegowosc.pensja on ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
left join ksiegowosc.premia on ksiegowosc.premia.id_premii =ksiegowosc.wynagrodzenie.id_premii 
--6
select 'Pracownik ' || ksiegowosc.pracownicy.imie || ' ' || ksiegowosc.pracownicy.nazwisko || ' w dniu ' || ksiegowosc.wynagrodzenie.data::date
|| ' otrzyma³ pensje ca³kowit¹ na kwotê ' || ksiegowosc.pensja.kwota + ksiegowosc.premia.kwota || ', gdzie wynagrodzenie zasadnicze wynosi³o: '
|| ksiegowosc.pensja.kwota || ', premia: ' || ksiegowosc.premia.kwota || ', nadgodziny: ' || '0 z³' as raport
from ksiegowosc.pracownicy 
join ksiegowosc.wynagrodzenie on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika 
join ksiegowosc.pensja on ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
join ksiegowosc.premia on ksiegowosc.premia.id_premii =ksiegowosc.wynagrodzenie.id_premii 

