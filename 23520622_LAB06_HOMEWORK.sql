CREATE DATABASE QUANLICHUYENGIA 
CREATE TABLE ChuyenGia (
    MaChuyenGia INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    Email NVARCHAR(100),
    SoDienThoai NVARCHAR(20),
    ChuyenNganh NVARCHAR(50),
	NgayCapNhat DATETIME,
	TrangThai VARCHAR(50), 
	SoDuAnDangThucHien INT, 
	Luong INT, 
    NamKinhNghiem INT
);

-- Tạo bảng Công ty
CREATE TABLE CongTy (
    MaCongTy INT PRIMARY KEY,
    TenCongTy NVARCHAR(100),
    DiaChi NVARCHAR(200),
    LinhVuc NVARCHAR(50),
	ThuHang NVARCHAR(50), 
	SoChuyenGiaCapCao INT,
	TyLeThanhCong FLOAT,
	DiemTrungBinh FLOAT, 
	SoDuAnDangThucHien INT, 
    SoNhanVien INT
);

-- Tạo bảng Dự án
CREATE TABLE DuAn (
    MaDuAn INT PRIMARY KEY,
    TenDuAn NVARCHAR(200),
    MaCongTy INT,
    NgayBatDau DATE,
    NgayKetThuc DATE,
	DiemDanhGia INT,
    TrangThai NVARCHAR(50),
	YeuCauBoSung NVARCHAR(20),
    FOREIGN KEY (MaCongTy) REFERENCES CongTy(MaCongTy)
);

-- Tạo bảng Kỹ năng
CREATE TABLE KyNang (
    MaKyNang INT PRIMARY KEY,
    TenKyNang NVARCHAR(100),
    LoaiKyNang NVARCHAR(50)
);

-- Tạo bảng Chuyên gia - Kỹ năng
CREATE TABLE ChuyenGia_KyNang (
    MaChuyenGia INT,
    MaKyNang INT,
    CapDo INT,
    PRIMARY KEY (MaChuyenGia, MaKyNang),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaKyNang) REFERENCES KyNang(MaKyNang)
);

-- Tạo bảng Chuyên gia - Dự án
CREATE TABLE ChuyenGia_DuAn (
    MaChuyenGia INT,
    MaDuAn INT,
    VaiTro NVARCHAR(50),
    NgayThamGia DATE,
    PRIMARY KEY (MaChuyenGia, MaDuAn),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaDuAn) REFERENCES DuAn(MaDuAn)
);
CREATE TABLE LogChuyenGia (
    MaChuyenGia INT,
    ThoiGian DATETIME,
    HanhDong NVARCHAR(50)
);

-- Chèn dữ liệu mẫu vào bảng Chuyên gia
INSERT INTO ChuyenGia (MaChuyenGia, HoTen, NgaySinh, GioiTinh, Email, SoDienThoai, ChuyenNganh, NamKinhNghiem)
VALUES 
(1, N'Nguyễn Văn An', '1985-05-10', N'Nam', 'nguyenvanan@email.com', '0901234567', N'Phát triển phần mềm', 10),
(2, N'Trần Thị Bình', '1990-08-15', N'Nữ', 'tranthiminh@email.com', '0912345678', N'An ninh mạng', 7),
(3, N'Lê Hoàng Cường', '1988-03-20', N'Nam', 'lehoangcuong@email.com', '0923456789', N'Trí tuệ nhân tạo', 9),
(4, N'Phạm Thị Dung', '1992-11-25', N'Nữ', 'phamthidung@email.com', '0934567890', N'Khoa học dữ liệu', 6),
(5, N'Hoàng Văn Em', '1987-07-30', N'Nam', 'hoangvanem@email.com', '0945678901', N'Điện toán đám mây', 8),
(6, N'Ngô Thị Phượng', '1993-02-14', N'Nữ', 'ngothiphuong@email.com', '0956789012', N'Phân tích dữ liệu', 5),
(7, N'Đặng Văn Giang', '1986-09-05', N'Nam', 'dangvangiang@email.com', '0967890123', N'IoT', 11),
(8, N'Vũ Thị Hương', '1991-12-20', N'Nữ', 'vuthihuong@email.com', '0978901234', N'UX/UI Design', 7),
(9, N'Bùi Văn Inh', '1989-04-15', N'Nam', 'buivaninch@email.com', '0989012345', N'DevOps', 8),
(10, N'Lý Thị Khánh', '1994-06-30', N'Nữ', 'lythikhanh@email.com', '0990123456', N'Blockchain', 4);

-- Chèn dữ liệu mẫu vào bảng Công ty
INSERT INTO CongTy (MaCongTy, TenCongTy, DiaChi, LinhVuc, SoNhanVien)
VALUES 
(1, N'TechViet Solutions', N'123 Đường Lê Lợi, TP.HCM', N'Phát triển phần mềm', 200),
(2, N'DataSmart Analytics', N'456 Đường Nguyễn Huệ, Hà Nội', N'Phân tích dữ liệu', 150),
(3, N'CloudNine Systems', N'789 Đường Trần Hưng Đạo, Đà Nẵng', N'Điện toán đám mây', 100),
(4, N'SecureNet Vietnam', N'101 Đường Võ Văn Tần, TP.HCM', N'An ninh mạng', 80),
(5, N'AI Innovate', N'202 Đường Lý Tự Trọng, Hà Nội', N'Trí tuệ nhân tạo', 120);

