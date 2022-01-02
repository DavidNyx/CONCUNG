﻿use CONCUNG
GO

CREATE PROC XEMSP_LOAI
	@MALOAI CHAR(6)
AS
BEGIN
	SELECT * FROM SANPHAM SP
	WHERE SP.MA_LOAI = @MALOAI
END
GO

CREATE PROC XEMSP_LOAI_HANG
	@MALOAI CHAR(6),
	@MATH CHAR(6)
AS
BEGIN
	SELECT * FROM SANPHAM SP
	WHERE SP.MA_LOAI = @MALOAI AND SP.MA_TH = @MATH
END
GO

CREATE PROC XEMLOAI_CHA
AS
BEGIN
	SELECT TEN_LOAI FROM LOAISP
	WHERE LOAISP_CHA = NULL
END
GO

CREATE PROC XEMLOAI
	@MALOAI CHAR(6)
AS
BEGIN
	SELECT TEN_LOAI FROM LOAISP
	WHERE LOAISP_CHA = @MALOAI
END
GO

CREATE PROC XEMSPTHEOGIA_TANG_LOAI
	@MALOAI CHAR(6)
AS
BEGIN
	SELECT * FROM SANPHAM
	WHERE MA_LOAI = @MALOAI
	ORDER BY GIA ASC
END
GO

CREATE PROC XEMSPTHEOGIA_GIAM_LOAI
	@MALOAI CHAR(6)
AS
BEGIN
	SELECT * FROM SANPHAM
	WHERE MA_LOAI = @MALOAI
	ORDER BY GIA DESC
END
GO

CREATE PROC XEMSPTHEOGIA_TANG_LOAI_TH
	@MALOAI CHAR(6),
	@MATH CHAR(6)
AS
BEGIN
	SELECT * FROM SANPHAM
	WHERE MA_LOAI = @MALOAI AND MA_TH = @MATH
	ORDER BY GIA ASC
END
GO

CREATE PROC XEMSPTHEOGIA_GIAM_LOAI_TH
	@MALOAI CHAR(6),
	@MATH CHAR(6)
AS
BEGIN
	SELECT * FROM SANPHAM
	WHERE MA_LOAI = @MALOAI AND MA_TH = @MATH
	ORDER BY GIA DESC
END
GO

CREATE PROC THANHTOAN
	@MADH CHAR(10),
	@SDT CHAR(10)
AS
BEGIN
	INSERT DONHANG (MA_DH, SDT, TINHTRANG, TIENHANG, THANHTIEN, NGAYLAP)
	VALUES (@MADH, @SDT, N'Đang xác nhận', 0, 0, GETDATE())

	SELECT MA_SP, SOLUONG, THANH_GIA
	INTO #TEMP
	FROM GIOHANG
	WHERE SDT = @SDT

	SELECT MA_DH, MA_SP, SOLUONG, THANH_GIA INTO #TEMP2
	FROM #TEMP, DONHANG
	WHERE MA_DH = @MADH

	INSERT CHITIETDH(MA_DH, MA_SP, SO_LUONG, THANHGIA)
	SELECT MA_DH, MA_SP, SOLUONG, THANH_GIA FROM #TEMP2

	UPDATE DONHANG
	SET TIENHANG = (SELECT TONGTIEN FROM BOME WHERE SDT = @SDT)
	, THANHTIEN = (SELECT THANH_TIEN FROM BOME WHERE SDT = @SDT)
	, MA_PHIEU = (SELECT MA_PHIEU FROM BOME WHERE SDT = @SDT)
	WHERE MA_DH = @MADH

	DELETE GIOHANG
	WHERE SDT = @SDT

	UPDATE BOME
	SET MA_PHIEU = NULL
	, THANH_TIEN = 0
	, TONGTIEN = 0
	WHERE SDT = @SDT

END
GO

CREATE PROC XOASP
	@MA_SP CHAR(6)
AS
BEGIN
	DELETE CHITIETDH WHERE MA_SP = @MA_SP
	DELETE KHO WHERE MA_SP = @MA_SP
	DELETE SANPHAM WHERE MA_SP = @MA_SP
END
GO

CREATE PROC THEMSP
	@MA_SP CHAR(6),
	@TEN_SP NVARCHAR(250),
	@MIEUTA NVARCHAR(MAX),
	@MA_LOAI CHAR(6),
	@MA_TH CHAR(6),
	@COMBO BIT,
	@MA_KM CHAR(10),
	@GIA FLOAT,
	@IMAGE VARCHAR(50)
AS
BEGIN
	INSERT SANPHAM (MA_SP,TEN_SP,MIEUTA,MA_LOAI,MA_TH,COMBO,MA_KM,GIA,SOLUONGTON,IMAGE)
	VALUES (@MA_SP,@TEN_SP,@MIEUTA,@MA_LOAI,@MA_TH,@COMBO,@MA_KM,@GIA, 0, @IMAGE)
