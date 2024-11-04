use QLSINHVIEN
go

SELECT Khoa.MaKH as N'Mã khoa', TenKH, MAX(HocBong)
FROM SinhVien JOIN Khoa ON Khoa.MaKH = SinhVien.MaKH
Group by Khoa.MaKH, TenKH
go

SELECT TenMH, MAX(Diem) 
FROM MonHoc JOIN Ketqua ON Ketqua.MaMH = MonHoc.MaMH
GROUP BY TenMH
go

SELECT Ketqua.MaMH, TenMH, COUNT(SinhVien.MaSV)
FROM MonHoc JOIN Ketqua ON Ketqua.MaMH= MonHoc.MaMH
JOIN SinhVien on SinhVien.MaSV = Ketqua.MaSV
GROUP BY Ketqua.MaMH,TenMH
GO

SELECT TOP 1 TenMH, SoTiet, TenSV, Diem
FROM MonHoc JOIN Ketqua on Ketqua.MaMH = MonHoc.MaMH
join SinhVien on SinhVien.MaSV = Ketqua.MaSV
ORDER BY Diem DESC
GO	

SELECT TOP 1
	Khoa.MaKH AS N'Mã Khoa',
	Khoa.TenKH AS N'Tên khoa',
	COUNT(SinhVien.MaSV) AS N'Tổng số sinh viên đang học'
FROM 
	Khoa
JOIN
	SinhVien ON Khoa.MaKH = SinhVien.MaKH
GROUP BY
	Khoa.MaKH, Khoa.TenKH
ORDER BY
	COUNT(SinhVien.MaSV) DESC
GO

-------------------------------------------------------------------------------------------------------
--bai4--

DECLARE @MaKH NVARCHAR(10);
SET @MaKH = 'AV';

SELECT
	SinhVien.MaSV AS N'Mã sinh viên',
	SinhVien.TenSV AS N'Tên sinh viên',
	SinhVien.Phai AS N'Giới tính',
	Khoa.TenKH AS N'Tên khoa'
FROM 
	SinhVien
JOIN 
	Khoa ON SinhVien.MaKH = Khoa.MaKH
WHERE 
	Khoa.MaKH = @MaKH;
GO

DECLARE @Diem FLOAT;
SET @Diem = 5.0;

SELECT
	SinhVien.MaSV AS N'Mã sinh viên',
	SinhVien.TenSV AS N'Tên sinh viên',
	MonHoc.TenMH AS N'Tên môn học',
	Ketqua.Diem AS N'Điểm'
FROM 
	SinhVien
JOIN 
	Ketqua ON SinhVien.MaSV = Ketqua.MaSV
JOIN
	MonHoc ON Ketqua.MaMH = MonHoc.MaMH
WHERE 
	MonHoc.TenMH = N'Cơ sở dữ liệu' and Ketqua.Diem > @Diem
GO

DECLARE @TenMH NVARCHAR(50);
SET @TenMH = N'Cơ sở dữ liệu';

SELECT
	SinhVien.MaSV AS N'Mã sinh viên',
	SinhVien.TenSV AS N'Tên sinh viên',
	Khoa.TenKH AS N'Tên khoa',
	MonHoc.TenMH AS N'Tên môn học',
	Ketqua.Diem AS N'Điểm'
FROM 
	SinhVien
JOIN 
	Ketqua ON SinhVien.MaSV = Ketqua.MaSV
JOIN
	MonHoc ON Ketqua.MaMH = MonHoc.MaMH
JOIN 
	Khoa ON SinhVien.MaKH = Khoa.MaKH
WHERE 
	MonHoc.TenMH = @TenMH
GO

-------------------------------------------------
--Bai 7--

CREATE TABLE [dbo].[DELETETABLE](
	[MaSV] [nvarchar](3) NOT NULL,
	[HoSV] [nvarchar](15) NOT NULL,
	[TenSV] [nvarchar](7) NOT NULL,
	[Phai] [bit] NOT NULL,
	[NgaySinh] [smalldatetime] NOT NULL,
	[NoiSinh] [nvarchar](100) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[HocBong] [float] NULL,
)
GO

INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'A01', N'Nguyễn Thị', N'Vân', 0, CAST(N'1986-02-23T00:00:00' AS SmallDateTime), N'Hà Giang', N'KT', 130000, 5.1800000190734865)
INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'A02', N'Trần Văn', N'Chính', 0, CAST(N'1994-12-20T00:00:00' AS SmallDateTime), N'Bình Định', N'TH', 150000, NULL)
INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'A03', N'Lê Thu Bạch', N'Yến', 1, CAST(N'1993-02-21T00:00:00' AS SmallDateTime), N'Tp. HCM', N'TH', 0, NULL)
INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'A04', N'Trần Anh', N'Tuấn', 0, CAST(N'1987-12-20T00:00:00' AS SmallDateTime), N'Hà Nội', N'AV', 80000, NULL)
INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'A10', N'Trần Thị', N'Mai', 1, CAST(N'1994-10-04T00:00:00' AS SmallDateTime), N'Hà Nội', N'TH', 0, NULL)
INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'A11', N'Nguyễn Thành', N'Nam', 0, CAST(N'2000-01-01T00:00:00' AS SmallDateTime), N'Cà Mau', N'AV', NULL, NULL)
INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'A12', N'Nguyễn Quang', N'Quyền', 0, CAST(N'2001-01-01T00:00:00' AS SmallDateTime), N'Đồng Nai', N'DT', NULL, NULL)
INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'B01', N'Hoàng Thanh', N'Mai', 1, CAST(N'1992-08-12T00:00:00' AS SmallDateTime), N'Hải Phòng', N'TR', 0, NULL)
INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'B02', N'Trần Thị Thu', N'Thủy', 1, CAST(N'1990-01-02T00:00:00' AS SmallDateTime), N'Tp. HCM', N'AV', 80000, NULL)
INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'B03', N'Đố Văn', N'Lâm', 0, CAST(N'1994-02-26T00:00:00' AS SmallDateTime), N'Bình Định', N'TR', 0, NULL)
INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'B04', N'Bùi Kim', N'Dung', 0, CAST(N'1988-10-18T00:00:00' AS SmallDateTime), N'Hµ Néi', N'TH', 170000, NULL)
INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'C01', N'Hà Quang', N'Anh', 0, CAST(N'1985-03-11T00:00:00' AS SmallDateTime), N'Tp. HCM', N'TR', 0, NULL)
INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'C03', N'Lê Quang', N'Lưu', 0, CAST(N'1985-02-23T00:00:00' AS SmallDateTime), N'Hà Nội', N'TH', 0, NULL)
INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'T03', N'Hoàng Thị Hải', N'Yến', 1, CAST(N'1989-09-10T00:00:00' AS SmallDateTime), N'Hà Nội', N'AV', 170000, NULL)
INSERT [dbo].[DELETETABLE] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [TenKH], [HocBong]) VALUES (N'T06', N'Nguyễn Văn', N'Thắng', 0, CAST(N'1988-10-18T00:00:00' AS SmallDateTime), N'Hà Nội', N'AV', 1500000, NULL)
GO

DELETE FROM  [DELETETABLE] WHERE [HocBong] = null;
GO


UPDATE MonHoc
SET SoTiet = 45
WHERE TenMH = N'Tiếng Anh cơ bản';
GO

UPDATE SinhVien
SET TenSV = N'Trần Thanh Kỳ'
WHERE TenSV = N'Trần Thị Mai';
GO

UPDATE SinhVien
SET Phai = 0
WHERE TenSV = N'Trần Thanh Kỳ';
GO

UPDATE SinhVien
SET NgaySinh = '1990-07-05'
WHERE TenSV = N'Trần Thị Thu Thủy';
GO

UPDATE SinhVien
SET HocBong = HocBong + 100000
WHERE MaKH = N'AV';
GO

UPDATE Ketqua
SET Diem = CASE 
				WHEN Diem + 5 > 10 then 10
				ELSE Diem + 5
			END
WHERE MaMH = '02' AND MaSV IN (SELECT MaSV FROM SinhVien WHERE MaMH = 'AV')
GO

UPDATE SinhVien
SET HocBong = CASE 
				WHEN Phai = 1 AND MaKH = N'AV' THEN HocBong + 100000
				WHEN Phai = 0 AND MaKH = N'TH' THEN HocBong + 150000
				ELSE HocBong + 50000
			  END;


UPDATE Ketqua
SET Diem = CASE	
				WHEN MaSV IN (SELECT MaSV FROM SinhVien WHERE MaKH = N'AV') THEN LEAST(Diem + 2, 10)
				WHEN MaSV IN (SELECT MaSV FROM SinhVien WHERE MaKH = N'TH') THEN GREATEST(Diem - 1, 0)
				ELSE Diem
			END
WHERE MaMH = '01';
GO

