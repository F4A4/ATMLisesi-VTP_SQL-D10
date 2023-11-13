/*VERÝ TABANI DERSÝ SORGULAR MODÜLÜ ÖRNEK ÇALIÞMALARI*/
----VERÝ TABANI OLUÞTURMA
create database Pazarlama
--Veritabanýný silme
--drop database Pazarlama
--Kullanýlacak veritabanýný belirleme
use Pazarlama
--Tablo oluþturma
create table tblMusteri(
ID int primary key identity(1,1)
,AdSoyad nvarchar(50)
,DogumTarihi date
,Tel varchar(20)
,Adres nvarchar(150)
,Eposta nvarchar(300)
)

--Tablo Silme
 
--Tabloya kayýt ekleme
insert into tblMusteri(AdSoyad,DogumTarihi,Tel,Adres,Eposta)
values('Kübra Kahya','1996-11-12','332 321 54 68','Alaaddin Tepesi civarý Konya','kübra@hotmail.com')
,('Fatma Altay','2012-11-12','332 321 54 68','Alaaddin Tepesi civarý Konya','fatma@hotmail.com')
,('Hafize Güngör','2005-11-12','332 321 54 68','Alaaddin Tepesi civarý Konya','hafize@hotmail.com')
,('Aynur Uluþan','1994-11-12','332 321 54 68','Alaaddin Tepesi civarý Konya','aynur@hotmail.com')
,('Emine Kamacý','1999-11-12','332 321 54 68','Alaaddin Tepesi civarý Konya','emine@hotmail.com')
--drop table tblMusteri

create table tblBirim(
ID int primary key identity(1,1)
,BirimAd nvarchar(20)
)

insert into tblBirim 
values('Satýþ')
,('Depo')
,('Muhasebe')
,('Bilgi Ýþlem')
,('Ýdare')
--Ýliþkili tablo oluþturma
create table tblPersonel(
ID int primary key identity(1,1)
,Ad nvarchar(50)
,Soyad nvarchar(30)
,Maas money 
,BirimID int references tblBirim(ID)
) 

insert into tblPersonel
values('Aslý','Çiçek',2004,1)
,('Buket','Güneþ',1500,2)
,('Damla','Altýn',1800,2)
,('Yaðmur','Ýnce',1900,2)
,('Taner','Ýþbilir',1900,2)
,('Kaan','Temiz',3500,2)
drop table tblPersonel
select * from tblBirim
select * from tblPersonel 
--Seçme Sorgusu
select * from tblMusteri
--Tek bir alaný seçme
select AdSoyad from tblMusteri
--Birden alaný seçme
select AdSoyad,DogumTarihi from tblMusteri
select DogumTarihi,AdSoyad from tblMusteri

--istenilen alandaki kayýt veya kayýtlarý þu þekilde getiririz

select * from tblMusteri
where ID=3

select * from tblMusteri
where ID=36 or ID=38;

select * from tblMusteri
where AdSoyad='Kübra Kahya'

--Kayýt silme
delete from tblMusteri
where ID=6

--Kayýt güncelleme
update tblMusteri
set AdSoyad='Arif Uysal'
where ID=39

update tblMusteri
set AdSoyad='Arif Uysal',DogumTarihi='1976-10-01',Adres='Mut Mersin'
where ID=39
select*from tblMusteri

--SEÇME SORGUSU DETAYLARI 
select * from tblPersonel
where Maas>2000

select * from tblPersonel
where Maas<=2000

select * from tblPersonel
where Maas>2000 and Maas<2500

select * from tblPersonel
where Maas between 2000 and 2500  

select * from tblMusteri
where DogumTarihi<'2000-10-11'

select Ad+' '+Soyad as 'Personel Adý Soyadý',Maas
from tblPersonel
where Maas between 1500 and 2500

--Adý a ile baþlayan personelin adýný ve soyadýný ayný kolonda getiren sql sorgusu  
select Ad+' '+Soyad AdSoyad
from tblPersonel
where Ad Like 'a%'

--Adý n ile biten personelin adýný ve soyadýný ayný kolonda getiren sql sorgusu  
select Ad+' '+Soyad AdSoyad
from tblPersonel
where Ad Like '%a'

--Adýnda a geçen personelin adýný ve soyadýný ayný kolonda getiren sql sorgusu 
select Ad+' '+Soyad AdSoyad
from tblPersonel
where Ad Like '%a%'



--Maaþý 3500'e eþit olanlar
select * from tblPersonel 
where Maas=3500;

