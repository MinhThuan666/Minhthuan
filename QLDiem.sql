create table Monhoc(
	MaMon varchar(10) primary key,
	TenMon nvarchar (40),
	SoTC int
)
go
create table Diem(
	MaSV varchar(10)primary key,
	MaMon varchar(10) constraint fk_MaMon references MonHoc(MaMon),
	DiemThi decimal
)
create table SinhVien (
	MaSV varchar(10)primary key constraint fk_MaSV references Diem(MaSV) ,
	HoTen nvarchar (40),
	NgaySinh datetime,
)




insert SinhVien values
('001', 'NGUYEN NAM KHOI', '2002-10-5'),
('002', 'NGUYEN TRUONG VI', '2002-12-1'),
('003', 'LE THANH SANG', '2002-7-5')

insert MonHoc values
('MH1', 'TOAN', '3'),
('MH2', 'LI', '3'),
('MH3', 'HOA', '2')

insert Diem values
('001', 'MH3', '4'),
('002', 'MH1', '7.5'),
('003', 'MH2', '6'),
('004', 'MH2', '8.5'),
('005', 'MH1', '2')


SELECT *  
FROM Diem;

SELECT   MaSV, MaMon, DiemThi 
FROM     Diem
ORDER BY DiemThi DESC ;

SELECT MaSV, MaMon, DiemThi
FROM   Diem
WHERE  DiemThi BETWEEN 8 AND 9 ;


-------------------------------------câu 2------------------------------------
go
create function tkSV (@tmh nvarchar(20))
returns int
as
begin
 declare @dem int
 set @dem = (select count(*)
 from Diem
where @dem<5)
 return @dem
end
go
select dbo.tkSV ('LSDCSVN')
-------------------------------------CÂU 3--------------------------------------------
CREATE PROCEDURE NhapDiem (@MaSV varchar(10), @MaMon varchar(10), @DiemThi decimal)
AS
BEGIN
	INSERT INTO DIEM (MASV, MAMON, DIEMTHI)
	VALUES (@MaSV, @MaMon, @DiemThi)
END
----------------------------------------CÂU 4------------------------------------------
create trigger Them_Sua
on Diem
FOR  INSERT, UPDATE
AS
if(select DiemThi From inserted)>10 and (select DiemThi From inserted)<0
begin
print
'khong cho phep'
rollback transaction
end
insert into Diem
values ('001','MH3','2')