-- Chèn dữ liệu mẫu vào bảng Dự án
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES 
(1, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Hoàn thành'),
(2, N'Xây dựng hệ thống phân tích dữ liệu khách hàng', 2, '2023-03-15', '2023-09-15', N'Đang thực hiện'),
(3, N'Triển khai giải pháp đám mây cho doanh nghiệp', 3, '2023-02-01', '2023-08-31', N'Đang thực hiện'),
(4, N'Nâng cấp hệ thống bảo mật cho tập đoàn viễn thông', 4, '2023-04-01', '2023-10-31', N'Đang thực hiện'),
(5, N'Phát triển chatbot AI cho dịch vụ khách hàng', 5, '2023-05-01', '2023-11-30', N'Đang thực hiện');

-- Chèn dữ liệu mẫu vào bảng Kỹ năng
INSERT INTO KyNang (MaKyNang, TenKyNang, LoaiKyNang)
VALUES 
(1, 'Java', N'Ngôn ngữ lập trình'),
(2, 'Python', N'Ngôn ngữ lập trình'),
(3, 'Machine Learning', N'Công nghệ'),
(4, 'AWS', N'Nền tảng đám mây'),
(5, 'Docker', N'Công cụ'),
(6, 'Kubernetes', N'Công cụ'),
(7, 'SQL', N'Cơ sở dữ liệu'),
(8, 'NoSQL', N'Cơ sở dữ liệu'),
(9, 'React', N'Framework'),
(10, 'Angular', N'Framework');

-- Chèn dữ liệu mẫu vào bảng Chuyên gia - Kỹ năng
INSERT INTO ChuyenGia_KyNang (MaChuyenGia, MaKyNang, CapDo)
VALUES 
(1, 1, 5), (1, 7, 4), (1, 9, 3),
(2, 2, 4), (2, 3, 3), (2, 8, 4),
(3, 2, 5), (3, 3, 5), (3, 4, 3),
(4, 2, 4), (4, 7, 5), (4, 8, 4),
(5, 4, 5), (5, 5, 4), (5, 6, 4),
(6, 2, 4), (6, 3, 3), (6, 7, 5),
(7, 1, 3), (7, 2, 4), (7, 5, 3),
(8, 9, 5), (8, 10, 4),
(9, 5, 5), (9, 6, 5), (9, 4, 4),
(10, 2, 3), (10, 3, 3), (10, 8, 4);

-- Chèn dữ liệu mẫu vào bảng Chuyên gia - Dự án
INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
VALUES 
(1, 1, N'Trưởng nhóm phát triển', '2023-01-01'),
(2, 4, N'Chuyên gia bảo mật', '2023-04-01'),
(3, 5, N'Kỹ sư AI', '2023-05-01'),
(4, 2, N'Chuyên gia phân tích dữ liệu', '2023-03-15'),
(5, 3, N'Kiến trúc sư đám mây', '2023-02-01'),
(6, 2, N'Chuyên gia phân tích dữ liệu', '2023-03-15'),
(7, 3, N'Kỹ sư IoT', '2023-02-01'),
(8, 1, N'Nhà thiết kế UX/UI', '2023-01-01'),
(9, 3, N'Kỹ sư DevOps', '2023-02-01'),
(10, 5, N'Kỹ sư Blockchain', '2023-05-01');
--Cau 1
SELECT HoTen
FROM ChuyenGia
ORDER BY HoTen; 
--Cau 2
SELECT HoTen, SoDienThoai
FROM ChuyenGia WHERE ChuyenNganh = N'Phát triển phần mềm';
--Cau 3
SELECT TenCongTy 
FROM CongTy
WHERE SoNhanVien > 100; 
--Cau 4
SELECT TenDuAn, NgayBatDau
FROM DuAn
WHERE YEAR(NgayBatDau) = 2023; 
--Cau 5 
SELECT TenKyNang
FROM KyNang
ORDER BY TenKyNang;
--Cau 6
SELECT HoTen, Email 
FROM ChuyenGia
WHERE DATEDIFF(YEAR, NgaySinh, '2024-01-01') < 35; 
--Cau 7 
SELECT HoTen, ChuyenNganh
FROM ChuyenGia
WHERE GioiTinh = N'Nữ';
--Cau 8
SELECT TenKyNang
FROM KyNang
WHERE LoaiKyNang = N'Công nghệ';
--Cau 9
SELECT TenCongTy, DiaChi
FROM CongTy
WHERE LinhVuc = N'Phân tích dữ liệu'; 
--Cau 10
SELECT TenDuAn
FROM DuAn 
WHERE TrangThai = N'Hoàn thành'; 
--Cau 11
SELECT HoTen, NamKinhNghiem
FROM ChuyenGia
ORDER BY NamKinhNghiem DESC; 
--Cau 12 
SELECT TenCongTy, SoNhanVien 
FROM CongTy
WHERE SoNhanVien BETWEEN 100 AND 200; 
--Cau 13
SELECT TenDuAn, NgayKetThuc
FROM DuAn
WHERE YEAR(NgayKetThuc) = 2023; 
--Cau 14
SELECT HoTen, Email 
FROM ChuyenGia
WHERE HoTen LIKE N'N%'; 
--Cau 15
SELECT TenKyNang, LoaiKyNang
FROM KyNang
WHERE LoaiKyNang != N'Ngôn ngữ lập trình'; 
--Cau 16
SELECT TenCongTy, LinhVuc
FROM CongTy
ORDER BY LinhVuc; 
--Cau 17 
SELECT HoTen, ChuyenNganh 
FROM ChuyenGia
WHERE GioiTinh = N'Nam' AND NamKinhNghiem > 5; 
--Cau 18
SELECT * FROM ChuyenGia; 
--Cau 19 
SELECT HoTen, Email 
FROM ChuyenGia
WHERE GioiTinh = N'Nữ'; 
--Cau 20 
SELECT TenCongTy, SoNhanVien 
FROM CongTy
ORDER BY SoNhanVien DESC; 
--Cau 21
SELECT TenDuAn 
FROM DuAn
WHERE TrangThai = N'Đang thực hiện'; 
--Cau 22
SELECT TenKyNang
FROM KyNang
WHERE LoaiKyNang = N'Ngôn ngữ lập trình'; 
--Cau 23
SELECT HoTen, ChuyenNganh 
FROM ChuyenGia 
WHERE NamKinhNghiem > 8; 
--Cau 24
SELECT TenDuAn
FROM DuAn
WHERE MaCongTy = 1; 
--Cau 25
SELECT ChuyenNganh, COUNT(*) AS SoLuongChuyenGia
FROM ChuyenGia
GROUP BY ChuyenNganh; 
--Cau 26
SELECT TOP 1 HoTen, NamKinhNghiem
FROM ChuyenGia
--ORDER BY NamKinhNghiem DESC; (neu muon nam kn giam dan)
--Cau 27
SELECT TenCongTy, SoNhanVien 
FROM CongTy
WHERE SoNhanVien > 100
ORDER BY SoNhanVien ASC; 
--Cau 28
SELECT C.TenCongTy, COUNT(D.MaDuAn) AS SoLuongDuAn
FROM CongTy C
JOIN DuAn D ON C.MaCongTy = D.MaCongTy
WHERE D.TrangThai = N'Đang thực hiện'
GROUP BY C.TenCongTy
HAVING COUNT(D.MaDuAn) > 1
ORDER BY SoLuongDuAn DESC;
--Cau 29 
SELECT K.TenKyNang, COUNT(CK.MaChuyenGia) AS TongSoChuyenGia
FROM KyNang K
JOIN ChuyenGia_KyNang CK ON K.MaKyNang = CK.MaKyNang
WHERE CK.CapDo >= 4
GROUP BY K.TenKyNang
HAVING COUNT(CK.MaChuyenGia) > 2
ORDER BY K.TenKyNang ASC;
--Cau 30 
SELECT TenCongTy, SoNhanVien 
FROM CongTy
WHERE LinhVuc = N'Điện toán đám mây'
ORDER BY SoNhanVien ASC; 
--Cau 31
SELECT TenCongTy, SoNhanVien, AVG(SoNhanVien) OVER() AS TrungBinhSoNhanVien
FROM CongTy
WHERE SoNhanVien BETWEEN 50 AND 100
ORDER BY TenCongTy ASC; 
--Cau 32
SELECT CG.HoTen, COUNT(CK.MaKyNang) AS SoLuongKyNang
FROM ChuyenGia CG
JOIN ChuyenGia_KyNang CK ON CG.MaChuyenGia = CK.MaChuyenGia
WHERE CK.CapDo = 5
GROUP BY CG.HoTen
HAVING COUNT(CK.MaKyNang) > 0
ORDER BY CG.HoTen ASC;
--Cau 33
SELECT K.TenKyNang, COUNT(CK.MaChuyenGia) AS TongSoChuyenGia
FROM KyNang K
JOIN ChuyenGia_KyNang CK ON K.MaKyNang = CK.MaKyNang
WHERE CK.CapDo >= 4
GROUP BY K.TenKyNang
HAVING COUNT(CK.MaChuyenGia) > 2
ORDER BY K.TenKyNang ASC;
--Cau 34
SELECT CG.HoTen, AVG(CK.CapDo) AS TrungBinhCapDo
FROM ChuyenGia CG 
JOIN ChuyenGia_KyNang CK ON CG.MaChuyenGia = CK.MaChuyenGia
WHERE CG.ChuyenNganh = N'Phát triển phần mềm'
GROUP BY CG.HoTen
HAVING AVG(CK.CapDo) > 3
ORDER BY TrungBinhCapDo DESC; 
----------------
--Lab 3 
--Cau 8
SELECT 
    k.TenKyNang, 
    cgk.CapDo
FROM 
    ChuyenGia_KyNang cgk
JOIN 
    KyNang k ON cgk.MaKyNang = k.MaKyNang
WHERE 
    cgk.MaChuyenGia = 1;
---Cau 9 
SELECT 
    cg.HoTen
FROM 
    ChuyenGia_DuAn cgd
JOIN 
    ChuyenGia cg ON cgd.MaChuyenGia = cg.MaChuyenGia
WHERE 
    cgd.MaDuAn = 2;
--Cau 10
SELECT 
    ct.TenCongTy, 
    da.TenDuAn
FROM 
    DuAn da
JOIN 
    CongTy ct ON da.MaCongTy = ct.MaCongTy;
--Cau 11
SELECT 
    ChuyenNganh,
    COUNT(MaChuyenGia) AS SoLuongChuyenGia
FROM 
    ChuyenGia
GROUP BY 
    ChuyenNganh;
--Cau 12 
SELECT TOP 1 
    HoTen, 
    NamKinhNghiem
FROM 
    ChuyenGia
ORDER BY 
    NamKinhNghiem DESC;
--Cau 13 
SELECT 
    cg.HoTen,
    COUNT(cgdu.MaDuAn) AS SoLuongDuAn
FROM 
    ChuyenGia cg
LEFT JOIN 
    ChuyenGia_DuAn cgdu ON cg.MaChuyenGia = cgdu.MaChuyenGia
GROUP BY 
    cg.HoTen;
--Cau 14 
SELECT 
    ct.TenCongTy,
    COUNT(da.MaDuAn) AS SoLuongDuAn
FROM 
    CongTy ct
LEFT JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
GROUP BY 
    ct.TenCongTy;
--Cau 15 
SELECT TOP 1 
    kn.TenKyNang, 
    COUNT(cgk.MaChuyenGia) AS SoLuongChuyenGia
FROM 
    ChuyenGia_KyNang cgk
JOIN 
    KyNang kn ON cgk.MaKyNang = kn.MaKyNang
GROUP BY 
    kn.TenKyNang
ORDER BY 
    SoLuongChuyenGia DESC;
--Cau 16 
SELECT 
    cg.HoTen
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang cgk ON cg.MaChuyenGia = cgk.MaChuyenGia
JOIN 
    KyNang kn ON cgk.MaKyNang = kn.MaKyNang
WHERE 
    kn.TenKyNang = 'Python' AND cgk.CapDo >= 4;
--Cau 17 
SELECT TOP 1 
    da.TenDuAn, 
    COUNT(cgdu.MaChuyenGia) AS SoLuongChuyenGia
FROM 
    DuAn da
JOIN 
    ChuyenGia_DuAn cgdu ON da.MaDuAn = cgdu.MaDuAn
GROUP BY 
    da.TenDuAn
ORDER BY 
    SoLuongChuyenGia DESC;
--Cau 18
SELECT 
    cg.HoTen, 
    COUNT(cgk.MaKyNang) AS SoLuongKyNang
FROM 
    ChuyenGia cg
LEFT JOIN 
    ChuyenGia_KyNang cgk ON cg.MaChuyenGia = cgk.MaChuyenGia
GROUP BY 
    cg.HoTen;
--Cau 19
SELECT 
    cg1.HoTen AS ChuyenGia1, 
    cg2.HoTen AS ChuyenGia2, 
    cgdu.MaDuAn
FROM 
    ChuyenGia_DuAn cgdu
JOIN 
    ChuyenGia cg1 ON cgdu.MaChuyenGia = cg1.MaChuyenGia
JOIN 
    ChuyenGia cg2 ON cgdu.MaChuyenGia = cg2.MaChuyenGia
WHERE 
    cg1.MaChuyenGia < cg2.MaChuyenGia;  
--Cau 20 
SELECT 
    cg.HoTen, 
    COUNT(cgk.MaKyNang) AS SoLuongKyNangCapDo5
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang cgk ON cg.MaChuyenGia = cgk.MaChuyenGia
WHERE 
    cgk.CapDo = 5
GROUP BY 
    cg.HoTen;
--Cau 21 
SELECT 
    ct.TenCongTy
FROM 
    CongTy ct
LEFT JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
WHERE 
    da.MaDuAn IS NULL;
--Cau 22
SELECT 
    cg.HoTen AS TenChuyenGia, 
    da.TenDuAn AS TenDuAn
FROM 
    ChuyenGia cg
LEFT JOIN 
    ChuyenGia_DuAn cgdu ON cg.MaChuyenGia = cgdu.MaChuyenGia
LEFT JOIN 
    DuAn da ON cgdu.MaDuAn = da.MaDuAn;
--Cau 23
SELECT 
    cg.HoTen
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang cgk ON cg.MaChuyenGia = cgk.MaChuyenGia
GROUP BY 
    cg.HoTen
HAVING 
    COUNT(cgk.MaKyNang) >= 3;
--Cau 24
SELECT 
    ct.TenCongTy, 
    SUM(cg.NamKinhNghiem) AS TongNamKinhNghiem
FROM 
    CongTy ct
JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
JOIN 
    ChuyenGia_DuAn cgdu ON da.MaDuAn = cgdu.MaDuAn
JOIN 
    ChuyenGia cg ON cgdu.MaChuyenGia = cg.MaChuyenGia
GROUP BY 
    ct.TenCongTy;
--Cau 25
SELECT 
    cg.HoTen
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang cgk ON cg.MaChuyenGia = cgk.MaChuyenGia
WHERE 
    cgk.MaKyNang = 1  
GROUP BY 
    cg.HoTen
HAVING 
    SUM(CASE WHEN cgk.MaKyNang = 2 THEN 1 ELSE 0 END) = 0; 
--Cau 76
SELECT 
    cg.HoTen
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang cgk ON cg.MaChuyenGia = cgk.MaChuyenGia
GROUP BY 
    cg.HoTen
HAVING 
    COUNT(cgk.MaKyNang) = 
	(
        SELECT 
            MAX(SkillCount)
        FROM 
            (SELECT COUNT(*) AS SkillCount
             FROM ChuyenGia_KyNang
             GROUP BY MaChuyenGia) AS SkillCounts
    );
--Cau 77
SELECT 
    cg1.HoTen AS ChuyenGia1, 
    cg2.HoTen AS ChuyenGia2
FROM 
    ChuyenGia cg1
JOIN 
    ChuyenGia cg2 ON cg1.ChuyenNganh = cg2.ChuyenNganh 
WHERE 
    cg1.MaChuyenGia <> cg2.MaChuyenGia;
--Cau 78 
SELECT TOP 1 
    ct.TenCongTy
FROM 
    CongTy ct
JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
JOIN 
    ChuyenGia_DuAn cgdu ON da.MaDuAn = cgdu.MaDuAn
JOIN 
    ChuyenGia cg ON cgdu.MaChuyenGia = cg.MaChuyenGia
GROUP BY 
    ct.TenCongTy
ORDER BY 
    SUM(cg.NamKinhNghiem) DESC;
--Cau 79
SELECT 
    ky.TenKyNang
FROM 
    KyNang ky
WHERE 
    NOT EXISTS 
	(
        SELECT 1 
        FROM ChuyenGia cg 
        WHERE NOT EXISTS 
		(
            SELECT 1 
            FROM ChuyenGia_KyNang cgk 
            WHERE cgk.MaKyNang = ky.MaKyNang AND cgk.MaChuyenGia = cg.MaChuyenGia
        )
    );
--TH4 
--TH4 cau 76
SELECT TOP 3 
    cg.HoTen,
    COUNT(ck.MaKyNang) AS SoLuongKyNang
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang ck ON cg.MaChuyenGia = ck.MaChuyenGia
GROUP BY 
    cg.MaChuyenGia, cg.HoTen
ORDER BY 
    SoLuongKyNang DESC;
--Cau 77 
SELECT 
    cg1.HoTen AS ChuyenGia1, 
    cg2.HoTen AS ChuyenGia2,
    cg1.ChuyenNganh,
    ABS(cg1.NamKinhNghiem - cg2.NamKinhNghiem) AS ChenhLechKinhNghiem
FROM 
    ChuyenGia cg1
JOIN 
    ChuyenGia cg2 ON cg1.ChuyenNganh = cg2.ChuyenNganh 
                  AND cg1.MaChuyenGia < cg2.MaChuyenGia
WHERE 
    ABS(cg1.NamKinhNghiem - cg2.NamKinhNghiem) <= 2;
--Cau 78 
SELECT 
    ct.TenCongTy,
    COUNT(DISTINCT da.MaDuAn) AS SoLuongDuAn,
    SUM(cg.NamKinhNghiem) AS TongNamKinhNghiem
FROM 
    CongTy ct
JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
JOIN 
    ChuyenGia_DuAn cda ON da.MaDuAn = cda.MaDuAn
JOIN 
    ChuyenGia cg ON cda.MaChuyenGia = cg.MaChuyenGia
GROUP BY 
    ct.TenCongTy;
--Cau 79:
SELECT 
    cg.HoTen
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang ck ON cg.MaChuyenGia = ck.MaChuyenGia
GROUP BY 
    cg.MaChuyenGia, cg.HoTen
HAVING 
    MAX(CASE WHEN ck.CapDo = 5 THEN 1 ELSE 0 END) = 1 
    AND MIN(ck.CapDo) >= 3;
--Cau 80 
SELECT 
    cg.HoTen,
    COUNT(cda.MaDuAn) AS SoLuongDuAnThamGia
FROM 
    ChuyenGia cg
LEFT JOIN 
    ChuyenGia_DuAn cda ON cg.MaChuyenGia = cda.MaChuyenGia
GROUP BY 
    cg.HoTen;
--Cau 81 
SELECT 
    k.LoaiKyNang,
    cg.HoTen,
    MAX(ck.CapDo) AS CapDoCaoNhat
FROM 
    KyNang k
JOIN 
    ChuyenGia_KyNang ck ON k.MaKyNang = ck.MaKyNang
JOIN 
    ChuyenGia cg ON ck.MaChuyenGia = cg.MaChuyenGia
GROUP BY 
    k.LoaiKyNang, cg.HoTen
HAVING 
    ck.CapDo = MAX(ck.CapDo);
--Cau 82 
SELECT 
    ChuyenNganh,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ChuyenGia) AS TiLePhanTram
