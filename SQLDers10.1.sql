/*VER� TABANI DERS� SORGULAR MOD�L� �RNEK �ALI�MALARI*/
----VER� TABANI OLU�TURMA
create database Pazarlama
--Veritaban�n� silme
--drop database Pazarlama
--Kullan�lacak veritaban�n� belirleme
use Pazarlama
--Tablo olu�turma
create table tblMusteri(
ID int primary key identity(1,1)
,AdSoyad nvarchar(50)
,DogumTarihi date
,Tel varchar(20)
,Adres nvarchar(150)
,Eposta nvarchar(300)
)

--Tablo Silme
 
--Tabloya kay�t ekleme
insert into tblMusteri(AdSoyad,DogumTarihi,Tel,Adres,Eposta)
values('K�bra Kahya','1996-11-12','332 321 54 68','Alaaddin Tepesi civar� Konya','k�bra@hotmail.com')
,('Fatma Altay','2012-11-12','332 321 54 68','Alaaddin Tepesi civar� Konya','fatma@hotmail.com')
,('Hafize G�ng�r','2005-11-12','332 321 54 68','Alaaddin Tepesi civar� Konya','hafize@hotmail.com')
,('Aynur Ulu�an','1994-11-12','332 321 54 68','Alaaddin Tepesi civar� Konya','aynur@hotmail.com')
,('Emine Kamac�','1999-11-12','332 321 54 68','Alaaddin Tepesi civar� Konya','emine@hotmail.com')
--drop table tblMusteri

create table tblBirim(
ID int primary key identity(1,1)
,BirimAd nvarchar(20)
)

insert into tblBirim 
values('Sat��')
,('Depo')
,('Muhasebe')
,('Bilgi ��lem')
,('�dare')
--�li�kili tablo olu�turma
create table tblPersonel(
ID int primary key identity(1,1)
,Ad nvarchar(50)
,Soyad nvarchar(30)
,Maas money 
,BirimID int references tblBirim(ID)
) 

insert into tblPersonel
values('Asl�','�i�ek',2004,1)
,('Buket','G�ne�',1500,2)
,('Damla','Alt�n',1800,2)
,('Ya�mur','�nce',1900,2)
,('Taner','��bilir',1900,2)
,('Kaan','Temiz',3500,2)
drop table tblPersonel
select * from tblBirim
select * from tblPersonel 
--Se�me Sorgusu
select * from tblMusteri
--Tek bir alan� se�me
select AdSoyad from tblMusteri
--Birden alan� se�me
select AdSoyad,DogumTarihi from tblMusteri
select DogumTarihi,AdSoyad from tblMusteri

--istenilen alandaki kay�t veya kay�tlar� �u �ekilde getiririz

select * from tblMusteri
where ID=3

select * from tblMusteri
where ID=36 or ID=38;

select * from tblMusteri
where AdSoyad='K�bra Kahya'

--Kay�t silme
delete from tblMusteri
where ID=6

--Kay�t g�ncelleme
update tblMusteri
set AdSoyad='Arif Uysal'
where ID=39

update tblMusteri
set AdSoyad='Arif Uysal',DogumTarihi='1976-10-01',Adres='Mut Mersin'
where ID=39
select*from tblMusteri

--SE�ME SORGUSU DETAYLARI 
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

select Ad+' '+Soyad as 'Personel Ad� Soyad�',Maas
from tblPersonel
where Maas between 1500 and 2500

--Ad� a ile ba�layan personelin ad�n� ve soyad�n� ayn� kolonda getiren sql sorgusu  
select Ad+' '+Soyad AdSoyad
from tblPersonel
where Ad Like 'a%'

--Ad� n ile biten personelin ad�n� ve soyad�n� ayn� kolonda getiren sql sorgusu  
select Ad+' '+Soyad AdSoyad
from tblPersonel
where Ad Like '%a'

--Ad�nda a ge�en personelin ad�n� ve soyad�n� ayn� kolonda getiren sql sorgusu 
select Ad+' '+Soyad AdSoyad
from tblPersonel
where Ad Like '%a%'



--Maa�� 3500'e e�it olanlar
select * from tblPersonel 
where Maas=3500;