--Maaþý 3500'e eþit olmayanlar
select * from tblPersonel
where Maas!=3500;
select * from tblPersonel
where not Maas=3500;

--Maaþý 2000 ile 3000 arasýnda olmayan 
select * from tblPersonel 
where Maas not between 2000 and 3000

--maasý 1500 olan personelin mmasýný 1650.50 olarak deðiþtiriniz
 update tblPersonel
  set Maas=1650.50
  where Maas=1800
  
  select * from tblPersonel    
  --Maasý .50 kurus ile biten personellerin listesini veren sql sorgusunu yazýnýz
  select * from tblPersonel where Maas Like '%.50' 

  insert into tblPersonel(Ad,Soyad) values ('Kübra',' Kahya')
  select * from tblPersonel where Maas is not null

  ------------------SIRALAMA ÝÞLEMLER-----------------------

  --Maaþýný küçükten büyüðe göre sýralar
  select * from tblPersonel
  order by Maas

  --Maaþýný büyükten küçüðe göre sýralar
  select * from tblPersonel
  order by Maas desc

  select * from tblPersonel
  order by Maas desc,Ad

  ------------------------------SQL SORGULARI------------------------------------

  ---UPPER()---Karakterleri büyük harfe çevirir.
  select p.Ad+' '+UPPER(p.Soyad)
  from tblPersonel p

  ---LOWER()---Karakterleri küçük harfe çevirir.
  select p.Ad+' '+LOWER(p.Soyad)
  from tblPersonel p

  ---SUBSTRING()---Karakterlerin içinden belli sayýda karakterleri alýr.
  select p.Ad+' '+SUBSTRING(p.Soyad,2,3)
  from tblPersonel p

  ---LEFT()---Karakterlerin içinden SOLDAN belli sayýda karakterleri alýr.
  select p.Ad+' '+LEFT(p.Soyad,3)
  from tblPersonel p

  ---RIGHT()---Karakterlerin içinden SAÐDAN belli sayýda karakterleri alýr.
  select p.Ad+' '+RIGHT(p.Soyad,3)
  from tblPersonel p

  ---COUNT()---Verilen alanda kaç kayýt olduðunu dönderir.
  select COUNT(p.Soyad)
  from tblPersonel p

   ---LEN()---Verilen alanýn karakter sayýsýný dönderir.
  select LEN(p.Soyad) as 'Soyaddaki karakter sayýsýn dönderir.'
  from tblPersonel p

  ------------------METOTLARI ÝÇ ÝÇE KULLANMA--------------------------
  
  select p.Ad+' '+UPPER(LEFT(p.Soyad,3))
  from tblPersonel p

  ---CHARÝNDEX---Aranan karakterin kaçýncý sýrada olduðunu gösterir.
  select CHARINDEX('@',m. Eposta,1) 
  from tblMusteri m

  select RIGHT(Eposta,(LEN(Eposta)-(CHARINDEX('@',Eposta,1))))
  from tblMusteri 
  
  select  RIGHT(m.Eposta,(CHARINDEX(m.Eposta,1)))
  from tblMusteri m

  ---ROUND()---Sayýsal alandaki virgüllü sayýlarý yuvarlar.
  select ROUND(2.6274,2)
  ---FLOOR()---Kendisine verilen sayýlarýn virgülden sonrasýný yok sayar.
  select FLOOR(2.6274)

  -------------TARÝHSEL FONKSÝYONLAR----------------------------

  --Sistemin tarih ve saatini döndürür.
  select GETDATE() as Tarih

  SELECT*, CONVERT(VARCHAR, DogumTarihi, 104) from tblMusteri
  SELECT*, CONVERT(VARCHAR, DogumTarihi, 108) from tblMusteri

  ----------------------------------------------------------------