FROM 
    ChuyenGia
GROUP BY 
    ChuyenNganh;
--Cau 83
SELECT 
    k1.TenKyNang AS KyNang1,
    k2.TenKyNang AS KyNang2,
    COUNT(*) AS SoLanXuatHienCung
FROM 
    ChuyenGia_KyNang ck1
JOIN 
    ChuyenGia_KyNang ck2 ON ck1.MaChuyenGia = ck2.MaChuyenGia AND ck1.MaKyNang < ck2.MaKyNang
JOIN 
    KyNang k1 ON ck1.MaKyNang = k1.MaKyNang
JOIN 
    KyNang k2 ON ck2.MaKyNang = k2.MaKyNang
GROUP BY 
    k1.TenKyNang, k2.TenKyNang
ORDER BY 
    SoLanXuatHienCung DESC;
--Cau 84
SELECT 
    ct.TenCongTy,
    AVG(DATEDIFF(DAY, da.NgayBatDau, da.NgayKetThuc)) AS SoNgayTrungBinh
FROM 
    CongTy ct
JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
GROUP BY 
    ct.TenCongTy;
--Cau 85
SELECT 
    cg.HoTen,
    STRING_AGG(k.TenKyNang, ', ') AS KetHopKyNang
FROM 
    ChuyenGia cg
