BEGIN
   FOR cur_rec IN (SELECT object_name, object_type
                     FROM user_objects
                    WHERE object_type IN
                             ('TABLE',
                              'VIEW',
                              'PACKAGE',
                              'PROCEDURE',
                              'FUNCTION',
                              'SEQUENCE',
                              'SYNONYM',
                              'PACKAGE BODY'
                             ))
   LOOP
      BEGIN
         IF cur_rec.object_type = 'TABLE'
         THEN
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '" CASCADE CONSTRAINTS';
         ELSE
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '"';
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            DBMS_OUTPUT.put_line (   'FAILED: DROP '
                                  || cur_rec.object_type
                                  || ' "'
                                  || cur_rec.object_name
                                  || '"'
                                  
                                 );
      END;
   END LOOP;
END;
/

CREATE TABLE Asisten
    (
        Kode_Asprak CHAR(10) PRIMARY KEY,
        Nama_Asprak VARCHAR2(30)
       
    ) ;

CREATE TABLE Matakuliah
    (
        id_Matakuliah CHAR(10) PRIMARY KEY,
        Nama_Matkul VARCHAR2(50)
    ) ;

CREATE TABLE BeritaAcara
    (
        id_BAP CHAR(10) PRIMARY KEY,
        informasi_Praktikum VARCHAR2(1500),
        Banyak_Asprak_Jaga NUMBER,
        Kode_Asprak CHAR(10) REFERENCES Asisten (Kode_Asprak)
    ) ;

CREATE TABLE Kelas
    (
        no_kelas  CHAR(6) PRIMARY KEY,
        Jumlah_Mahasiswa NUMBER,
        Mata_kuliah VARCHAR2(50),
        Dosen VARCHAR2(10),
        id_Matakuliah CHAR(10) REFERENCES Matakuliah (id_Matakuliah)
    );
CREATE TABLE Mahasiswa 
    (
        NIM CHAR(10) PRIMARY KEY,
        Nama_Mahasiwa VARCHAR2(30),
        Nilai_praktikum NUMBER,
        no_kelas CHAR(6) REFERENCES Kelas (no_kelas)
        
    );
    
CREATE TABLE Jadwal_Praktikum
    (
        id_jadwal CHAR(5) PRIMARY KEY,
        hari_praktikum VARCHAR2(7),
        shift_praktikum VARCHAR2(5),
        No_Ruangan CHAR(6),
        no_kelas CHAR(6) REFERENCES Kelas (no_kelas) 
    
    );

CREATE TABLE Modul
    (
        NoUrut_Modul CHAR(10) PRIMARY KEY,
        Judul_BAB VARCHAR2(20),
        id_Matakuliah CHAR(10) REFERENCES Matakuliah (id_matakuliah),
        Kode_Asprak CHAR(10)   REFERENCES Asisten (Kode_Asprak) 
        
    );

CREATE TABLE PRAKTIKUM
    (
        id_Praktikum CHAR(10) PRIMARY KEY,
        Banyak_Asisten VARCHAR2(5),
        no_kelas CHAR(6) REFERENCES Kelas (no_kelas),
        id_Matakuliah CHAR(10) REFERENCES Matakuliah (id_matakuliah)
    );
    
ALTER SESSION SET nls_date_format = 'dd-MM-yyyy';

INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA001', 'Budi Santoso');
INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA002', 'Caca Kartika');
INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA003', 'Ayla yaya');
INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA004', 'Erliansyah');
INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA005', 'Arian sutono');
INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA006', 'Zahirah');
INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA007', 'Risa');
INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA008', 'Bunga');
INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA009', 'Juan Vitto');
INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA010', 'Bianca');
INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA011', 'Vivi');
INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA012', 'Rizwan');
INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA013', 'Rihma');
INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA014', 'Mizwar');
INSERT INTO Asisten (Kode_Asprak,Nama_Asprak) VALUES ('AA015', 'Azam');

INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('DAPIT1','Dasar Algoritma Pemrograman');
INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('DAPIF2','Dasar Algoritma Pemrograman');
INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('DAPRL3','Dasar Algoritma Pemrograman');
INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('STDIT1','Struktur Data');
INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('STDIF2','Struktur Data');
INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('STDRL3','Struktur Data');
INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('PBSIT1','Pemodelan dan Implementasi BasDat');
INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('PBSIF2','Pemodelan dan Implementasi BasDat');
INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('PBSRL3','Pemodelan dan Implementasi BasDat');
INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('BSLIT1','Basis Data Lanjut');
INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('BSLIF2','Basis Data Lanjut');
INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('BSLRL3','Basis Data Lanjut');
INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('JRKIT1','Jaringan Komputer');
INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('JRKIF2','Jaringan Komputer');
INSERT INTO Matakuliah (id_Matakuliah,Nama_Matkul) VALUES ('JRKRL3','Jaringan Komputer');