--Maa�� 3500'e e�it olmayanlar
select * from tblPersonel
where Maas!=3500;
select * from tblPersonel
where not Maas=3500;

--Maa�� 2000 ile 3000 aras�nda olmayan 
select * from tblPersonel 
where Maas not between 2000 and 3000

--maas� 1500 olan personelin mmas�n� 1650.50 olarak de�i�tiriniz
 update tblPersonel
  set Maas=1650.50
  where Maas=1800
  
  select * from tblPersonel    
  --Maas� .50 kurus ile biten personellerin listesini veren sql sorgusunu yaz�n�z
  select * from tblPersonel where Maas Like '%.50' 

  insert into tblPersonel(Ad,Soyad) values ('K�bra',' Kahya')
  select * from tblPersonel where Maas is not null

  ------------------SIRALAMA ��LEMLER-----------------------

  --Maa��n� k���kten b�y��e g�re s�ralar
  select * from tblPersonel
  order by Maas

  --Maa��n� b�y�kten k����e g�re s�ralar
  select * from tblPersonel
  order by Maas desc

  select * from tblPersonel
  order by Maas desc,Ad

  ------------------------------SQL SORGULARI------------------------------------

  ---UPPER()---Karakterleri b�y�k harfe �evirir.
  select p.Ad+' '+UPPER(p.Soyad)
  from tblPersonel p

  ---LOWER()---Karakterleri k���k harfe �evirir.
  select p.Ad+' '+LOWER(p.Soyad)
  from tblPersonel p

  ---SUBSTRING()---Karakterlerin i�inden belli say�da karakterleri al�r.
  select p.Ad+' '+SUBSTRING(p.Soyad,2,3)
  from tblPersonel p

  ---LEFT()---Karakterlerin i�inden SOLDAN belli say�da karakterleri al�r.
  select p.Ad+' '+LEFT(p.Soyad,3)
  from tblPersonel p

  ---RIGHT()---Karakterlerin i�inden SA�DAN belli say�da karakterleri al�r.
  select p.Ad+' '+RIGHT(p.Soyad,3)
  from tblPersonel p

  ---COUNT()---Verilen alanda ka� kay�t oldu�unu d�nderir.
  select COUNT(p.Soyad)
  from tblPersonel p

   ---LEN()---Verilen alan�n karakter say�s�n� d�nderir.
  select LEN(p.Soyad) as 'Soyaddaki karakter say�s�n d�nderir.'
  from tblPersonel p

  ------------------METOTLARI �� ��E KULLANMA--------------------------
  
  select p.Ad+' '+UPPER(LEFT(p.Soyad,3))
  from tblPersonel p

  ---CHAR�NDEX---Aranan karakterin ka��nc� s�rada oldu�unu g�sterir.
  select CHARINDEX('@',m. Eposta,1) 
  from tblMusteri m

  select RIGHT(Eposta,(LEN(Eposta)-(CHARINDEX('@',Eposta,1))))
  from tblMusteri 
  
  select  RIGHT(m.Eposta,(CHARINDEX(m.Eposta,1)))
  from tblMusteri m

  ---ROUND()---Say�sal alandaki virg�ll� say�lar� yuvarlar.
  select ROUND(2.6274,2)
  ---FLOOR()---Kendisine verilen say�lar�n virg�lden sonras�n� yok sayar.
  select FLOOR(2.6274)

  -------------TAR�HSEL FONKS�YONLAR----------------------------

  --Sistemin tarih ve saatini d�nd�r�r.
  select GETDATE() as Tarih

  SELECT*, CONVERT(VARCHAR, DogumTarihi, 104) from tblMusteri
  SELECT*, CONVERT(VARCHAR, DogumTarihi, 108) from tblMusteri

  ----------------------------------------------------------------
