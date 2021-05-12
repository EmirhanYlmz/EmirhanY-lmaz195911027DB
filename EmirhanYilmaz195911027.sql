CREATE DATABASE Emirhan CHARACTER SET utf8 COLLATE utf8_turkish_ci;
use Emirhan;

Create table uruntipi (
 uruntipid int not null,
 uruntipadi varchar(100),
 primary key (uruntipid)
);
Create table urunler(
urunid int not null primary key,
uruntipid int not null,
urunadi varchar(100),
urunozellikleri varchar(100),
olusturmatarihi date,
guncellemetarihi date,
 foreign key (uruntipid)  references uruntipi(uruntipid)
);

Create table iltbl(
ilid int not null,
iladi varchar(100),
primary key(ilid)
);

Create table ilcetbl(
ilceid int not null primary key,
ilid int not null,
ilceadi varchar(100),
 foreign key (ilid)  references iltbl(ilid)
);

Create table musteri(
musteriid int not null primary key,
ilid int not null,
ilceid int not null,
isim varchar(100),
soyisim varchar(100),
acikadres varchar(100),
tckimlik varchar(100),
tel varchar(100),
olusturmatarihi date,
guncellemetarihi date,
foreign key (ilid)  references iltbl(ilid),
foreign key (ilceid)  references ilcetbl(ilceid)
);

Create table fatura(
faturaid int not null primary key,
musteriid int not null,
ilid int not null,
ilceid int not null,
urunid int not null,
uruntipid int not null,
tutar varchar(100),
olusturmatarihi date,
foreign key (musteriid)  references musteri(musteriid),
foreign key (ilid)  references iltbl(ilid),
foreign key (ilceid)  references ilcetbl(ilceid),
foreign key (uruntipid)  references uruntipi(uruntipid),
foreign key (urunid)  references urunler(urunid)
);

Create table siparis(
siparisid int not null primary key,
faturaid int not null,
siparisno varchar(100),
foreign key (faturaid)  references fatura(faturaid)
);

insert into uruntipi(uruntipid, uruntipadi)
values( 1, 'İşlemci'),
(2, 'Ekran kartı'),
(3, 'Harddisk'),
(4, 'Ram(Bellek)'),
(5, 'Anakart'),
(6, 'Güç Kaynağı(PowerSuply)'),
(7, 'Fan(Soğutma Sistemleri)'),
(8, 'Mouse(Fare)'),
(9, 'Klavye'),
(10, 'Monitör'),
(11, 'Kasa'),
(12, 'Kablolar'),
(13, 'Ağ ürünleri'),
(15, 'Laptop'),
(16, 'Ses Sistemleri'),
(17, 'Adaptörler'),
(18, 'Kamera'),
(19, 'Kulaklık/Mikrofon'),
(20, 'Yazıcı');

select*from uruntipi;