INSERT INTO BeritaAcara  VALUES ('BAP01', 'STD IT4302 Modul01 Jam 08.00 Tanggal 04-06-2020 IFLAB1 Hari Kamis Bima Sakti ', 02, 'AA015');
INSERT INTO BeritaAcara  VALUES ('BAP02', 'DAP IT4301 Modul03 Jam 10.00 Tanggal 12-06-2020 IFLAB2 Hari Jumat Fatmawati ', 05, 'AA001');
INSERT INTO BeritaAcara  VALUES ('BAP03', 'PBD IT4303 Modul05 Jam 08.00 Tanggal 16-06-2020 IFLAB3 Hari Selasa Yaya ', 04, 'AA006');
INSERT INTO BeritaAcara  VALUES ('BAP04', 'DAP IF4301 Modul03 Jam 08.00 Tanggal 15-06-2020 IFLAB1 Hari Senin Laras ', 04, 'AA002');
INSERT INTO BeritaAcara  VALUES ('BAP05', 'STD IF4302 Modul04 Jam 10.00 Tanggal 17-06-2020 IFLAB2 Hari Rabu Bagus ', 03, 'AA003');
INSERT INTO BeritaAcara  VALUES ('BAP06', 'PBD IF4303 Modul02 Jam 13.00 Tanggal 08-06-2020 IFLAB3 Hari Senin Sukma ', 05, 'AA004');
INSERT INTO BeritaAcara  VALUES ('BAP07', 'BSL IF4304 Modul04 Jam 10.00 Tanggal 25-06-2020 IFLAB1 Hari Kamis Bidu ', 04, 'AA007');
INSERT INTO BeritaAcara  VALUES ('BAP08', 'BSL IF4305 Modul03 Jam 13.00 Tanggal 09-06-2020 IFLAB2 Hari Selasa Bidu ', 05, 'AA005');
INSERT INTO BeritaAcara  VALUES ('BAP09', 'PBD IF4306 Modul02 Jam 08.00 Tanggal 15-06-2020 IFLAB3 Hari Senin Sukma ', 03, 'AA008');
INSERT INTO BeritaAcara  VALUES ('BAP10', 'JRK IF4307 Modul01 Jam 13.00 Tanggal 04-06-2020 IFLAB1 Hari Kamis Maya ', 04, 'AA009');
INSERT INTO BeritaAcara  VALUES ('BAP11', 'STD IF4308 Modul04 Jam 13.00 Tanggal 17-06-2020 IFLAB2 Hari Rabu Bagus ', 05, 'AA010');
INSERT INTO BeritaAcara  VALUES ('BAP12', 'DAP IF4309 Modul03 Jam 10.00 Tanggal 16-06-2020 IFLAB3 Hari Senin Laras ', 03, 'AA011');
INSERT INTO BeritaAcara  VALUES ('BAP13', 'DAP RL4301 Modul01 Jam 08.00 Tanggal 02-06-2020 IFLAB1 Hari Jumat Rizwan ', 05, 'AA012');
INSERT INTO BeritaAcara  VALUES ('BAP14', 'JRK RL4302 Modul02 Jam 08.00 Tanggal 02-06-2020 IFLAB2 Hari Jumat Bekti ', 04, 'AA013');
INSERT INTO BeritaAcara  VALUES ('BAP15', 'STD RL4303 Modul03 Jam 10.00 Tanggal 03-06-2020 IFLAB3 Hari Rabu Rizwan ', 05, 'AA012');


INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('IT4301', 'DAPIT1', 25, 'DAP','Fatmawati');
INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('IT4302', 'STDIT1', 15, 'STD', 'Bima Sakti');
INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('IT4303', 'PBSIT1', 21 , 'PBD', 'Yaya');
INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('IF4301', 'DAPIF2', 24 , 'DAP', 'Laras');
INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('IF4302', 'STDIF2', 17 , 'STD', 'Bagus');
INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('IF4303', 'PBSIF2', 30 , 'PBD', 'Sukma'); 
INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('IF4304', 'BSLIF2', 30 , 'BSL', 'Bidu');
INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('IF4305', 'BSLIF2', 21 , 'BSL', 'Bidu');
INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('IF4306', 'PBSIF2', 16 , 'PBD', 'Sukma');
INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('IF4307', 'JRKIF2', 18 , 'JRK', 'Maya');
INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('IF4308', 'STDIF2', 28 , 'STD', 'Bagus');
INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('IF4309', 'DAPIF2', 26 , 'DAP', 'Laras');
INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('RL4301', 'DAPRL3', 30 , 'DAP', 'Rizwan');
INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('RL4302', 'JRKRL3', 25 , 'JRK', 'Bekti');
INSERT INTO Kelas (no_kelas,id_Matakuliah,Jumlah_Mahasiswa, Mata_kuliah,Dosen) VALUES ('RL4303', 'STDRL3', 30 , 'STD', 'Bagus');


INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1303190038', 'Salsabilla', 80, 'IT4302');
INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1303190010', 'Salma', 85, 'IT4301');
INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1303193017', 'Tiara', 80, 'IT4303');
INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1303198888', 'Tafida', 100, 'IF4301');
INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1303190000', 'Abnaz', 97, 'IF4302');
INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1303192222', 'Anandita', 95, 'IF4303');
INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1301391111', 'Haerus', 65, 'IF4304');
INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1303193333', 'Syakirah', 50, 'IF4305');
INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1303194444', 'Ramadhani',50, 'IF4306');
INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1303195555', 'Bydu', 65, 'IF4307');
INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1303196666', 'Taufiq', 70, 'IF4308');
INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1303197777', 'Doni', 45, 'IF4309');
INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1303190018', 'Tati', 83, 'RL4301');
INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1303193011', 'Rahmi', 60, 'RL4302');
INSERT INTO Mahasiswa (NIM, Nama_Mahasiwa,Nilai_praktikum,no_kelas) VALUES ('1303192015', 'Rusli', 48, 'RL4303');

INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL01', 'SENIN', '02', 'IFLAB1','IT4301');
INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL02', 'SENIN', '01', 'IFLAB2','IT4302');
INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL03', 'SENIN', '03', 'IFLAB3','IT4303');
INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL04', 'SELASA','02', 'IFLAB1','IF4301');
INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL05', 'SELASA', '01', 'IFLAB2','IF4302');
INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL06', 'SELASA', '03', 'IFLAB3','IF4303');
INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL07', 'RABU', '02', 'IFLAB1','IF4304');
INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL08', 'RABU', '01', 'IFLAB2','IF4305');
INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL09', 'RABU', '03', 'IFLAB3','IF4306');
INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL10', 'KAMIS', '02', 'IFLAB1','IF4307');
INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL11', 'KAMIS', '01', 'IFLAB2','IF4308');
INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL12', 'KAMIS', '03', 'IFLAB3','IF4309');
INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL13', 'JUMAT', '02', 'IFLAB1','RL4301');
INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL14', 'JUMAT', '01', 'IFLAB2','RL4302');
INSERT INTO Jadwal_Praktikum (id_jadwal,hari_praktikum,shift_praktikum,No_Ruangan,no_kelas) VALUES ('JDL15', 'JUMAT', '03', 'IFLAB3','RL4303');

INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('01PIT' ,'Draw.io','PBSIT1', 'AA001');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('02SIF' ,'Stack','STDIF2', 'AA002');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('04SRL' ,'Queue','STDRL3', 'AA002');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('01DIT' ,'Looping','DAPIT1', 'AA003');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('05PIF' ,'Subquery','PBSIF2', 'AA009');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('03PRL' ,'JOIN','PBSRL3', 'AA004');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('03BIF' ,'DATABASE','BSLIF2', 'AA008');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('02BIT' ,'Relational','BSLIT1', 'AA005');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('01JIT' ,'Topologi','JRKIT1', 'AA006');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('04JIF' ,'Routing','JRKIF2', 'AA003');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('03DIF' ,'Array','DAPIF2', 'AA007');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('03DRL' ,'Array','DAPRL3', 'AA005');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('04SIT' ,'Graph','STDIT1', 'AA001');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('03BRL' ,'DATABASE','BSLRL3', 'AA003');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('02JRL' ,'Microtic','JRKRL3', 'AA005');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('02PIT' ,'Having','PBSIT1', 'AA001');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('03SIF' ,'Linkedlist','STDIF2', 'AA002');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('05SRL' ,'Tree','STDRL3', 'AA002');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('02DIT' ,'Ascending','DAPIT1', 'AA003');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('04PIF' ,'Aggregate','PBSIF2', 'AA009');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('05PRL' ,'Querry','PBSRL3', 'AA004');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('05BIF' ,'Data mining','BSLIF2', 'AA008');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('04BIT' ,'Olap','BSLIT1', 'AA005');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('05JIT' ,'Transmisi','JRKIT1', 'AA006');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('05JIF' ,'Transmisi','JRKIF2', 'AA003');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('02DIF' ,'Descending','DAPIF2', 'AA007');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('01DRL' ,'Golang','DAPRL3', 'AA005');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('01SIT' ,'C++','STDIT1', 'AA001');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('04BRL' ,'Olap','BSLRL3', 'AA003');
INSERT INTO  Modul (NoUrut_Modul,Judul_BAB,id_Matakuliah,Kode_Asprak) VALUES ('05JRL' ,'Transmisi','JRKRL3', 'AA005');


INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK01',05,'IT4302','DAPIT1');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK02',03,'IT4301','STDIT1' );
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK03',02,'IT4303', 'BSLIT1');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK04',06,'IT4301', 'PBSIT1');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK05',08,'IT4302', 'JRKIT1');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK06',02,'IF4302','DAPIF2');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK07',01,'IF4301','STDIF2' );
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK08',03,'IF4303', 'BSLIF2');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK09',05,'IF4301', 'PBSIF2');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK10',04,'IF4302', 'JRKIF2');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK11',07,'RL4302','DAPRL3');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK12',06,'RL4301','STDRL3' );
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK13',02,'RL4303', 'BSLRL3');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK14',01,'RL4301', 'PBSRL3');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK15',05,'RL4302', 'JRKRL3');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK16',03,'IT4302','DAPIT1');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK17',05,'IT4301','STDIT1' );
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK18',07,'IT4303', 'BSLIT1');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK19',08,'IT4301', 'PBSIT1');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK20',04,'IT4302', 'JRKIT1');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK21',04,'IF4302','DAPIF2');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK22',05,'IF4301','STDIF2' );
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK23',02,'IF4303', 'BSLIF2');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK24',01,'IF4301', 'PBSIF2');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK25',06,'IF4302', 'JRKIF2');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK26',03,'RL4302','DAPRL3');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK27',01,'RL4301','STDRL3' );
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK28',04,'RL4303', 'BSLRL3');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK29',05,'RL4301', 'PBSRL3');
INSERT INTO PRAKTIKUM (id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah) VALUES ('PRK30',01,'RL4302', 'JRKRL3');

Select * from Mahasiswa;

select NoUrut_Modul, Judul_BAB, id_Matakuliah, Kode_Asprak from Modul
join Asisten using (Kode_Asprak)
join Matakuliah using (id_Matakuliah)
where (Kode_Asprak = 'AA001');

select id_jadwal, hari_praktikum, shift_praktikum, No_Ruangan, no_kelas, count(shift_praktikum) as jumlah 
FROM Jadwal_Praktikum
JOIN Kelas using (no_kelas)
where (shift_praktikum = '03')
group by id_jadwal, hari_praktikum, shift_praktikum, No_ruangan, no_kelas
having count(shift_praktikum) < 2;

select id_BAP, informasi_praktikum, kode_asprak from BeritaAcara
join Asisten using (Kode_Asprak)
where Kode_Asprak = 'AA001';

select id_BAP, informasi_praktikum, kode_asprak from BeritaAcara
join Asisten using (Kode_Asprak)
where Nama_Asprak = 'Budi Santoso';

select id_jadwal, hari_praktikum, shift_praktikum, No_Ruangan, no_kelas from jadwal_praktikum
join kelas using (no_kelas);

select id_jadwal, hari_praktikum, shift_praktikum, No_Ruangan, no_kelas from jadwal_praktikum
join kelas using (no_kelas);

select id_jadwal, hari_praktikum, shift_praktikum, No_Ruangan, no_kelas, count(shift_praktikum) as jumlah 
FROM Jadwal_Praktikum
JOIN Kelas using (no_kelas)
where (shift_praktikum = '03')
group by id_jadwal, hari_praktikum, shift_praktikum, No_ruangan, no_kelas
having count(shift_praktikum) <= 3;


select id_jadwal, hari_praktikum, shift_praktikum, No_Ruangan, no_kelas, count(shift_praktikum) as jumlah 
FROM Jadwal_Praktikum
JOIN Kelas using (no_kelas)
where (shift_praktikum = '02')
group by id_jadwal, hari_praktikum, shift_praktikum, No_ruangan, no_kelas
having count(shift_praktikum) <= 3; 


select id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah, count(Banyak_Asisten) as jumlah 
FROM PRAKTIKUM
JOIN Kelas using (no_kelas)
join Matakuliah using(id_Matakuliah)
where (Banyak_Asisten = '03')
group by id_Praktikum, Banyak_Asisten,no_kelas, id_Matakuliah,
having count(Banyak_Asisten) >= 2;

no2 

select id_jadwal, hari_praktikum, shift_praktikum, No_Ruangan, no_kelas, count(shift_praktikum) as jumlah 
FROM Jadwal_Praktikum
JOIN Kelas using (no_kelas)
where (shift_praktikum = '02' or shift_praktikum = '01' or shift_praktikum = '03')
group by id_jadwal, hari_praktikum, shift_praktikum, No_ruangan, no_kelas;