SELECT CONVERT(VARCHAR, GETDATE(), 0)   --Sonu� : Jul 17 2009  4:43PM
SELECT CONVERT(VARCHAR, GETDATE(), 1)     --Sonu� : 07/17/09
SELECT CONVERT(VARCHAR, GETDATE(), 2)     --Sonu� : 09.07.17
SELECT CONVERT(VARCHAR, GETDATE(), 3)     --Sonu� : 17/07/09
SELECT CONVERT(VARCHAR, GETDATE(), 4)     --Sonu� : 17.07.09
SELECT CONVERT(VARCHAR, GETDATE(), 5)     --Sonu� : 17-07-09
SELECT CONVERT(VARCHAR, GETDATE(), 6)     --Sonu� : 17 Jul 09
SELECT CONVERT(VARCHAR, GETDATE(), 7)     --Sonu� : Jul 17, 09
SELECT CONVERT(VARCHAR, GETDATE(), 8)     --Sonu� : 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 9)     --Sonu� : Jul 17 2009  4:43:05:573PM
SELECT CONVERT(VARCHAR, GETDATE(), 10)    --Sonu� : 07-17-09
SELECT CONVERT(VARCHAR, GETDATE(), 11)    --Sonu� : 09/07/17
SELECT CONVERT(VARCHAR, GETDATE(), 12)    --Sonu� : 090717
SELECT CONVERT(VARCHAR, GETDATE(), 13)    --Sonu� : 17 Jul 2009 16:43:05:590
SELECT CONVERT(VARCHAR, GETDATE(), 14)    --Sonu� : 16:43:05:590
SELECT CONVERT(VARCHAR, GETDATE(), 20)    --Sonu� : 2009-07-17 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 21)    --Sonu� : 2009-07-17 16:43:05.590
SELECT CONVERT(VARCHAR, GETDATE(), 22)    --Sonu� : 07/17/09  4:43:05 PM
SELECT CONVERT(VARCHAR, GETDATE(), 23)    --Sonu� : 2009-07-17
SELECT CONVERT(VARCHAR, GETDATE(), 24)    --Sonu� : 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 25)    --Sonu� : 2009-07-17 16:43:05.590
SELECT CONVERT(VARCHAR, GETDATE(), 100)   --Sonu� : Jul 17 2009  4:43PM
SELECT CONVERT(VARCHAR, GETDATE(), 101)   --Sonu� : 07/17/2009
SELECT CONVERT(VARCHAR, GETDATE(), 102)   --Sonu� : 2009.07.17
SELECT CONVERT(VARCHAR, GETDATE(), 103)   --Sonu� : 17/07/2009
SELECT CONVERT(VARCHAR, GETDATE(), 104)   --Sonu� : 17.07.2009
SELECT CONVERT(VARCHAR, GETDATE(), 105)   --Sonu� : 17-07-2009
SELECT CONVERT(VARCHAR, GETDATE(), 106)   --Sonu� : 17 Jul 2009
SELECT CONVERT(VARCHAR, GETDATE(), 107)   --Sonu� : Jul 17, 2009
SELECT CONVERT(VARCHAR, GETDATE(), 108)   --Sonu� : 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 109)   --Sonu� : Jul 17 2009  4:43:05:607PM
SELECT CONVERT(VARCHAR, GETDATE(), 110)   --Sonu� : 07-17-2009
SELECT CONVERT(VARCHAR, GETDATE(), 111)   --Sonu� : 2009/07/17
SELECT CONVERT(VARCHAR, GETDATE(), 112)   --Sonu� : 20090717
SELECT CONVERT(VARCHAR, GETDATE(), 113)   --Sonu� : 17 Jul 2009 16:43:05:607
SELECT CONVERT(VARCHAR, GETDATE(), 114)   --Sonu� : 16:43:05:620
SELECT CONVERT(VARCHAR, GETDATE(), 120)   --Sonu� : 2009-07-17 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 121)   --Sonu� : 2009-07-17 16:43:05.620
SELECT CONVERT(VARCHAR, GETDATE(), 126)   --Sonu� : 2009-07-17T16:43:05.620
SELECT CONVERT(VARCHAR, GETDATE(), 127)   --Sonu� : 2009-07-17T16:43:05.620

--Bir tarihin i�inden y�l� almak i�in kullan�l�r.
select YEAR(GETDATE())
select YEAR(DogumTarihi) from tblMusteri

--Tarihten ay� almak
select MONTH(DogumTarihi) from tblMusteri