insert into urunler(urunid, uruntipid, urunadi, urunozellikleri, olusturmatarihi, guncellemetarihi)
values(1, 1, 'AMD Ryzen 5 2600 İşlemci', '3.9GHz 16MB Cache Soket AM4 ', sysdate(), sysdate()),
(2, 4, 'Kingston 8GB HyperX Fury Black DDR4', '8GB HyperX Fury Black DDR4 3200MHz CL16 1.35V PC', sysdate(), sysdate()),
(3, 3, 'Seagate 3.5 2TB', '2tb 7200 Rpm 256mb Sata3 Pc Hdd', sysdate(), sysdate()),
(4, 5, 'ASUS TUF GAMING B560M-PLUS', 'WIFI INTEL B560 Soket 1200 DDR4 5000MHz (OC) Anakart', sysdate(), sysdate()),
(5, 2, 'ZOTAC GeForce RTX 3060 TWIN EDGE', 'GAMING OC 12GB GDDR6 192Bit NVIDIA ',  sysdate(), sysdate()),
(6, 6, 'COOLER MASTER MWE 750 Watt', '80PLUS BRONZE 750W 2xEPS, AKTİF PFC 120MM FANLI', sysdate(), sysdate()),
(7, 11, 'COUGAR MX410 GAMING KASA', 'MESH-G RGB 4x120mm ARGB FANLI 650W 80 PLUS USB3.0', sysdate(), sysdate()),
(8, 15, 'ASUS TUF GAMING 15', 'CORE İ5 10300H 2.5GHZ-8GB-512GB SSD-15.6"-GTX1650TI 4GB-W10', sysdate(), sysdate()),
(9, 7, 'COOLER MASTER MASTERLIQUID SSIVI SOĞUTUCU', 'ML360R ADRESLENEBİLİR RGB FANLI SIVI SOĞUTMA KİTİ', sysdate(), sysdate()),
(10, 8, 'A4TECH BLOODY W60', 'MAX 10K CPI RGB GAMING MOUSE DPI 10000 BLACK', sysdate(), sysdate()),
(11, 9, 'RAZER BLACKWIDOW', 'V3 PRO KLAVYE GREEN SWITCH', sysdate(), sysdate()),
(12, 12,'S-LINK SL-SATA', '15 Metre SATA KABLOSU', sysdate(), sysdate()),
(13, 10, 'ASUS 24,5 VG259QR', 'TUF GAMING 1Ms 165Hz FREESYNC VE G-SYNC IPS GAMING MONITOR', sysdate(), sysdate()),
(14, 10, 'ASUS 27 VG259QR', 'TUF GAMING 1Ms 165Hz FREESYNC VE G-SYNC IPS GAMING MONITOR', sysdate(), sysdate()),
(15, 13, 'ASUS DSL-AX82U', '574MBPS-4808MBPS VDSL DESTEKLİ KABLOSUZ-AX 4 PORT ADSL2+ MODEM', sysdate(), sysdate()),
(16, 16,'LOGITECH Z607', '5.1 SURROUND ALL IN ONE TV SPEAKER', sysdate(), sysdate()),
(17, 17, 'ADDISON AD-980-90W', '90W USB Lİ UNİVERSAL NOTEBOOK ADAPTÖR', sysdate(), sysdate()),
(18, 18, 'LOGITECH BRIO 4K Kamera', '4K ULTRA HD STREAM WEBCAM', sysdate(), sysdate()),
(19, 19, 'HYPERX CLOUD II 7.1', '7.1 SURROUND OYUN KULAKLIĞI - KIRMIZI', sysdate(), sysdate()),
(20, 20, 'HP NEVERSTOP 1200W', 'FOTOKOPİ,TARAYICI,WİFİ TANKLI LASER YAZICI', sysdate(), sysdate());

select*from urunler;

SELECT  uruntipadi as ÜrünTipi, urunadi as ÜrünAdi, 
urunozellikleri as ÜrünÖzellikleri, olusturmatarihi as 
İlkoluşturma, guncellemetarihi as Kayitguncelleme
FROM uruntipi
INNER JOIN urunler ON uruntipi.uruntipid = urunler.uruntipid;

insert into iltbl(ilid, iladi)
values( 1, 'İstanbul'),
(2, 'Ankara'),
(3, 'Bursa'),
(4, 'Kastamonu'),
(5, 'Sakarya'),
(6, 'Edirne'),
(7, 'Antalya'),
(8, 'Malatya'),
(9, 'Zonguldak'),
(10, 'Balıkesir'),
(11, 'Ordu'),
(12, 'Konya'),
(13, 'Denizli'),
(14, 'Adana'),
(15, 'İzmir'),
(16, 'Bolu'),
(17, 'Karabük'),
(18, 'Eskişehir'),
(19, 'Yozgat'),
(20, 'Muğla');

select*from iltbl;

insert into ilcetbl(ilceid, ilid, ilceadi)
values(1, 1,'Bağcılar'),
(2, 2, 'Keçiören'),
(3, 3, 'İnegöl'),
(4, 4, 'Merkez'),
(5, 5, 'Sapanca'),
(6, 6, 'Keşan'),
(7, 7, 'Manavgat'),
(8, 8, 'Akçadağ'),
(9, 9, 'Devrek'),
(10, 10, 'Altınoluk'),
(11, 11, 'Gölköy'),
(12, 12, 'Akşehir'),
(13, 13, 'Bozkurt'),
(14, 14, 'Ceyhan'),
(15, 15, 'Karşıyaka'),
(16, 16, 'Gerede'),
(17, 17, 'Eskipazar'),
(18, 18, 'İnönü'),
(19, 19, 'Aydıncık'),
(20, 20, 'Marmaris');

select*from ilcetbl;