JOIN 
    ChuyenGia_KyNang ck ON cg.MaChuyenGia = ck.MaChuyenGia
JOIN 
    KyNang k ON ck.MaKyNang = k.MaKyNang
GROUP BY 
    cg.HoTen
HAVING 
    COUNT(DISTINCT ck.MaKyNang) = 1 
    OR NOT EXISTS (
        SELECT 1 
        FROM ChuyenGia cg2 
        WHERE cg2.MaChuyenGia != cg.MaChuyenGia 
        AND NOT EXISTS (
            SELECT 1 
            FROM ChuyenGia_KyNang ck2 
            WHERE ck2.MaChuyenGia = cg2.MaChuyenGia 
            AND ck2.MaKyNang = ck.MaKyNang
        )
    );
--Cau 86
SELECT 
    cg.HoTen,
    COUNT(DISTINCT cda.MaDuAn) AS SoLuongDuAn,
    SUM(ck.CapDo) AS TongCapDoKyNang,
    RANK() OVER (ORDER BY COUNT(DISTINCT cda.MaDuAn) DESC, SUM(ck.CapDo) DESC) AS XepHang
FROM 
    ChuyenGia cg
LEFT JOIN 
    ChuyenGia_DuAn cda ON cg.MaChuyenGia = cda.MaChuyenGia
