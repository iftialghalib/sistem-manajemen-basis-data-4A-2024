USE perpus;


-- soal 1

DELIMITER //
CREATE PROCEDURE biodataMhs(
	IN nim INT(20),
	IN nama VARCHAR(100),
	IN alamat VARCHAR(50),
	IN nomor INT (12),
	IN gender VARCHAR(1),
	IN hobi VARCHAR(50),
	IN ttl DATE
)
BEGIN 
	DECLARE vNim INT(20);
	DECLARE vNama VARCHAR(100);
	DECLARE vAlamat VARCHAR(50);
	DECLARE vnomor INT (12);
	DECLARE vGender VARCHAR(1);
	DECLARE vHobi VARCHAR(50);
	DECLARE vTtl DATE;
	DECLARE vUmur INT (3);
	
	SET vNim = nim;
	SET vNama = nama;
	SET vAlamat = alamat;
	SET vnomor = nomor;
	SET vGender = gender;
	SET vHobi = hobi;
	SET vTtl = ttl;
	SET vUmur = TIMESTAMPDIFF(YEAR,vTtl,CURDATE());
	
	SELECT vNim AS NIM,
	vNama AS NamaMhs,
	vAlamat AS Alamat,
	vnomor AS Nomor,
	vGender AS Gender,
	vHobi AS Hobi,
	vTtl AS TTL,
	vUmur AS Umur;
END //
DELIMITER ;

DROP PROCEDURE biodataMhs;

CALL biodataMhs(001,'udin','jakarta',085000,'L','mancing','2003-03-03');

-- soal 2

DELIMITER//
CREATE PROCEDURE waktupinjam(
	IN kode VARCHAR (10) 
)
BEGIN
	DECLARE keterangan VARCHAR(100);
	DECLARE selisih INT;
	DECLARE tanggal DATE;
	
	SELECT tanggal_pinjam INTO tanggal FROM peminjaman WHERE kode_peminjaman = kode;
	
	SET selisih = DATEDIFF( CURDATE(), tanggal);
	
	CASE
		WHEN selisih <= 2 THEN SET keterangan ='Silahkan pergunakan buku dengan baik';
		WHEN selisih >= 3 AND selisih <6 THEN SET keterangan = 'Ingat!,Waktu anda segera habis';
		WHEN selisih >= 6 THEN SET keterangan = 'warning!!!, denda menanti anda';
	END CASE;
	
	SELECT keterangan;

END//
DELIMITER;

DROP PROCEDURE waktupinjam;

CALL waktupinjam('PJ001');


-- coba soal 3

DELIMITER//
CREATE PROCEDURE Pengingat(
	IN tanggalPinjam DATE
)
BEGIN
	DECLARE keterangan VARCHAR (100);
	DECLARE selisih INT;
	
	SET selisih = DATEDIFF(CURDATE(), tanggalPinjam);
	IF selisih <1 AND selisih >7 THEN SET keterangan = 'anda tidak memiliki tanggungan';
	ELSE
		SET keterangan = (selisih - 7) * 2000;
    END IF;
    
    
    SELECT keterangan AS 'denda anda';
END//
DELIMITER//

CALL Pengingat('2024-04-25');

-- soal 3

DELIMITER //

CREATE PROCEDURE tanggungan(
IN kode VARCHAR(10)
)
BEGIN
    DECLARE tanggungan VARCHAR(100);
    DECLARE keterangan VARCHAR(100);

    SELECT denda INTO tanggungan
    FROM pengembalian
    WHERE id_anggota = kode;

    IF (tanggungan != '0') THEN
        
        SELECT *
        
        FROM pengembalian
        
        WHERE id_anggota = kode;
      
    ELSE
    
    SET keterangan = 'anggota tidak memiliki tanggungan';
        
        
    END IF;
    
    SELECT keterangan AS 'detail';
    
END //
DELIMITER ;

DROP PROCEDURE tanggungan;

CALL tanggungan('A008');

-- soal 4

DELIMITER //

CREATE PROCEDURE daftarpinjam(
IN jmlhData INT
)
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE vkode_peminjaman VARCHAR (10);
	DECLARE vid_anggota VARCHAR (10);
	DECLARE vid_petugas VARCHAR (10);
	DECLARE vtanggal_pinjam DATE;
	DECLARE vtanggal_kembali DATE;
	DECLARE vkode_buku VARCHAR (10);
    
     CREATE TEMPORARY TABLE IF NOT EXISTS dataSementara ( 
	kode_peminjaman VARCHAR (10) PRIMARY KEY NOT NULL,
	id_anggota VARCHAR (10),
	id_petugas VARCHAR (10),
	tanggal_pinjam DATE,
	tanggal_kembali DATE,
	kode_buku VARCHAR (10) 
	);

    WHILE i <= jmlhData DO
           SELECT
            *
	    INTO 
	     vkode_peminjaman, vid_anggota, vid_petugas, vtanggal_pinjam, vtanggal_kembali, vkode_buku
        FROM peminjaman
        WHERE kode_peminjaman = CONCAT('PJ', LPAD(i, 3, '0'));
        
        INSERT INTO dataSementara 
        VALUES (
        vkode_peminjaman, vid_anggota, vid_petugas, vtanggal_pinjam, vtanggal_kembali, vkode_buku);
        
        SET i = i + 1;
       
        
    END WHILE;
    
    SELECT * FROM dataSementara;
    
    DROP TEMPORARY TABLE IF EXISTS dataSementara;
END//

DELIMITER;

DROP PROCEDURE daftarpinjam;

CALL daftarpinjam(10);

-- soal 5

DELIMITER //

CREATE PROCEDURE hapusData(
IN kode VARCHAR (10))

BEGIN 

	DECLARE keterangan VARCHAR (100);

	DECLARE cek INT;
	
	DECLARE jenis VARCHAR (20);

	SELECT COUNT(*),jenis_kelamin INTO cek,jenis FROM peminjaman a 
	JOIN anggota b ON a.id_anggota = b.id_anggota 
	WHERE a.id_anggota = kode ;
	
	

	IF (jenis = 'Perempuan') THEN
	
		SET keterangan = CONCAT('data anggota dengan id ', kode, ' adalah perempuan'); 

	ELSEIF(cek = 0) THEN
	
		DELETE FROM anggota WHERE id_anggota = kode;

		SET keterangan = CONCAT('data anggota dengan id ', kode, ' berhasil dihapus');

	ELSE
		SET keterangan = CONCAT('data anggota dengan id ', kode, ' masih memiliki tanggungan');

	END IF;
	
	SELECT keterangan;

END //
DELIMITER;

DROP PROCEDURE hapusData;

CALL hapusData('A008');

INSERT INTO anggota VALUES 
('A008', 'Udin', '2015', 'Denpasar', '1993-02-20', 2147483647, 'Laki-laki', 'meminjam');
 