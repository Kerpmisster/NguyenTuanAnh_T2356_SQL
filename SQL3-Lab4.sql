USE [QLSINHVIEN]
GO

Select MaSV as 'Ma Sinh Vien', HoSV as [Ho Sinh Vien], TenSV as [Ten Sinh Vien], HocBong as [Hoc Bong]
FROM SinhVien
Order by MaSV ASC
GO


Select MaSV,TenSV,Phai,NgaySinh
FROM SinhVien
Order by TenSV ASC


Select HoSV + ' ' + TenSV as [Ho Ten Sinh Vien], NgaySinh as [Ngay Sinh], HocBong as [Hoc Bong]
FROM SinhVien
Order by NgaySinh ASC, 3 DESC


Select MaMH,  TenMH, SoTiet
FROM MonHoc
Where TenMH Like N'T%'
GO


Select [HoSV],[TenSV],[Phai],[NgaySinh]
FROM SinhVien 
Where TenSV Like N'%i'
GO


Select MaKH, TenKH
FROM Khoa
Where TenKH Like N'_N%'
GO


Select MaSV, HoSV, TenSV, Phai, HocBong
FROM SinhVien 
Where TenSV Like N'[a-m]%'
GO


Select MaSV, HoSV + ' '+ TenSV as [Ten Sinh Vien], NgaySinh, NoiSinh, HocBong
FROM SinhVien 
Where TenSV Like N'%[a-m]%'
Order by 2 ASC
GO

Select MaSV, HoSV + ' '+ TenSV as [Ten Sinh Vien], NgaySinh, MaKH
FROM SinhVien 
WHERE MaKH = 'AV'
GO

Select MaSV, HoSV + ' '+ TenSV as [Ten Sinh Vien], CONVERT(char(10), NgaySinh, 103) as NgaySinh, MaKH
FROM SinhVien 
WHERE MaKH = 'TH'
ORDER BY NgaySinh DESC
GO

SELECT MaSV, HoSV, TenSV, MaKH, HocBong
FROM SinhVien
WHERE HocBong > 500000
ORDER BY MaKH DESC
GO

/*
14. Liệt kê danh sách sinh viên sinh vào ngày 20/12/1987, gồm các thông tin: Họ
tên sinh viên, Mã khoa, Học bổng.
*/
Select HoSV+ ' ' + TenSV as [Họ tên sinh viên], MaKH, HocBong
        , Convert(Char(10),NgaySinh,103) as [Ngày sinh]
From SinhVien
Where Convert(Char(10),NgaySinh,103) = '20/12/1987'
GO
Select HoSV+ ' ' + TenSV as [Họ tên sinh viên], MaKH, HocBong
        , Convert(Char(10),NgaySinh,103) as [Ngày sinh]
From SinhVien
Where Day(ngaysinh) = 20 and Month(Ngaysinh)=12 and Year(NgaySinh)=1987
GO

/*
15. Cho biết các sinh viên sinh sau ngày 20/12/1977, gồm các thông tin: Họ tên sinh
viên, Ngày sinh, Nơi sinh, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự
ngày sinh giảm dần.
*/
Select HoSV+ ' ' + TenSV as [Họ tên sinh viên], MaKH, HocBong
        , Convert(Char(10),NgaySinh,103) as [Ngày sinh]
From SinhVien
Where Convert(Char(10),NgaySinh,103) > '20/12/1987'
Order by NgaySinh DESC
GO

/*
16. Liệt kê các sinh viên có học bổng lớn hơn 100,000 và sinh ở Tp HCM, gồm các
thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
*/
Select *
From SinhVien
Where HocBong > 100000 and NoiSinh Like N'%Tp. HCM%'
GO
/*
17. Danh sách các sinh viên của khoa Anh văn và khoa Triết, gồm các thông tin: Mã
sinh viên, Mã khoa, Phái.
*/
Select *
From SinhVien
Where  MaKH = 'AV' Or MaKH = 'TR'
GO
Select *
From SinhVien
Where  MaKH IN ('AV','TR')
GO

SELECT MaSV, Convert(Char(10),NgaySinh,105) as [Ngày sinh], NoiSinh, HocBong
FROM SinhVien 
WHERE 
NgaySinh <= '05/06/1992'
and 
NgaySinh >= '01/01/1986' 
GO

SELECT MaSV, Convert(Char(10),NgaySinh,105) as [Ngày sinh], Phai, HocBong
FROM SinhVien 
WHERE HocBong between 200000 and 800000
GO

SELECT MaMH,TenMH,SoTiet
FROM MonHoc
WHERE Sotiet between 40 and 60
GO