LEFT JOIN 
    ChuyenGia_KyNang ck ON cg.MaChuyenGia = ck.MaChuyenGia
GROUP BY 
    cg.HoTen;
--Cau 87
SELECT 
    da.TenDuAn
FROM 
    DuAn da
JOIN 
    ChuyenGia_DuAn cda ON da.MaDuAn = cda.MaDuAn
JOIN 
    ChuyenGia cg ON cda.MaChuyenGia = cg.MaChuyenGia
GROUP BY 
    da.TenDuAn
HAVING 
    COUNT(DISTINCT cg.ChuyenNganh) = (SELECT COUNT(DISTINCT ChuyenNganh) FROM ChuyenGia);
--Cau 88
SELECT 
    ct.TenCongTy,
    COUNT(CASE WHEN da.TrangThai = N'Hoàn thành' THEN 1 END) * 100.0 / COUNT(*) AS TiLeThanhCong
FROM 
    CongTy ct
JOIN 
    DuAn da ON ct.MaCongTy = da.MaCongTy
GROUP BY 
    ct.TenCongTy;
--Cau 89
SELECT 
    cg1.HoTen AS ChuyenGia1,
    cg2.HoTen AS ChuyenGia2,
    k1.TenKyNang AS KyNangA,
    k2.TenKyNang AS KyNangB,
    ck1.CapDo AS CapDoA_ChuyenGia1,
    ck2.CapDo AS CapDoB_ChuyenGia1,
    ck3.CapDo AS CapDoA_ChuyenGia2,
    ck4.CapDo AS CapDoB_ChuyenGia2
FROM 
    ChuyenGia cg1
JOIN 
    ChuyenGia cg2 ON cg1.MaChuyenGia < cg2.MaChuyenGia
JOIN 
    ChuyenGia_KyNang ck1 ON cg1.MaChuyenGia = ck1.MaChuyenGia
JOIN 
    ChuyenGia_KyNang ck2 ON cg1.MaChuyenGia = ck2.MaChuyenGia AND ck1.MaKyNang != ck2.MaKyNang
JOIN 
    ChuyenGia_KyNang ck3 ON cg2.MaChuyenGia = ck3.MaChuyenGia AND ck3.MaKyNang = ck1.MaKyNang
JOIN 
    ChuyenGia_KyNang ck4 ON cg2.MaChuyenGia = ck4.MaChuyenGia AND ck4.MaKyNang = ck2.MaKyNang
JOIN 
    KyNang k1 ON ck1.MaKyNang = k1.MaKyNang
JOIN 
    KyNang k2 ON ck2.MaKyNang = k2.MaKyNang
WHERE 
    ck1.CapDo >= 4 AND ck2.CapDo <= 2 
    AND ck3.CapDo <= 2 AND ck4.CapDo >= 4;

--TH5
--Cau 101 
GO
CREATE TRIGGER trg_UpdateNgayCapNhat
ON ChuyenGia
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE ChuyenGia
    SET NgayCapNhat = GETDATE()
    FROM ChuyenGia c
    INNER JOIN inserted i ON c.MaChuyenGia = i.MaChuyenGia;
END;
GO
--Cau 102 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'DuAnLog')
BEGIN
    CREATE TABLE DuAnLog (
        LogID INT IDENTITY PRIMARY KEY,
        MaDuAn INT,
        TenDuAn NVARCHAR(200),
        TrangThai NVARCHAR(50),
        ThoiGianThayDoi DATETIME,
        HanhDong NVARCHAR(50)
    );
END;
GO
CREATE TRIGGER trg_LogDuAn
ON DuAn
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        INSERT INTO DuAnLog (MaDuAn, TenDuAn, TrangThai, ThoiGianThayDoi, HanhDong)
        SELECT MaDuAn, TenDuAn, TrangThai, GETDATE(), 'UPDATE'
        FROM inserted;
    ELSE IF EXISTS (SELECT * FROM inserted)
        INSERT INTO DuAnLog (MaDuAn, TenDuAn, TrangThai, ThoiGianThayDoi, HanhDong)
        SELECT MaDuAn, TenDuAn, TrangThai, GETDATE(), 'INSERT'
        FROM inserted;
    ELSE
        INSERT INTO DuAnLog (MaDuAn, TenDuAn, TrangThai, ThoiGianThayDoi, HanhDong)
        SELECT MaDuAn, TenDuAn, TrangThai, GETDATE(), 'DELETE'
        FROM deleted;
END;
GO
--Cau 103 
CREATE TRIGGER trg_LimitChuyenGiaDuAn
ON ChuyenGia_DuAn
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT MaChuyenGia
        FROM ChuyenGia_DuAn
        GROUP BY MaChuyenGia
        HAVING COUNT(*) > 5
    )
    BEGIN
        RAISERROR('Chuyen gia khong the tham gia qua 5 du an cung luc.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
GO
--Cau 104 
CREATE TRIGGER trg_UpdateSoNhanVien
ON ChuyenGia
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE CongTy
    SET SoNhanVien = (SELECT COUNT(*) FROM ChuyenGia);
END;
GO
--Cau 105 
CREATE TRIGGER trg_PreventDeleteCompletedDuAn
ON DuAn
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM deleted WHERE TrangThai = 'Hoan thanh')
    BEGIN
        RAISERROR('Khong the xoa du an da hoan thanh.', 16, 1);
    END
    ELSE
    BEGIN
        DELETE FROM DuAn WHERE MaDuAn IN (SELECT MaDuAn FROM deleted);
    END;