SELECT CONVERT(VARCHAR, GETDATE(), 0)   --Sonuç : Jul 17 2009  4:43PM
SELECT CONVERT(VARCHAR, GETDATE(), 1)     --Sonuç : 07/17/09
SELECT CONVERT(VARCHAR, GETDATE(), 2)     --Sonuç : 09.07.17
SELECT CONVERT(VARCHAR, GETDATE(), 3)     --Sonuç : 17/07/09
SELECT CONVERT(VARCHAR, GETDATE(), 4)     --Sonuç : 17.07.09
SELECT CONVERT(VARCHAR, GETDATE(), 5)     --Sonuç : 17-07-09
SELECT CONVERT(VARCHAR, GETDATE(), 6)     --Sonuç : 17 Jul 09
SELECT CONVERT(VARCHAR, GETDATE(), 7)     --Sonuç : Jul 17, 09
SELECT CONVERT(VARCHAR, GETDATE(), 8)     --Sonuç : 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 9)     --Sonuç : Jul 17 2009  4:43:05:573PM
SELECT CONVERT(VARCHAR, GETDATE(), 10)    --Sonuç : 07-17-09
SELECT CONVERT(VARCHAR, GETDATE(), 11)    --Sonuç : 09/07/17
SELECT CONVERT(VARCHAR, GETDATE(), 12)    --Sonuç : 090717
SELECT CONVERT(VARCHAR, GETDATE(), 13)    --Sonuç : 17 Jul 2009 16:43:05:590
SELECT CONVERT(VARCHAR, GETDATE(), 14)    --Sonuç : 16:43:05:590
SELECT CONVERT(VARCHAR, GETDATE(), 20)    --Sonuç : 2009-07-17 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 21)    --Sonuç : 2009-07-17 16:43:05.590
SELECT CONVERT(VARCHAR, GETDATE(), 22)    --Sonuç : 07/17/09  4:43:05 PM
SELECT CONVERT(VARCHAR, GETDATE(), 23)    --Sonuç : 2009-07-17
SELECT CONVERT(VARCHAR, GETDATE(), 24)    --Sonuç : 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 25)    --Sonuç : 2009-07-17 16:43:05.590
SELECT CONVERT(VARCHAR, GETDATE(), 100)   --Sonuç : Jul 17 2009  4:43PM
SELECT CONVERT(VARCHAR, GETDATE(), 101)   --Sonuç : 07/17/2009
SELECT CONVERT(VARCHAR, GETDATE(), 102)   --Sonuç : 2009.07.17
SELECT CONVERT(VARCHAR, GETDATE(), 103)   --Sonuç : 17/07/2009
SELECT CONVERT(VARCHAR, GETDATE(), 104)   --Sonuç : 17.07.2009
SELECT CONVERT(VARCHAR, GETDATE(), 105)   --Sonuç : 17-07-2009
SELECT CONVERT(VARCHAR, GETDATE(), 106)   --Sonuç : 17 Jul 2009
SELECT CONVERT(VARCHAR, GETDATE(), 107)   --Sonuç : Jul 17, 2009
SELECT CONVERT(VARCHAR, GETDATE(), 108)   --Sonuç : 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 109)   --Sonuç : Jul 17 2009  4:43:05:607PM
SELECT CONVERT(VARCHAR, GETDATE(), 110)   --Sonuç : 07-17-2009
SELECT CONVERT(VARCHAR, GETDATE(), 111)   --Sonuç : 2009/07/17
SELECT CONVERT(VARCHAR, GETDATE(), 112)   --Sonuç : 20090717
SELECT CONVERT(VARCHAR, GETDATE(), 113)   --Sonuç : 17 Jul 2009 16:43:05:607
SELECT CONVERT(VARCHAR, GETDATE(), 114)   --Sonuç : 16:43:05:620
SELECT CONVERT(VARCHAR, GETDATE(), 120)   --Sonuç : 2009-07-17 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 121)   --Sonuç : 2009-07-17 16:43:05.620
SELECT CONVERT(VARCHAR, GETDATE(), 126)   --Sonuç : 2009-07-17T16:43:05.620
SELECT CONVERT(VARCHAR, GETDATE(), 127)   --Sonuç : 2009-07-17T16:43:05.620

--Bir tarihin içinden yýlý almak için kullanýlýr.
select YEAR(GETDATE())
select YEAR(DogumTarihi) from tblMusteri

--Tarihten ayý almak
select MONTH(DogumTarihi) from tblMusteri

--Gününü almak
select DAY(DogumTarihi) from tblMusteri

--Bir tarihe gün eklemek
select DATEADD(DD,10,GETDATE())

--Ay eklemek
select DATEADD(MM,10,GETDATE())

--Yýl eklemek
select DATEADD(YY,10,GETDATE())