SELECT MaSV, HoSV AS N'HỌ', TenSV AS N'TÊN', Phai =
	CASE 
	WHEN Phai = 1 then N'Nữ'
	WHEN Phai = 0 then N'Nam'
	END
FROM SinhVien 
WHERE Phai = 0 and MaKH ='AV'
GO

SELECT HoSV AS N'HỌ', TenSV AS N'TÊN', NoiSinh, Convert(Char(10),NgaySinh,105) as [Ngày sinh]
FROM SinhVien
WHERE NoiSinh LIKE N'Hà Nội' and NgaySinh > '01/01/1990'
GO

SELECT HoSV AS N'HỌ', TenSV AS N'TÊN', NoiSinh, Phai =
	CASE 
	WHEN Phai = 1 then N'Nữ'
	WHEN Phai = 0 then N'Nam'
	END 
FROM SinhVien
WHERE Phai = 1 AND TenSV LIKE '%N%';

SELECT HoSV AS N'HỌ', TenSV AS N'TÊN', NoiSinh, Convert(Char(10),NgaySinh,103) as [Ngày sinh], Phai =
	CASE 
	WHEN Phai = 1 then N'Nữ'
	WHEN Phai = 0 then N'Nam'
	END 
FROM SinhVien
WHERE Phai = 0 AND MaKH = 'TH' AND NgaySinh > '1986-05-30'
GO

SELECT HoSV AS N'HỌ', TenSV AS N'TÊN', NoiSinh, Convert(Char(10),NgaySinh,103) as [Ngày sinh], [GIOI TINH]=
	CASE 
	WHEN Phai = 1 then N'Nữ'
	WHEN Phai = 0 then N'Nam'
	END 
FROM SinhVien
GO

SELECT MaSV, HoSV AS N'HỌ', TenSV AS N'TÊN', [Tuổi]=YEAR(GETDATE())-YEAR(NgaySinh), NoiSinh, TenKH
FROM SinhVien JOIN Khoa ON KHOA.MaKH=SinhVien.MaKH
GO

SELECT MaSV, HoSV AS N'HỌ', TenSV AS N'TÊN', [Tuổi]=YEAR(GETDATE())-YEAR(NgaySinh), HocBong
FROM SinhVien 
WHERE YEAR(GETDATE())-YEAR(NgaySinh) > 30
GO

SELECT MaSV, HoSV AS N'HỌ', TenSV AS N'TÊN', [Tuổi]=YEAR(GETDATE())-YEAR(NgaySinh), TenKH
FROM SinhVien JOIN Khoa ON KHOA.MaKH=SinhVien.MaKH 
WHERE YEAR(GETDATE())-YEAR(NgaySinh) between 20 and 30
GO

/*1. Liệt kê danh sách sinh viên gồm các thông tin sau: Họ và tên sinh viên, 
Giới tính,Tuổi, Mã khoa. Trong đó Giới tính hiển thị ở 
dạng Nam/Nữ tuỳ theo giá trị củafield Phai là True hay False, 
Tuổi sẽ được tính bằng cách lấy năm hiện hành trừ cho năm sinh. 
Danh sách sẽ được sắp xếp theo thứ tự Tuổi giảm dần*/

SELECT HoSV as'Họ' ,TenSV as'Tên',
          [Giới tính] =CASE
		                       WHEN Phai =1 THEN N'Nữ'
							   WHEN Phai =0 THEN N'Nam'
							END,
[Tuổi]= YEAR(GETDATE())-YEAR(NgaySinh)
From SinhVien
ORDER by YEAR(GETDATE())-YEAR(NgaySinh) DESC
go

/*2. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên,
Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên
tăng dần.*/

SELECT HoSV AS 'Họ', TenSV AS'Tên',
[Phải]= CASE WHEN phai =1 THEN N'Nữ'
            WHEN phai =0 THEN N'Nam'
			END,
DAY(NgaySinh)
FROM dbo.SinhVien
WHERE MONTH(NgaySinh)=2 AND YEAR(NgaySinh)=1994
GO

/*3. Danh sách các sinh viên, gồm các thông tin sau: Mã sinh viên, Tên sinh viên,
Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự của tên.*/

SELECT * FROM dbo.SinhVien
ORDER BY NgaySinh DESC
GO

/*4. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông tin
sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.*/
SELECT MaSV AS 'Mã sinh viên',Phai AS 'Phái',MaKH AS 'Mã khoa',
[Mức học bổng]=CASE WHEN HocBong >500000 THEN N'Học bổng cao'
                    ELSE N'Mức trung bình'
				END
FROM dbo.SinhVien
GO