--G�n�n� almak
select DAY(DogumTarihi) from tblMusteri

--Bir tarihe g�n eklemek
select DATEADD(DD,10,GETDATE())

--Ay eklemek
select DATEADD(MM,10,GETDATE())

--Y�l eklemek
select DATEADD(YY,10,GETDATE())

--Verilen iki tarih aras�nda SAAT fark�n� almak
select DATEDIFF(DD,'1996-04-12',GETDATE())
select DATEDIFF(MM,'1996-04-12',GETDATE())
select DATEDIFF(YY,'1996-04-12',GETDATE())
select DATEDIFF(HH,'1996-04-12',GETDATE())
select DATEDIFF(MI,'1996-04-12',GETDATE())
select DATEDIFF(SS,'1996-04-12',GETDATE())
/***************************MATEMAT�KSEL FONKS�YONLARI*************************/
--Ka� kay�t oldu�unu sayar
select COUNT(ID) FROM tblPersonel
--Bir alandaki veriler toplam� 
select SUM(Maas) from tblPersonel
--BirimID=1 olan personellerin maa�lar� toplam� 
select SUM(Maas) from tblPersonel
where BirimID=1
--AVG ortalama al�r
select AVG(Maas) from tblPersonel
--BirimID=1 olan personellerin Ortalama maa� toplam�
select SUM(Maas) from tblPersonel
where BirimID=1
--Bir kay�t k�mesindeki en b�y�k de�eri d�nd�r�r
select MAX(Maas) from tblPersonel
--Bir kay�t k�mesindeki en b�y�k de�eri d�nd�r�r
select MIN(Maas) from tblPersonel

/************************GRUPLAYARAK SORGULAMA**************************/
--Personellerin maa� toplam� birime g�re gruplayarak g�sterme
select SUM(Maas), BirimID from tblPersonel
group by BirimID

--Personellerin maa� ortalamas�n� birime g�re gruplayarak g�sterme 
select AVG(Maas),BirimID from tblPersonel
 group by BirimID

--Personellerin maa�lar�n�n en b�y���n� birime g�re gruplayarak g�sterme
select MAX(Maas),BirimID from tblPersonel
group by BirimID
--Personellerin maa�lar�n�n en k�����n� birime g�re gruplayarak g�sterme
select MIN(Maas),BirimID from tblPersonel
group by BirimID


--  KAYIT EKLEME S�LME VE G�NCELLEME �LE �LG�L� 10 TANE  SQL SORGUSU HAZIRLA
create table tblSorular(
ID int primary key identity(1,1)
,Soru nvarchar(50)
)
insert into tblSorular
values('B�R TABLOYA DO�RUDAN KAYIT EKLEME')
,('B�R TABLODAN KAYIT �A�IRMA')
,('KAYIT G�NCELLEME ')
,('KAYDI DELETE �LE S�LME')
,('B�R TABLOYU DROPLA S�LME')
,('B�R VER� TABANINI DROPLA S�LME')
,('�L��K�L� TABLO OLU�TURMA')
,('TABLODAN TEK B�R ALANI SE�ME ')
,('VER�TABANI KULLANIMI')
,('PERSONEL TABLOSUNDAN SOYADI �k� �LE B�TENLER� GET�REN SQL SORGUSU')
/**********1.SORU**************/
create table tblOrnek(
ID int primary key identity(1,1)
,Ornek nvarchar(50)
)
insert into tblOrnek
values('K�bra KAHYA')
,('�mer KALAYCI')
/**********2.SORU**************/
select*from tblOrnek
where ID=1
/**********3.SORU**************/
update tblOrnek
set Ornek='Kayd� g�ncelledi�inin fark�ndam�s�n???'
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
values('Sat��')
,('Depo')
,('Muhasebe')
,('Bilgi ��lem')
,('�dare')
create table tblPersonel(
ID int primary key identity(1,1)
,Ad nvarchar(50)
,Soyad nvarchar(30)
,Maas money 
,BirimID int references tblBirim(ID)
) 
insert into tblPersonel
values('Asl�','�i�ek',2004,1)
,('Buket','G�ne�',1500,2)
,('Damla','Alt�n',1800,2)

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