insert into musteri(musteriid, ilid, ilceid, isim, soyisim, acikadres, tckimlik, tel, olusturmatarihi, guncellemetarihi)
values(1, 1, 1, 'Emirhan', 'Yılmaz', 'Sancaktepe mah. 948.sokak Özerkent Sitesi C Block Daire:25', '78965341201', '0545 825 81 89', sysdate(), sysdate()),
(2, 2, 2, 'Barış', 'Kandemir', 'Uğur Mumcu mah. 1179-1 sokak 184 Evler Sitesi 2-15', '75163490452', '0536 532 74 84', sysdate(), sysdate()),
(3, 3, 3, 'Sinan', 'Akkeçeli', 'Süleymaniye, Mimar Sinan Cd.', '78965341201', '0532 212 41 44', sysdate(), sysdate()),
(4, 4, 4, 'Taha', 'Aytan', 'Vali Aydın Aslan Cd. 30 G Kuzeykent', '56245176430', '0538 465 65 66', sysdate(), sysdate()),
(5, 5, 5, 'Fatih', 'Işılgan', 'Güldibi, Taşlık Sk. 1, 54600', '78965412311', '0542 128 80 85', sysdate(), sysdate()),
(6, 6, 6, 'Murat', 'Korkmaz', 'Büyük Cami, Ayşe Sk. 22800', '22256374953', '0536 895 50 55', sysdate(), sysdate()),
(7, 7, 7, 'Gökmen', 'Yalın', 'Sorgun, 8008. Sk. 12-16', '15638945320', '0530 740 55 90', sysdate(), sysdate()),
(8, 8, 8, 'Mehmet', 'Savar', 'Başpınar mah. Ufuk Sk. No:31', '645498573154', '0545 963 36 37', sysdate(), sysdate()),
(9, 9, 9,'Berkay', 'Yolcu', 'Yeni mah. Lale Sk. 9, 67830', '75695313501', '0535 423 60 80', sysdate(), sysdate()),
(10, 10, 10, 'Aybüke', 'Kazas', 'Altınoluk Mah. Bent Cd. 4. Sk. No:2, 10870', '86423951965', '0545 986 74 76', sysdate(), sysdate()),
(11, 11, 11, 'Mete', 'Daşkın', 'Gölköy İsmet Paşa Cd. 52600', '30221935895', '0505 980 20 25', sysdate(), sysdate()),
(12, 12, 12, 'Emin', 'Şakir', 'Yeni mah. Ali İhsan Sk., 42550', '62478345630', '0546 453 45 49', sysdate(), sysdate()),
(13, 13, 13, 'Atacan', 'Memiş', 'Arbaros Mah Nene Hatun Cd. No:8 20370', '74189043896', '0532 016 06 66', sysdate(), sysdate()),
(14, 14, 14, 'Burcu', 'Saygın', 'Hürriyet Mah. Altay Sk. No:11 01920', '12986540985', '0547 856 95 10', sysdate(), sysdate()),
(15, 15, 15, 'Başak', 'Sönmez', 'Atakent Mah. 6375. Sk. No:10 35590', '45973019637', '0536 268 83 80', sysdate(), sysdate()),
(16, 16, 16, 'Nisa', 'Öz', 'Seviller Mah Yarbay İbrahim Sk. No:22', '69256793456', '0542 330 03 33', sysdate(), sysdate()),
(17, 17, 17, 'Kaan', 'Öz', 'Yamanlar Mah Yıldız Sk. No:5 78400', '53186549783', '0538 563 20 02', sysdate(), sysdate()),
(18, 18, 18, 'Oğuzhan', 'Beyaz', 'Orta Mah Atatürk Cd. No:60 26670', '95346710562', '0536 450 99 89', sysdate(), sysdate()),
(19, 19, 19, 'Muhammed Fatih', 'Aktaş', 'Yeni Mah Çekerek Cd. 48-50 66510', '65314798657', '0546 892 15 16', sysdate(), sysdate()),
(20, 20, 20, 'Alpay', 'Toprak', 'Armutalan Mah 312. Sk. No:30 48700', '45316976420', '0532 645 35 35', sysdate(), sysdate());

select*from musteri;

SELECT iladi as İlAdı, ilceadi as İlçeAdı, isim as İsim, soyisim as Soyisim,
acikadres as Açıkadres, tckimlik as TCNo, tel as Telefon, olusturmatarihi, guncellemetarihi
FROM iltbl
INNER JOIN musteri ON iltbl.ilid = musteri.ilid
INNER JOIN ilcetbl ON ilcetbl.ilceid = musteri.ilceid;