--Verilen iki tarih arasýnda SAAT farkýný almak
select DATEDIFF(DD,'1996-04-12',GETDATE())
select DATEDIFF(MM,'1996-04-12',GETDATE())
select DATEDIFF(YY,'1996-04-12',GETDATE())
select DATEDIFF(HH,'1996-04-12',GETDATE())
select DATEDIFF(MI,'1996-04-12',GETDATE())
select DATEDIFF(SS,'1996-04-12',GETDATE())
/***************************MATEMATÝKSEL FONKSÝYONLARI*************************/
--Kaç kayýt olduðunu sayar
select COUNT(ID) FROM tblPersonel
--Bir alandaki veriler toplamý 
select SUM(Maas) from tblPersonel
--BirimID=1 olan personellerin maaþlarý toplamý 
select SUM(Maas) from tblPersonel
where BirimID=1
--AVG ortalama alýr
select AVG(Maas) from tblPersonel
--BirimID=1 olan personellerin Ortalama maaþ toplamý
select SUM(Maas) from tblPersonel
where BirimID=1
--Bir kayýt kümesindeki en büyük deðeri döndürür
select MAX(Maas) from tblPersonel
--Bir kayýt kümesindeki en büyük deðeri döndürür
select MIN(Maas) from tblPersonel

/************************GRUPLAYARAK SORGULAMA**************************/
--Personellerin maaþ toplamý birime göre gruplayarak gösterme
select SUM(Maas), BirimID from tblPersonel
group by BirimID

--Personellerin maaþ ortalamasýný birime göre gruplayarak gösterme 
select AVG(Maas),BirimID from tblPersonel
 group by BirimID

--Personellerin maaþlarýnýn en büyüðünü birime göre gruplayarak gösterme
select MAX(Maas),BirimID from tblPersonel
group by BirimID
--Personellerin maaþlarýnýn en küçüðünü birime göre gruplayarak gösterme
select MIN(Maas),BirimID from tblPersonel
group by BirimID


--  KAYIT EKLEME SÝLME VE GÜNCELLEME ÝLE ÝLGÝLÝ 10 TANE  SQL SORGUSU HAZIRLA
create table tblSorular(
ID int primary key identity(1,1)
,Soru nvarchar(50)
)
insert into tblSorular
values('BÝR TABLOYA DOÐRUDAN KAYIT EKLEME')
,('BÝR TABLODAN KAYIT ÇAÐIRMA')
,('KAYIT GÜNCELLEME ')
,('KAYDI DELETE ÝLE SÝLME')
,('BÝR TABLOYU DROPLA SÝLME')
,('BÝR VERÝ TABANINI DROPLA SÝLME')
,('ÝLÝÞKÝLÝ TABLO OLUÞTURMA')
,('TABLODAN TEK BÝR ALANI SEÇME ')
,('VERÝTABANI KULLANIMI')
,('PERSONEL TABLOSUNDAN SOYADI ‘k’ ÝLE BÝTENLERÝ GETÝREN SQL SORGUSU')
/**********1.SORU**************/
create table tblOrnek(
ID int primary key identity(1,1)
,Ornek nvarchar(50)
)
insert into tblOrnek
values('Kübra KAHYA')
,('Ömer KALAYCI')
/**********2.SORU**************/
select*from tblOrnek
where ID=1
/**********3.SORU**************/
update tblOrnek
set Ornek='Kaydý güncellediðinin farkýndamýsýn???'
where ID=1
select * from tblOrnek
/**********4.SORU**************/
delete from tblOrnek
where ID=2
select * from tblOrnek
/**********5.SORU**************/
drop table tblOrnek
--select * from tblOrnek
/**********6.SORU**************/
create database Pazarlama
drop database Pazarlama
/**********7.SORU**************/
create table tblBirim(
ID int primary key identity(1,1)
,BirimAd nvarchar(20)
)

insert into tblBirim 
values('Satýþ')
,('Depo')
,('Muhasebe')
,('Bilgi Ýþlem')
,('Ýdare')
create table tblPersonel(
ID int primary key identity(1,1)
,Ad nvarchar(50)
,Soyad nvarchar(30)
,Maas money 
,BirimID int references tblBirim(ID)
) 
insert into tblPersonel
values('Aslý','Çiçek',2004,1)
,('Buket','Güneþ',1500,2)
,('Damla','Altýn',1800,2)

/**********8.SORU**************/
select Ad from tblPersonel
/**********9.SORU**************/
  create database Pazarlama
  use Pazarlama

/**********10.SORU**************/
select * from tblPersonel where Soyad Like '%k'
select Ad+' '+Soyad AdSoyad

from tblPersonel
where Ad Like '%a%'

select top(5)* from tblMusteri
order by ID desc

select top(1)*from tblMusteri
order by NEWID() 

