-- A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!
-- 13. feladat
CREATE DATABASE parkolohaz CHARACTER SET utf8 COLLATE utf8_hungarian_ci;

-- ***
-- 15. feladat
select count(parkolohely.id) as masfeles_parkolohelyek_szama
from parkolohely
where parkolohely.szelesseg = 1.5;

-- ***
-- 16. feladat
insert into jarmutipus (nev)
values ('Elektromos gépjármű');
update parkolohely
set parkolohely.jarmutipusId=(select jarmutipus.id from jarmutipus where jarmutipus.nev = 'Elektromos gépjármű')
where parkolohely.felirat = 'P001';

-- ***
-- 17. feladat
select f.nev, foglalas.ar, foglalas.datum
from foglalas
         inner join felhasznalo f on foglalas.felhasznaloId = f.id
where f.nev = 'Kovács Anna';

-- ***
-- 18. feladat
select felhasznalo.nev as nev, sum(foglalas.ar) as szumma_tartozas
from jarmutipus
         inner join parkolohely on jarmutipus.id = parkolohely.jarmutipusId
         inner join foglalas on parkolohely.id = foglalas.parkolohelyId
         inner join felhasznalo on foglalas.felhasznaloId = felhasznalo.id
where foglalas.fizetve = 0
  and jarmutipus.nev = 'Motorkerékpár'
group by foglalas.felhasznaloId
order by szumma_tartozas desc limit 1;

-- ***