END
GO

CREATE PROC CAPNHATGIA
	@MA_SP CHAR(6),
	@GIA FLOAT
AS
BEGIN
	UPDATE SANPHAM
	SET GIA = @GIA
	WHERE MA_SP = @MA_SP
END
GO

CREATE PROC DOANHTHU_THANG
	@THANG INT,
	@NAM INT
AS
BEGIN
	SELECT SUM(THANHTIEN)
	FROM DONHANG
	WHERE MONTH(NGAYLAP) = @THANG AND YEAR(NGAYLAP) = @NAM
END
GO

CREATE PROC DOANHTHU_NAM
	@NAM INT
AS
BEGIN
	SELECT SUM(THANHTIEN)
	FROM DONHANG
	WHERE YEAR(NGAYLAP) = @NAM
END
GO

CREATE PROC KIEMTRA_SP_CO_HANG
	@MA_SP CHAR(10)
AS
BEGIN
	SELECT TEN_ST
	FROM SIEUTHI,KHO
	WHERE KHO.MA_SP = @MA_SP AND KHO.MA_ST = SIEUTHI.MA_ST
END
GO

CREATE PROC THEM_KHUYENMAI
	@MA_PHIEU CHAR(6),
	@TEN_PHIEU NVARCHAR(50),
	@GIATRI_PHIEU FLOAT
AS
BEGIN
	INSERT PHIEUGGQT(MA_PHIEU, TEN_PHIEU, GIATRI_PHIEU)
	VALUES (@MA_PHIEU, @TEN_PHIEU, @GIATRI_PHIEU)
END
GO

CREATE PROC CHECKIN
	@SDT CHAR(10)
AS
BEGIN
	INSERT DIEM_DANH(SDT, NGAYDD)
	VALUES (@SDT, GETDATE())
END
GO

CREATE PROC CHECK_LUONG
	@SDT CHAR(10),
	@THANG INT
AS
BEGIN
	DECLARE @SOLANDD AS INT
	SET @SOLANDD = (SELECT COUNT(NGAYDD) FROM DIEM_DANH WHERE SDT = @SDT AND MONTH(NGAYDD) = @THANG)

	SELECT LUONG_NGAY * @SOLANDD
	FROM NHANVIEN
	WHERE SDT = @SDT
END
GO

CREATE PROC XEMDH_DANG_GIAO
	@SDT CHAR(10)
AS
BEGIN
	SELECT * FROM DONHANG
	WHERE SDT = @SDT AND TINHTRANG = N'Đang giao'
END
GO

CREATE PROC XEMDH_HOANTHANH
	@SDT CHAR(10)
AS
BEGIN
	SELECT * FROM DONHANG
	WHERE SDT = @SDT AND TINHTRANG = N'Hoàn thành'
END
GO

CREATE PROC XEMDH_NHANVIEN
AS
BEGIN
	SELECT * FROM DONHANG
	WHERE NHANVIEN = NULL
END
GO

CREATE PROC CHONDH_NHANVIEN
	@MADH CHAR(10),
	@MANV CHAR(10)
AS
BEGIN
	UPDATE DONHANG
	SET NHANVIEN = @MANV
	WHERE MA_DH = @MADH
END
GO

CREATE PROC CAPNHATDON
	@MADH CHAR(10)
AS
BEGIN
	UPDATE DONHANG
	SET TINHTRANG = N'Hoàn thành'
	WHERE MA_DH = @MADH
END
GO

CREATE PROC NHAPTHEMSP
	@PHIEUNHAP CHAR(6),
	@MASP CHAR(10),
	@QUANLY CHAR(10),
	@SOLUONG INT
AS
BEGIN
	INSERT NHAPHANG(PHIEUNHAP, MA_SP, QUANLY, SOLUONG, NGAYNHAP)
	VALUES (@PHIEUNHAP, @MASP, @QUANLY, @SOLUONG, GETDATE())

	UPDATE SANPHAM
	SET SOLUONGTON = SOLUONGTON + @SOLUONG
	WHERE MA_SP = @MASP
END
GO

CREATE PROC XEMLICHSUNHAP_THANG
	@THANG INT,
	@NAM INT
AS
BEGIN
	SELECT * FROM NHAPHANG
	WHERE MONTH(NGAYNHAP) = @THANG AND YEAR(NGAYNHAP) = @NAM
END
GO

CREATE PROC XEMLICHSUNHAP_NAM
	@NAM INT
AS
BEGIN
	SELECT * FROM NHAPHANG
	WHERE YEAR(NGAYNHAP) = @NAM
END
GO

CREATE PROC XEMLICHSUNHAP
	@NAM INT
AS
BEGIN
	SELECT * FROM NHAPHANG
END
GO



