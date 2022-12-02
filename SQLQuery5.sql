----------------------------1a----------------------------
create trigger them_nv on nhanvien for insert as
if (select luong from inserted) < 15000
begin
	print N'Tien luong toi thieu phai hon 15000'
	rollback transaction
end
----------------------------1b----------------------------
create trigger checktuoi_them_nv ON nhanvien for insert as 
declare @tuoi int
set @tuoi=year(getdate()) - (select year(NGSINH) from inserted)
	if (@tuoi < 18 or @tuoi > 65 )
		begin
	print N'Yêu cầu nhập tuổi từ 18 đến 65'
		rollback transaction 
end
----------------------------1c----------------------------
create trigger update_NV on NHANVIEN for update as
IF (SELECT DCHI FROM inserted ) like '%TP HCM%'
begin
print N'Không thể cập nhật'
rollback transaction
end
----------------------------2a----------------------------
CREATE TRIGGER checktong_NVnamnu ON NHANVIEN AFTER INSERT AS
BEGIN
	DECLARE @tong_nam INT, @tong_nu INT;
SET @tong_nam = (SELECT PHAI FROM NHANVIEN WHERE PHAI LIKE N'NAM')
SET @tong_nu = (SELECT PHAI FROM NHANVIEN WHERE PHAI LIKE N'NỮ');
SELECT @tong_nam = COUNT(*) FROM inserted
SELECT @tong_nu = COUNT(*) FROM inserted
PRINT N'TONG NHAN VIEN NAM' + @tong_nam
PRINT N'TONG NHAN VIEN NU' + @tong_nu
END
----------------------------2b----------------------------
CREATE TRIGGER checktongUpdate_nvphai ON NHANVIEN AFTER UPDATE AS
BEGIN
DECLARE @tong_nam INT, @tong_nu INT;
SET @tong_nam = (SELECT PHAI FROM NHANVIEN WHERE PHAI LIKE N'NAM')
SET @tong_nu = (SELECT PHAI FROM NHANVIEN WHERE PHAI LIKE N'NỮ');
SELECT @tong_nam = COUNT(*) FROM inserted
SELECT @tong_nu = COUNT(*) FROM inserted
PRINT N'TONG NHAN VIEN NAM' + @tong_nam
PRINT N'TONG NHAN VIEN NU' +@tong_nu
END
----------------------------2c----------------------------
CREATE TRIGGER checksldean_NV ON DEAN AFTER DELETE AS
BEGIN
DECLARE @sldean INT;
SET @sldean = (SELECT COUNT(*) FROM DEAN, NHANVIEN WHERE DEAN.PHONG = NHANVIEN.PHG)
SELECT @sldean = COUNT(*) FROM deleted
PRINT N'TONG SO LUONG DE AN MA NHAN VIEN DA LAM' + @sldean
END
----------------------------3a----------------------------
CREATE TRIGGER xoaTN_nv ON NHANVIEN INSTEAD OF DELETE AS
BEGIN
DELETE FROM THANNHAN WHERE MA_NVIEN IN (SELECT MANV FROM deleted)
DELETE FROM NHANVIEN WHERE MANV IN (SELECT MANV FROM deleted)
END
----------------------------3c----------------------------
CREATE TRIGGER them_nvphancong ON NHANVIEN INSTEAD OF INSERT AS
BEGIN
	INSERT INTO PHANCONG
	VALUES ((SELECT MANV FROM inserted),1,1,100)
END
INSERT INTO NHANVIEN
VALUES ('Tran', 'Van', 'Toan', '026', '1980-12-12', 'Da Nang', N'Nữ', 16000, '004', 1)