insert into fatura(faturaid, musteriid, ilid, ilceid, urunid, uruntipid, tutar, olusturmatarihi)
values(1, 1, 1, 1, 1, 1, '3600 TL', sysdate()),
(2, 2, 2, 2, 2, 4, '780 TL', sysdate()),
(3, 3, 3, 3, 3, 3, '620 TL', sysdate()),
(4, 4, 4, 4, 4, 5, '1200 TL', sysdate()),
(5, 5, 5, 5, 5, 2, '5700 TL', sysdate()),
(6, 6, 6, 6, 6, 6, '3600 TL', sysdate()),
(7, 7, 7, 7, 7, 11, '870 TL', sysdate()),
(8, 8, 8, 8, 8, 15, '7800 TL', sysdate()),
(9, 9, 9, 9, 9, 7, '1150 TL', sysdate()),
(10, 10, 10, 10, 10, 8, '400 TL', sysdate()),
(11, 11, 11, 11, 11, 9, '570 TL', sysdate()),
(12, 12, 12, 12, 12, 12, '20 TL', sysdate()),
(13, 13, 13, 13, 13, 10, '1700 TL', sysdate()),
(14, 14, 14, 14, 14, 10, '2400 TL', sysdate()),
(15, 15, 15, 15, 15, 13, '3600 TL', sysdate()),
(16, 16, 16, 16, 16, 16, '1500 TL', sysdate()),
(17, 17, 17, 17, 17, 17, '2100 TL', sysdate()),
(18, 18, 18, 18, 18, 18, '160 TL', sysdate()),
(19, 19, 19, 19, 19, 19, '630 TL', sysdate()),
(20, 20, 20, 20, 20, 20, '3600 TL', sysdate());

select*from fatura;

SELECT faturaid as FaturaNo, musteri.isim as İsim, musteri.soyisim as Soyisim, 
iltbl.iladi as İlAdı, ilcetbl.ilceadi as İlçeAdı, musteri.tckimlik as TcKimlikNo, 
uruntipi.uruntipadi as ÜrünTipi, urunler.urunadi as ÜrünAdı, 
urunler.urunozellikleri as ÜrünÖzellikleri, tutar as Tutar, fatura.olusturmatarihi 
as FaturaOluşturmaTarihi
FROM fatura
INNER JOIN musteri ON musteri.musteriid = fatura.musteriid
INNER JOIN iltbl ON iltbl.ilid = fatura.ilid
INNER JOIN ilcetbl ON ilcetbl.ilceid = fatura.ilceid
INNER JOIN urunler ON urunler.urunid = fatura.urunid
INNER JOIN uruntipi ON uruntipi.uruntipid = fatura.uruntipid;

insert into siparis(siparisid, faturaid, siparisno)
values(1, 1, 10001),
(2, 2, 10002),
(3, 3, 10003),
(4, 4, 10004),
(5, 5, 10005),
(6, 6, 10006),
(7, 7, 10007),
(8, 8, 10008),
(9, 9, 10009),
(10, 10, 10010),
(11, 11, 10011),
(12, 12, 10012),
(13, 13, 10013),
(14, 14, 10014),
(15, 15, 10015),
(16, 16, 10016),
(17, 17, 10017),
(18, 18, 10018),
(19, 19, 10019),
(20, 20, 10020);

select*from siparis;

SELECT siparis.siparisno as SiparişNumarası, fatura.faturaid as FaturaNo, musteri.isim as İsim, musteri.soyisim as Soyisim, 
musteri.tel as Telefon, iltbl.iladi as İlAdı, ilcetbl.ilceadi as İlçeAdı, uruntipi.uruntipadi as ÜrünTipi, urunler.urunadi as ÜrünAdı, 
urunler.urunozellikleri as ÜrünÖzellikleri, tutar as Tutar, fatura.olusturmatarihi as FaturaOluşturmaTarihi
From siparis
INNER JOIN fatura ON siparis.faturaid = fatura.faturaid
INNER JOIN musteri ON musteri.musteriid = fatura.musteriid
INNER JOIN iltbl ON iltbl.ilid = fatura.ilid
INNER JOIN ilcetbl ON ilcetbl.ilceid = fatura.ilceid
INNER JOIN urunler ON urunler.urunid = fatura.urunid
INNER JOIN uruntipi ON uruntipi.uruntipid = fatura.uruntipid order by siparis.siparisno asc;