CREATE DATABASE perpus;
USE perpus;
DROP DATABASE perpus;

CREATE TABLE anggota (
id_anggota VARCHAR(10) NOT NULL PRIMARY KEY,
nama_anggota VARCHAR(20) NOT NULL, 
angkatan_anggota VARCHAR(6) NOT NULL,
tempat_lahir_anggota VARCHAR(20) NOT NULL,
tanggal_lahir_anggota DATE,
no_telp INT(12) NOT NULL,
jenis_kelamin VARCHAR(15) NOT NULL,
status_pinjam VARCHAR(15) NOT NULL  
);


CREATE TABLE petugas (
id_petugas VARCHAR(10) NOT NULL PRIMARY KEY,
username VARCHAR(15) NOT NULL,
PASSWORD VARCHAR(15) NOT NULL,
nama VARCHAR(25) NOT NULL
);

CREATE TABLE  buku (
kode_buku VARCHAR(10) NOT NULL PRIMARY KEY ,
judul_buku VARCHAR(25) NOT NULL,
pengarang_buku VARCHAR(30) NOT NULL,
tahun_buku VARCHAR(10) NOT NULL,
jumlah_buku VARCHAR(5) NOT NULL,
status_buku VARCHAR (10) NOT NULL,
klasifikasi_buku VARCHAR (20) NOT NULL
);

