USE perpus;

-- soal 1

DELIMITER //
CREATE PROCEDURE getbuku (
IN kode VARCHAR(100),
IN judul VARCHAR(100), 
IN pgr VARCHAR(100), 
IN tahun VARCHAR(100), 
IN jml VARCHAR(100), 
IN sts VARCHAR(100), 
IN class VARCHAR(100))   
BEGIN
	SELECT * FROM buku WHERE 
	kode_buku = kode AND
	judul_buku = judul  AND
	pengarang_buku = pgr AND
	tahun_buku = tahun AND
	jumlah_buku = jml AND
	status_buku = sts AND
	klasifikasi_buku = class;
END//
DELIMITER ;

DROP PROCEDURE getbuku;

CALL getbuku('B001','Laskar Pelangi','Andrea Hirata','2005','10','Tersedia','Fiksi');

-- soal 2

DELIMITER //
CREATE PROCEDURE getpinjam (IN pj VARCHAR(100))   
BEGIN
	SELECT * FROM peminjaman WHERE kode_peminjaman = pj;
END//
DELIMITER ;

DROP PROCEDURE getpinjam;

CALL getpinjam('PJ001');

-- soal 3

DELIMITER //
CREATE PROCEDURE getAgt (
IN nama_agt VARCHAR(100), 
IN lahir VARCHAR(100))   
BEGIN
	SELECT * FROM anggota 
	WHERE nama_anggota = nama_agt AND
	tempat_lahir_anggota = lahir;
END //
DELIMITER ;

DROP PROCEDURE getAgt;

CALL getAgt('putra','jakarta');

-- soal 4

DELIMITER //
CREATE PROCEDURE getdata (
IN thn VARCHAR(100), 
IN class VARCHAR(100),
 IN stat VARCHAR(100))   
 BEGIN
	SELECT * FROM buku 
	WHERE tahun_buku = thn AND 
	klasifikasi_buku = class AND
	status_buku = stat;
END //
DELIMITER ;

DROP PROCEDURE getdata;

CALL getdata('2005','Fiksi','Tersedia');

-- soal 5

DELIMITER //
CREATE PROCEDURE tmbhPet (
IN id VARCHAR(200), 
IN usname VARCHAR(100), 
IN pw VARCHAR(10), 
IN nm VARCHAR(100))   
BEGIN
	INSERT INTO petugas
    VALUES (id, usname, pw, nm);
END //
DELIMITER ;

DROP PROCEDURE tmbhPet;

CALL tmbhpet('p011', 'un123', 'terserah', 'raib');

select * from petugas;

-- soal 6

DELIMITER //
CREATE PROCEDURE banyakAgt (OUT jumlahAnggota INT)   
BEGIN
	SELECT COUNT(*) INTO jumlahAnggota FROM anggota;
END // 
DELIMITER ;

DROP PROCEDURE banyakAgt;

CALL banyakAgt(@jumlahAnggota);
SELECT @jumlahAnggota AS'jumlah anggota';

-- soal 7

DELIMITER //
CREATE PROCEDURE jmlhBuku (
inOUT bykbuku INT, 
IN kode VARCHAR(100))   
BEGIN
	SELECT COUNT(kode_peminjaman) INTO bykbuku
	FROM peminjaman
	WHERE id_anggota = kode;
END// 
DELIMITER ;

DROP PROCEDURE jmlhBuku;


CALL jmlhBuku(@bykbuku,'A001');
SELECT @bykbuku AS 'banyak peminjaman';