END;
GO
--Cau 106 
CREATE TRIGGER trg_UpdateSkillLevel
ON ChuyenGia_DuAn
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE ChuyenGia_KyNang
    SET CapDo = CapDo + 1
    WHERE MaChuyenGia IN (SELECT MaChuyenGia FROM inserted);
END;
GO
--Cau 107 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'KyNangLog')
BEGIN
    CREATE TABLE KyNangLog (
        LogID INT IDENTITY PRIMARY KEY,
        MaChuyenGia INT,
        MaKyNang INT,
        CapDo INT,
        ThoiGianThayDoi DATETIME
    );
END;
GO
CREATE TRIGGER trg_LogCapDoKyNang
ON ChuyenGia_KyNang
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO KyNangLog (MaChuyenGia, MaKyNang, CapDo, ThoiGianThayDoi)
    SELECT MaChuyenGia, MaKyNang, CapDo, GETDATE()
    FROM inserted;
END;
GO
--Cau 108 
CREATE TRIGGER trg_CheckNgayKetThuc
ON DuAn
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM inserted WHERE NgayKetThuc <= NgayBatDau)
    BEGIN
        RAISERROR('Ngay ket thuc phai lon hon ngay bat dau.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
GO
--Cau 109 
CREATE TRIGGER trg_DeleteChuyenGiaKyNang
ON KyNang
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM ChuyenGia_KyNang
    WHERE MaKyNang IN (SELECT MaKyNang FROM deleted);
END;
GO
--Cau 110 
CREATE TRIGGER trg_LimitDuAnPerCongTy
ON DuAn
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT MaCongTy
        FROM DuAn
        WHERE TrangThai = 'Dang thuc hien'
        GROUP BY MaCongTy
        HAVING COUNT(*) > 10
    )
    BEGIN
        RAISERROR('Mot cong ty khong the co qua 10 du an dang thuc hien.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
GO
--Cau 123 
CREATE TRIGGER trg_UpdateLuongChuyenGia
ON ChuyenGia_KyNang
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE c
    SET c.Luong = (k.CapDo * 1000) + (c.NamKinhNghiem * 500)
    FROM ChuyenGia c
    INNER JOIN inserted i ON c.MaChuyenGia = i.MaChuyenGia
    INNER JOIN ChuyenGia_KyNang k ON c.MaChuyenGia = k.MaChuyenGia;
END;
GO
--Cau 124 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'ThongBao')
BEGIN
    CREATE TABLE ThongBao (
        ThongBaoID INT IDENTITY PRIMARY KEY,
        NoiDung NVARCHAR(200),
        ThoiGian DATETIME
    );
END;
GO
CREATE TRIGGER trg_ThongBaoSapDenHan
ON DuAn
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO ThongBao (NoiDung, ThoiGian)
    SELECT CONCAT('Du an "', TenDuAn, '" sap den han sau 7 ngay.')
           , GETDATE()
    FROM inserted
    WHERE DATEDIFF(DAY, GETDATE(), NgayKetThuc) = 7;
END;
GO
--Cau 125 
CREATE TRIGGER trg_PreventDeleteUpdateChuyenGia
ON ChuyenGia
INSTEAD OF DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1
        FROM ChuyenGia_DuAn d
        INNER JOIN deleted c ON d.MaChuyenGia = c.MaChuyenGia
    )
    BEGIN
        RAISERROR('Khong the xoa hoac cap nhat chuyen gia dang tham gia du an.', 16, 1);
        RETURN;
    END;

    DELETE FROM ChuyenGia WHERE MaChuyenGia IN (SELECT MaChuyenGia FROM deleted);
END;
GO
--Cau 126 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'ThongKeChuyenNganh')
BEGIN
    CREATE TABLE ThongKeChuyenNganh (
        ChuyenNganh NVARCHAR(50) PRIMARY KEY,
        SoLuongChuyenGia INT
    );
END;
GO
CREATE TRIGGER trg_UpdateThongKeChuyenNganh
ON ChuyenGia
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    MERGE ThongKeChuyenNganh AS t
    USING (SELECT ChuyenNganh, COUNT(*) AS SoLuong
           FROM ChuyenGia
           GROUP BY ChuyenNganh) AS src
    ON t.ChuyenNganh = src.ChuyenNganh
    WHEN MATCHED THEN UPDATE SET SoLuongChuyenGia = src.SoLuong
    WHEN NOT MATCHED THEN INSERT (ChuyenNganh, SoLuongChuyenGia)
    VALUES (src.ChuyenNganh, src.SoLuong);
END;
GO
--Cau 127 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'DuAnHoanThanh')
BEGIN
    CREATE TABLE DuAnHoanThanh (
        MaDuAn INT PRIMARY KEY,
        TenDuAn NVARCHAR(200),
        NgayBatDau DATE,
        NgayKetThuc DATE
    );
END;
GO
CREATE TRIGGER trg_BackupDuAnHoanThanh
ON DuAn
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO DuAnHoanThanh (MaDuAn, TenDuAn, NgayBatDau, NgayKetThuc)
    SELECT MaDuAn, TenDuAn, NgayBatDau, NgayKetThuc
    FROM inserted
    WHERE TrangThai = 'Hoan thanh';
END;
GO
--Cau 128 
CREATE TRIGGER trg_UpdateDiemCongTy
ON DuAn
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE CongTy
    SET DiemTrungBinh = (
        SELECT AVG(DiemDanhGia) FROM DuAn WHERE DuAn.MaCongTy = CongTy.MaCongTy
    )
    FROM CongTy;
END;
GO
--Cau 129 
CREATE TRIGGER trg_AutoAssignChuyenGia
ON DuAn
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
    SELECT TOP 1 c.MaChuyenGia, i.MaDuAn, 'Chuyen gia', GETDATE()
    FROM ChuyenGia c
    CROSS JOIN inserted i
    WHERE c.NamKinhNghiem >= 5
    ORDER BY c.NamKinhNghiem DESC;
END;
GO
--Cau 130 
CREATE TRIGGER trg_UpdateTrangThaiChuyenGia
ON ChuyenGia_DuAn
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE ChuyenGia
    SET TrangThai = 'Ban'
    WHERE MaChuyenGia IN (SELECT MaChuyenGia FROM inserted);