CREATE TABLE peminjaman (
kode_peminjaman VARCHAR (10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR (10) NOT NULL,
id_petugas VARCHAR (10) NOT NULL,
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku VARCHAR (10) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
FOREIGN KEY (kode_buku) REFERENCES buku (kode_buku)
);

DROP TABLE peminjaman;

CREATE TABLE pengembalian (
kode_kembali VARCHAR (10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR (10) NOT NULL,
kode_buku VARCHAR (10) NOT NULL,
id_petugas VARCHAR (10) NOT NULL,
tgl_pinjam DATE,
tgl_kembali DATE,
denda VARCHAR (15) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

DROP TABLE pengembalian;

SHOW TABLES;


INSERT INTO anggota VALUES 
('A001', 'Putra', '2019', 'Jakarta', '1998-05-10', 2147483647, 'Laki-laki', 'meminjam'),
('A002', 'Sari', '2020', 'Bandung', '1997-08-15', 2147483647, 'Perempuan', 'meminjam'),
('A003', 'Rudi', '2018', 'Surabaya', '1996-12-20', 2147483647, 'Laki-laki', 'mengembalikan'),
('A004', 'Dewi', '2021', 'Yogyakarta', '1999-03-25', 2147483647, 'Perempuan', 'meminjam'),
('A005', 'Budi', '2017', 'Medan', '1995-06-30', 2147483647, 'Laki-laki', 'meminjam'),
('A006', 'Sinta', '2016', 'Semarang', '1994-09-05', 2147483647, 'Perempuan', 'mengembalikan'),
('A007', 'Hadi', '2022', 'Malang', '2000-11-15', 2147483647, 'Laki-laki', 'meminjam'),
('A008', 'Eka', '2015', 'Denpasar', '1993-02-20', 2147483647, 'Perempuan', 'mengembalikan'),
('A009', 'Rina', '2014', 'Makassar', '1992-04-25', 2147483647, 'Perempuan', 'meminjam'),
('A010', 'Fajar', '2023', 'Palembang', '2001-07-30', 2147483647, 'Laki-laki', 'mengembalikan');
SELECT * FROM anggota;

INSERT INTO anggota VALUES ('A008', 'Udin', '2015', 'Denpasar', '1993-02-20', 2147483647, 'Laki-laki', 'meminjam');

INSERT INTO petugas VALUES 
('P001', 'john123', 'putra123', 'Putra'),
('P002', 'jane456', 'sari456', 'Sari'),
('P003', 'alice789', 'rudi789', 'Rudi'),
('P004', 'bob321', 'dewi321', 'Dewi'),
('P005', 'emma567', 'budi567', 'Budi'),
('P006', 'alex890', 'sinta890', 'Sinta'),
('P007', 'sara234', 'hadi234', 'Hadi'),
('P008', 'mike123', 'eka123', 'Eka'),
('P009', 'linda456', 'rina456', 'Rina'),
('P010', 'ryan789', 'fajar789', 'Fajar');
SELECT * FROM petugas;

INSERT INTO buku VALUES 
('B001', 'Laskar Pelangi', 'Andrea Hirata', '2005', '', 'Tersedia', 'Fiksi'),
('B002', 'Ayat-ayat Cinta', 'Habiburrahman El Shirazy', '2004', '12', 'Tersedia', 'Romantis'),
('B003', 'Perahu Kertas', 'Dee Lestari', '2009', '15', 'Tersedia', 'Fiksi'),
('B004', 'Ronggeng Dukuh Paruk', 'Ahmad Tohari', '1982', '8', 'Tersedia', 'Sastra'),
('B005', 'Tenggelamnya Kapal Van De', 'Hamka', '1939', '14', 'Tersedia', 'Sejarah'),
('B006', 'Cinta di Dalam Gelas', 'Andrea Hirata', '2007', '9', 'Tersedia', 'Romantis'),
('B007', 'Pulang', 'Tere Liye', '2015', '13', 'Tersedia', 'Fiksi'),
('B008', 'Madre', 'Dee Lestari', '2011', '11', 'Tersedia', 'Fiksi'),
('B009', 'Pergi', 'Tere Liye', '2014', '7', 'Tersedia', 'Romantis'),
('B010', 'Sepotong Hati yang Baru', 'Tere Liye', '2017', '10', 'Tersedia', 'Fiksi');
SELECT * FROM buku;

INSERT INTO peminjaman VALUES 
('PJ001', 'A005', 'P004', '2024-04-01', '2024-04-08', 'B005'),
('PJ002', 'A008', 'P006', '2024-04-02', '2024-04-09', 'B009'),
('PJ003', 'A002', 'P001', '2024-04-03', '2024-04-10', 'B007'),
('PJ004', 'A007', 'P005', '2024-04-04', '2024-04-11', 'B002'),
('PJ005', 'A005', 'P010', '2024-04-05', '2024-04-12', 'B003'),
('PJ006', 'A001', 'P004', '2024-04-06', '2024-04-13', 'B005'),
('PJ007', 'A006', 'P008', '2024-04-07', '2024-04-14', 'B010'),
('PJ008', 'A004', 'P002', '2024-04-08', '2024-04-15', 'B008'),
('PJ009', 'A010', 'P009', '2024-04-09', '2024-04-16', 'B001'),
('PJ010', 'A003', 'P007', '2024-04-10', '2024-04-17', 'B004'),
('PJ011', 'A006', 'P002', '2024-04-11', '2024-04-18', 'B008'),
('PJ012', 'A003', 'P009', '2024-04-12', '2024-04-19', 'B010'),
('PJ013', 'A005', 'P006', '2024-04-13', '2024-04-20', 'B001'),
('PJ014', 'A001', 'P010', '2024-04-14', '2024-04-21', 'B007'),
('PJ015', 'A005', 'P004', '2024-04-15', '2024-04-22', 'B002'),
('PJ016', 'A010', 'P003', '2024-04-16', '2024-04-23', 'B009'),
('PJ017', 'A007', 'P008', '2024-04-17', '2024-04-24', 'B006'),
('PJ018', 'A005', 'P001', '2024-04-18', '2024-04-25', 'B003'),
('PJ019', 'A005', 'P005', '2024-04-19', '2024-04-26', 'B004'),
('PJ020', 'A009', 'P007', '2024-04-20', '2024-04-27', 'B005');
SELECT * FROM peminjaman; 
`peminjaman`
INSERT INTO pengembalian VALUES 
('PK001', 'A001', 'B005', 'P004', '2024-04-06', '2024-04-13', '0'),
('PK002', 'A007', 'B006', 'P008', '2024-04-17', '2024-04-24', '0'),
('PK003', 'A009', 'B005', 'P007', '2024-04-20', '2024-04-27', '0'),
('PK004', 'A004', 'B008', 'P002', '2024-04-08', '2024-04-19', '8000'),
('PK005', 'A006', 'B010', 'P008', '2024-04-07', '2024-04-17', '6000');

-- soal 1

CREATE VIEW keaktifan AS 
SELECT nama_anggota, COUNT(kode_buku) AS tanggungan_buku 
FROM anggota a JOIN peminjaman b ON a.id_anggota = b.id_anggota 
GROUP BY nama_anggota
HAVING tanggungan_buku > 5 ;

DROP VIEW keaktifan;
SELECT * FROM keaktifan;

-- SOAL 2

CREATE VIEW pelayanan AS 
SELECT nama, COUNT(kode_peminjaman) AS transaksi, COUNT(b.kode_buku) AS jumlah_buku 
FROM petugas a JOIN peminjaman b ON a.id_petugas = b.id_petugas 
GROUP BY nama ;

SELECT * FROM pelayanan;
DROP VIEW pelayanan;

-- soal 3

CREATE VIEW petugas_teladan AS 
SELECT nama , transaksi FROM pelayanan
ORDER BY transaksi DESC 
LIMIT 1 ;

SELECT * FROM petugas_teladan;
DROP VIEW petugas_teladan;

-- soal 4

create VIEW buku_favorit AS 
SELECT judul_buku,count(b.kode_peminjaman) AS banyak_pinjaman 
FROM buku a 
join peminjaman b on a.kode_buku = b.kode_buku
GROUP BY judul_buku 
ORDER BY banyak_pinjaman DESC;

DROP VIEW buku_favorit;
SELECT * FROM buku_favorit;