/*5. Cho biết điểm thi của các sinh viên, gồm các thông tin: Họ tên sinh viên, Mã
môn học, Điểm. Kết quả sẽ được sắp theo thứ tự Họ tên sinh viên và mã môn
học tăng dần*/

SELECT HoSV AS 'Họ', TenSV AS 'Tên',
MonHoc.MaMH AS 'Mã môn học', Diem AS 'Điểm'
FROM dbo.SinhVien JOIN dbo.Ketqua ON Ketqua.MaSV = SinhVien.MaSV JOIN
dbo.MonHoc ON MonHoc.MaMH = Ketqua.MaMH
ORDER BY Họ , Tên , MonHoc.MaMH
GO

/*6. Danh sách sinh viên của khoa Anh văn, điều kiện lọc phải sử dụng tên khoa, gồm
các thông tin sau: Họ tên sinh viên, Giới tính, Tên khoa. Trong đó, Giới tính sẽ
hiển thị dạng Nam/Nữ*/

SELECT HoSV AS' Họ', TenSV AS 'Tên',
[Giới tính] = CASE
                    WHEN Phai =1 THEN N'Nữ'
					WHEN Phai =0 THEN N'Nam'
				END
,TenKH AS 'Tên khoa'
FROM dbo.SinhVien JOIN dbo.Khoa ON Khoa.MaKH = SinhVien.MaKH
WHERE Khoa.MaKH = 'AV'
GO
/*7. Liệt kê bảng điểm của sinh viên khoa Tin Học, gồm các thông tin:Tên khoa, Họ
tên sinh viên, Tên môn học, Số tiết, Điểm*/

SELECT TenKH AS 'Tên khoa', HoSV AS 'Họ',
TenSV AS 'Tên',
TenMH AS 'Tên môn học',
Sotiet AS 'Số tiết',
Diem AS 'Điểm'
FROM dbo.SinhVien JOIN dbo.Khoa ON Khoa.MaKH = SinhVien.MaKH JOIN dbo.Ketqua ON
Ketqua.MaSV = SinhVien.MaSV JOIN dbo.MonHoc ON MonHoc.MaMH = Ketqua.MaMH
WHERE Khoa.MaKH='TH'
GO

/*8. Kết quả học tập của sinh viên, gồm các thông tin: Họ tên sinh viên, Mã khoa,
Tên môn học, Điểm thi, Loại. Trong đó, Loại sẽ là Giỏi nếu điểm thi > 8, từ 6 đến
8 thì Loại là Khá, nhỏ hơn 6 thì loại là Trung Bình*/

SELECT
HoSV AS 'Họ',
TenSV AS 'Tên',
MaKH AS 'Mã khoa',
TenMH AS 'Tên môn học',
Diem AS 'Điểm',
[Loại]= CASE WHEN Diem >8 THEN N'Giỏi'
                 WHEN Diem BETWEEN 6 AND 8 THEN N'Khá'
				 WHEN Diem <6 THEN N'Trung bình'
				 END
FROM dbo.SinhVien JOIN dbo.Ketqua ON Ketqua.MaSV = SinhVien.MaSV
JOIN dbo.Monhoc ON MonHoc.MaMH = Ketqua.MaMH
GO

SELECT MonHoc.MaMH as N'Mã môn',
TenMH as N'Tên môn',
AVG(Diem) as N'Trung bình điểm thi'
FROM dbo.SinhVien JOIN dbo.Ketqua ON Ketqua.MaSV = SinhVien.MaSV JOIN dbo.MonHoc ON
MonHoc.MaMH = Ketqua.MaMH
GROUP BY MonHoc.MaMH,TenMH,DiemTrungBinh
GO

SELECT HoSV AS N'HỌ', TenSV AS N'TÊN',TenKH,[Tong Mon Thi] = COUNT(Ketqua.MaMH)
FROM SinhVien JOIN Ketqua ON Ketqua.MaSV = SinhVien.MaSV join MonHoc 
on MonHoc.MaMH = Ketqua.MaMH JOIN Khoa on Khoa.MaKH = SinhVien.MaKH
GROUP BY HoSV, TenSV, TenKH
GO

SELECT TenKH as 'Ten khoa',[TỔNG SỐ SINH  VIÊN] = COUNT(MaSV)
From Khoa join	SinhVien on SinhVien.MaKH = Khoa.MaKH 
Group by TenKH
GO

SELECT HoSV, TenSV, [Diem] = MAX(Diem)
FROM SinhVien join Ketqua on Ketqua.MaSV = SinhVien.MaSV
GROUP BY HoSV,TenSV
GO

SELECT TenMH, SoTiet
FROM MonHoc
WHERE SoTiet = (SELECT MAX(Sotiet) FROM MonHoc)
GO

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