END;
GO
--Cau 131 
CREATE TRIGGER trg_PreventDuplicateSkill
ON ChuyenGia_KyNang
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN ChuyenGia_KyNang c ON i.MaChuyenGia = c.MaChuyenGia AND i.MaKyNang = c.MaKyNang
    )
    BEGIN
        RAISERROR('Ky nang da ton tai cho chuyen gia nay.', 16, 1);
        RETURN;
    END;

    INSERT INTO ChuyenGia_KyNang (MaChuyenGia, MaKyNang, CapDo)
    SELECT MaChuyenGia, MaKyNang, CapDo FROM inserted;
END;
GO
--Cau 132 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'BaoCaoTongKet')
BEGIN
    CREATE TABLE BaoCaoTongKet (
        MaDuAn INT PRIMARY KEY,
        TenDuAn NVARCHAR(200),
        NgayKetThuc DATE,
        NoiDung NVARCHAR(500),
        NgayTao DATE
    );
END;
GO
CREATE TRIGGER trg_TaoBaoCaoTongKet
ON DuAn
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO BaoCaoTongKet (MaDuAn, TenDuAn, NgayKetThuc, NoiDung, NgayTao)
    SELECT MaDuAn, TenDuAn, NgayKetThuc, 
           CONCAT('Du an "', TenDuAn, '" da ket thuc thanh cong vao ngay ', NgayKetThuc, '.'), 
           GETDATE()
    FROM inserted
    WHERE TrangThai = 'Hoan thanh';
END;
GO
--Cau 133 
CREATE TRIGGER trg_CapNhatThuHangCongTy
ON DuAn
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    WITH CongTyDanhGia AS (
        SELECT 
            d.MaCongTy,
            COUNT(*) AS SoDuAnHoanThanh,
            AVG(DiemDanhGia) AS DiemTrungBinh
        FROM DuAn d
        WHERE d.TrangThai = 'Hoan thanh'
        GROUP BY d.MaCongTy
    )
    UPDATE c
    SET ThuHang = CASE 
                    WHEN cdg.SoDuAnHoanThanh >= 10 AND cdg.DiemTrungBinh >= 9 THEN 'Hang A'
                    WHEN cdg.SoDuAnHoanThanh >= 5 AND cdg.DiemTrungBinh >= 7 THEN 'Hang B'
                    ELSE 'Hang C'
                 END
    FROM CongTy c
    INNER JOIN CongTyDanhGia cdg ON c.MaCongTy = cdg.MaCongTy;
END;
GO
--Cau 134 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'ThongBao')
BEGIN
    CREATE TABLE ThongBao (
        ThongBaoID INT IDENTITY PRIMARY KEY,
        NoiDung NVARCHAR(200),
        ThoiGian DATETIME
    );
END;
GO
CREATE TRIGGER trg_ThongBaoThangCap
ON ChuyenGia
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO ThongBao (NoiDung, ThoiGian)
    SELECT CONCAT('Chuyen gia "', HoTen, '" duoc thang cap voi ', NamKinhNghiem, ' nam kinh nghiem.')
           , GETDATE()
    FROM inserted i
    WHERE i.NamKinhNghiem >= 5;
END;
GO
--Cau 135 
CREATE TRIGGER trg_UpdateTrangThaiKhanCap
ON DuAn
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE DuAn
    SET TrangThai = 'Khan cap'
    FROM DuAn
    WHERE DATEDIFF(DAY, GETDATE(), NgayKetThuc) < (DATEDIFF(DAY, NgayBatDau, NgayKetThuc) * 0.1);
END;
GO
--Cau 136 
CREATE TRIGGER trg_CapNhatSoDuAnChuyenGia
ON ChuyenGia_DuAn
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE ChuyenGia
    SET SoDuAnDangThucHien = (
        SELECT COUNT(*) 
        FROM ChuyenGia_DuAn 
        WHERE ChuyenGia_DuAn.MaChuyenGia = ChuyenGia.MaChuyenGia
    );
END;
GO
--Cau 137 
CREATE TRIGGER trg_TinhTyLeThanhCong
ON DuAn
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE CongTy
    SET TyLeThanhCong = (
        SELECT CAST(COUNT(CASE WHEN TrangThai = 'Hoan thanh' THEN 1 END) AS FLOAT) / COUNT(*) * 100
        FROM DuAn
        WHERE DuAn.MaCongTy = CongTy.MaCongTy
    )
    FROM CongTy;
END;
GO
--Cau 138 
IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = 'LogLuong')
BEGIN
    CREATE TABLE LogLuong (
        LogID INT IDENTITY PRIMARY KEY,
        MaChuyenGia INT,
        LuongCu DECIMAL(18,2),
        LuongMoi DECIMAL(18,2),
        NgayThayDoi DATETIME
    );
END;
GO
CREATE TRIGGER trg_LogLuongChuyenGia
ON ChuyenGia
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO LogLuong (MaChuyenGia, LuongCu, LuongMoi, NgayThayDoi)
    SELECT d.MaChuyenGia, d.Luong, i.Luong, GETDATE()
    FROM deleted d
    INNER JOIN inserted i ON d.MaChuyenGia = i.MaChuyenGia
    WHERE d.Luong <> i.Luong;
END;
GO
--Cau 139 
CREATE TRIGGER trg_CapNhatSoChuyenGiaCapCao
ON ChuyenGia
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE CongTy
    SET SoChuyenGiaCapCao = (
        SELECT COUNT(*) 
        FROM ChuyenGia c
        WHERE c.NamKinhNghiem >= 10
    );
END;
GO
--Cau 140 
CREATE TRIGGER trg_CapNhatYeuCauNhanLuc
ON ChuyenGia_DuAn
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE DuAn
    SET YeuCauBoSung = 'Can bo sung'
    WHERE MaDuAn IN (
        SELECT MaDuAn 
        FROM ChuyenGia_DuAn
        GROUP BY MaDuAn
        HAVING COUNT(MaChuyenGia) < 3
    );
