------------------II.Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):-----------
-----------------------------------------câu1-----------------------------------------
SELECT * FROM SANPHAM,KHACHHANG
-----------------------------------------câu2-----------------------------------------
SELECT * FROM SANPHAM,KHACHHANG
-----------------------------------------câu3-----------------------------------------
UPDATE SANPHAM SET GIA =GIA/(100/5)+GIA
WHERE NUOCSX = N'Thai Lan'
-----------------------------------------câu4-----------------------------------------
UPDATE SANPHAM SET GIA =GIA/(100/5)+GIA
WHERE NUOCSX = N'Trung Quoc'
-----------------------------------------câu5-----------------------------------------
UPDATE KHACHHANG SET LOAIKH ='VIP' 
WHERE (NGDK<cast('2011/1/1' as date) AND DOANHSO>=10000000) 
OR (NGDK>cast('2011/1/1' as date) AND DOANHSO >=2000000)

------------------------III.Ngôn ngữ truy vấn dữ liệu có cấu trúc:---------------------
-----------------------------------------câu1------------------------------------------
SELECT MASP,TENSP
FROM  SANPHAM
WHERE NUOCSX='Trung Quoc'
-----------------------------------------câu2------------------------------------------
SELECT MASP,TENSP
FROM  SANPHAM
WHERE DVT='cay' OR DVT='quyen'
-----------------------------------------câu3------------------------------------------
SELECT MASP,TENSP
FROM  SANPHAM
WHERE MASP LIKE 'B%01'
-----------------------------------------câu4-----------------------------------------
SELECT MASP,TENSP
FROM  SANPHAM
WHERE NUOCSX='Trung Quoc' AND GIA BETWEEN 30000 AND 40000
-----------------------------------------câu5-----------------------------------------
SELECT MASP,TENSP
FROM  SANPHAM
WHERE (NUOCSX='Trung Quoc' OR NUOCSX='Thai Lan') AND GIA BETWEEN 30000 AND 40000
-----------------------------------------câu6-----------------------------------------
SELECT SOHD,TRIGIA
FROM  HOADON
WHERE NGHD=cast('2007/01/01' as date) OR NGHD=cast('2007/01/02' as date) 
-----------------------------------------câu 7----------------------------------------
SELECT SOHD,TRIGIA
FROM  HOADON
WHERE MONTH(NGHD)=1 AND YEAR(NGHD)=2007
ORDER BY  NGHD ASC,TRIGIA DESC
-----------------------------------------câu 8----------------------------------------
SELECT A.MAKH,HOTEN
FROM  HOADON A, KHACHHANG B
WHERE A.MAKH=B.MAKH AND NGHD=cast('2007/01/01' as date) 
-----------------------------------------câu 9----------------------------------------
SELECT SOHD,TRIGIA
FROM  HOADON A, NHANVIEN B
WHERE A.MANV=B.MANV AND NGHD=cast('2006/10/28' as date)  AND HOTEN='Nguyen Van B' 
-----------------------------------------câu 10---------------------------------------
SELECT C.MASP, TENSP
FROM  HOADON A, KHACHHANG B, CTHD C, SANPHAM D
WHERE A.MAKH=B.MAKH AND A.SOHD=C.SOHD AND C.MASP=D.MASP AND
  MONTH(NGHD)=10 AND YEAR(NGHD)=2006 AND HOTEN='Nguyen Van A'