END;
GO
--TH6 
--Cau 1: 
SELECT * FROM ChuyenGia;
--Cau 2: 
SELECT HoTen, Email 
FROM ChuyenGia 
WHERE GioiTinh ='Nu';
--Cau 3: 
SELECT TenCongTy 
FROM CongTy 
WHERE SoNhanVien > 100;
--Cau 4: 
SELECT TenDuAn, NgayBatDau 
FROM DuAn 
WHERE YEAR(NgayBatDau) = 2023;
--Trung cap
--Cau 6: 
SELECT CG.HoTen, COUNT(CGD.MaDuAn) AS SoDuAn
FROM ChuyenGia CG
JOIN ChuyenGia_DuAn CGD ON CG.MaChuyenGia = CGD.MaChuyenGia
GROUP BY CG.HoTen;
--Cau 7: 
SELECT DISTINCT DA.TenDuAn
FROM DuAn DA
JOIN ChuyenGia_DuAn CGD ON DA.MaDuAn = CGD.MaDuAn
JOIN ChuyenGia_KyNang CGK ON CGD.MaChuyenGia = CGK.MaChuyenGia
JOIN KyNang KN ON CGK.MaKyNang = KN.MaKyNang
WHERE KN.TenKyNang = 'Python' AND CGK.CapDo >= 4;
--Cau 8: 
SELECT CT.TenCongTy, COUNT(DA.MaDuAn) AS SoDuAnDangThucHien
FROM CongTy CT
JOIN DuAn DA ON CT.MaCongTy = DA.MaCongTy
WHERE DA.TrangThai = 'Dang thuc hien'
GROUP BY CT.TenCongTy;
--Cau 9: 
SELECT ChuyenNganh, HoTen, MAX(NamKinhNghiem) AS NamKinhNghiem
FROM ChuyenGia
GROUP BY ChuyenNganh, HoTen;
--Cau 10: 
SELECT DISTINCT CG1.HoTen AS ChuyenGia1, CG2.HoTen AS ChuyenGia2
FROM ChuyenGia_DuAn CGD1
JOIN ChuyenGia_DuAn CGD2 ON CGD1.MaDuAn = CGD2.MaDuAn AND CGD1.MaChuyenGia < CGD2.MaChuyenGia
JOIN ChuyenGia CG1 ON CGD1.MaChuyenGia = CG1.MaChuyenGia
JOIN ChuyenGia CG2 ON CGD2.MaChuyenGia = CG2.MaChuyenGia;
--Nang cao 
--Cau 11: 
SELECT CG.HoTen, SUM(DATEDIFF(DAY, DA.NgayBatDau, DA.NgayKetThuc)) AS TongNgay
FROM ChuyenGia CG
JOIN ChuyenGia_DuAn CGD ON CG.MaChuyenGia = CGD.MaChuyenGia
JOIN DuAn DA ON CGD.MaDuAn = DA.MaDuAn
GROUP BY CG.HoTen;
--Cau 12: 
SELECT CT.TenCongTy, 
       COUNT(CASE WHEN DA.TrangThai = 'Hoan thanh' THEN 1 END) * 100.0 / COUNT(DA.MaDuAn) AS TyLeHoanThanh
FROM CongTy CT
JOIN DuAn DA ON CT.MaCongTy = DA.MaCongTy
GROUP BY CT.TenCongTy
HAVING COUNT(CASE WHEN DA.TrangThai = 'Hoan thanh' THEN 1 END) * 100.0 / COUNT(DA.MaDuAn) > 90;
--Cau 13: 
SELECT TOP 3 KN.TenKyNang, COUNT(*) AS SoLan
FROM ChuyenGia_KyNang CGK
JOIN KyNang KN ON CGK.MaKyNang = KN.MaKyNang
GROUP BY KN.TenKyNang
ORDER BY SoLan DESC;
--Cau 14: 
SELECT 
    CASE 
        WHEN NamKinhNghiem <= 2 THEN 'Junior'
        WHEN NamKinhNghiem <= 5 THEN 'Middle'
        ELSE 'Senior'
    END AS CapDo,
    AVG(Luong) AS LuongTrungBinh
FROM ChuyenGia
GROUP BY 
    CASE 
        WHEN NamKinhNghiem <= 2 THEN 'Junior'
        WHEN NamKinhNghiem <= 5 THEN 'Middle'
        ELSE 'Senior'
    END;
--Cau 15: 
SELECT DA.TenDuAn
FROM DuAn DA
JOIN ChuyenGia_DuAn CGD ON DA.MaDuAn = CGD.MaDuAn
JOIN ChuyenGia CG ON CGD.MaChuyenGia = CG.MaChuyenGia
GROUP BY DA.TenDuAn
HAVING COUNT(DISTINCT CG.ChuyenNganh) = (SELECT COUNT(DISTINCT ChuyenNganh) FROM ChuyenGia);
--Trigger
--Cau 16: 
GO
CREATE TRIGGER trg_UpdateSoDuAn
ON DuAn
AFTER INSERT, DELETE
AS
BEGIN
    UPDATE CongTy
    SET SoDuAnDangThucHien = (
        SELECT COUNT(*)
        FROM DuAn
        WHERE DuAn.MaCongTy = CongTy.MaCongTy AND TrangThai = 'Dang thuc hien'
    )
    WHERE MaCongTy IN (
        SELECT DISTINCT MaCongTy 
        FROM inserted 
        UNION 
        SELECT DISTINCT MaCongTy 
        FROM deleted
    );
END;
GO
--Cau 17:
GO
CREATE TRIGGER trg_LogChuyenGia
ON ChuyenGia
AFTER UPDATE
AS
BEGIN
    INSERT INTO LogChuyenGia (MaChuyenGia, ThoiGian, HanhDong)
    SELECT MaChuyenGia, GETDATE(), 'UPDATED'
    FROM inserted;
END;
GO
--Cau 18: 
GO
CREATE TRIGGER trg_LimitProjects
ON ChuyenGia_DuAn
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE (
            SELECT COUNT(*)
            FROM ChuyenGia_DuAn
            WHERE MaChuyenGia = inserted.MaChuyenGia
        ) >= 5
    )
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 50001, 'Chuyen gia khong the tham gia qua 5 du an.', 1;
    END
    ELSE
    BEGIN
        INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
        SELECT MaChuyenGia, MaDuAn, VaiTro, NgayThamGia
        FROM inserted;
    END
END;
GO
--Cau 19: 
GO
CREATE TRIGGER trg_UpdateProjectStatus
ON ChuyenGia_DuAn
AFTER DELETE
AS
BEGIN
    UPDATE DuAn
    SET TrangThai = 'Hoan thanh'
    WHERE MaDuAn NOT IN (
        SELECT DISTINCT MaDuAn
        FROM ChuyenGia_DuAn
    ) AND MaDuAn IN (
        SELECT DISTINCT MaDuAn
        FROM deleted
    );
END;
GO
--Cau 20: 
GO
CREATE TRIGGER trg_UpdateCompanyScore
ON DuAn
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE CongTy
    SET DiemTrungBinh = (
        SELECT AVG(DiemDanhGia * 1.0)
        FROM DuAn
        WHERE DuAn.MaCongTy = CongTy.MaCongTy
    )
    WHERE MaCongTy IN (
        SELECT DISTINCT MaCongTy 
        FROM inserted
        UNION 
        SELECT DISTINCT MaCongTy 
        FROM deleted
    );
END;
GO
-------------------------END---------------------------
















