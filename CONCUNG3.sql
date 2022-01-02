﻿USE CONCUNG
GO

CREATE TRIGGER TRG_INS_CHITIETDH ON CHITIETDH AFTER INSERT AS
BEGIN
	IF EXISTS (SELECT* FROM SANPHAM, inserted WHERE SANPHAM.MA_SP = inserted.MA_SP AND SOLUONGTON - SO_LUONG < 0)
	BEGIN
		RAISERROR (N'Vượt số lượng hàng có trong kho.', 16, 1)
		ROLLBACK TRAN
	END

	UPDATE SANPHAM
	SET SOLUONGTON = SOLUONGTON - (SELECT SUM(inserted.SO_LUONG) FROM inserted WHERE inserted.MA_SP = SANPHAM.MA_SP GROUP BY inserted.MA_SP)
	FROM inserted
	WHERE SANPHAM.MA_SP = inserted.MA_SP

	DECLARE @THANHTIEN TABLE (THANHTIEN FLOAT, MASP CHAR(15), MADH CHAR(15))
	INSERT @THANHTIEN(MASP, MADH)
	SELECT MA_SP, MA_DH FROM inserted

	UPDATE @THANHTIEN
	SET THANHTIEN = inserted.SO_LUONG * SANPHAM.GIA
	FROM inserted, SANPHAM
	WHERE inserted.MA_SP = SANPHAM.MA_SP AND SANPHAM.MA_SP = MASP

	SELECT*FROM @THANHTIEN

	UPDATE DONHANG
	SET TIENHANG = TIENHANG  + (SELECT SUM(THANHTIEN) FROM @THANHTIEN WHERE DONHANG.MA_DH = MADH)
	FROM inserted, SANPHAM
	WHERE inserted.MA_DH = DONHANG.MA_DH AND SANPHAM.MA_SP = inserted.MA_SP
END
GO

CREATE PROC SUDUNGPGGQT
	@MA_DH char(15),
	@MA_PHIEU char(6)
AS
BEGIN
	UPDATE DONHANG
	SET MA_PHIEU = @MA_PHIEU
	WHERE MA_DH = @MA_DH

	IF (SELECT GIATRI_PHIEU FROM PHIEUGGQT WHERE MA_PHIEU = @MA_PHIEU) < 1
	BEGIN
		UPDATE DONHANG
		SET THANHTIEN = TIENHANG - TIENHANG * (SELECT GIATRI_PHIEU FROM PHIEUGGQT WHERE MA_PHIEU = @MA_PHIEU) 
		WHERE MA_DH = @MA_DH
	END
	ELSE
		BEGIN
		UPDATE DONHANG
		SET THANHTIEN = TIENHANG - (SELECT GIATRI_PHIEU FROM PHIEUGGQT WHERE MA_PHIEU = @MA_PHIEU) 
		WHERE MA_DH = @MA_DH
	END
	
END
GO

CREATE PROC TIM_5_SIEUTHI
	@QUAN NVARCHAR(20)
AS
BEGIN
	SELECT TOP 5 TEN_ST, DIACHI_ST, TGMOCUA
	FROM SIEUTHI
	WHERE DIACHI_ST LIKE '%' + @QUAN
END
GO

CREATE PROC THEM_PHIEU_VAO_GIO
	@SDT CHAR(10),
	@MA_PHIEU CHAR(6)
AS
BEGIN
	UPDATE BOME
	SET MA_PHIEU = @MA_PHIEU
	WHERE SDT = @SDT

	IF (SELECT GIATRI_PHIEU FROM PHIEUGGQT WHERE MA_PHIEU = @MA_PHIEU) < 1
	BEGIN
		UPDATE BOME
		SET THANH_TIEN = TONGTIEN - TONGTIEN * (SELECT GIATRI_PHIEU FROM PHIEUGGQT WHERE MA_PHIEU = @MA_PHIEU) 
		WHERE SDT = @SDT
	END
	ELSE
		BEGIN
		UPDATE BOME
		SET THANH_TIEN = TONGTIEN - (SELECT GIATRI_PHIEU FROM PHIEUGGQT WHERE MA_PHIEU = @MA_PHIEU) 
		WHERE SDT = SDT
	END
END
GO

CREATE PROC GO_PHIEU_KHOI_GIO
	@SDT CHAR(10)
AS
BEGIN
	DECLARE @MA_PHIEU CHAR(6)
	SET @MA_PHIEU = (SELECT MA_PHIEU FROM BOME WHERE SDT = @SDT)
	
	UPDATE BOME
	SET MA_PHIEU = NULL, THANH_TIEN = TONGTIEN
	WHERE SDT = @SDT
END
GO

CREATE TRIGGER TRG_INS_GIOHANG ON GIOHANG AFTER INSERT, UPDATE AS
BEGIN
	IF EXISTS (SELECT* FROM SANPHAM, inserted WHERE SANPHAM.MA_SP = inserted.MA_SP AND SOLUONGTON - SOLUONG < 0)
	BEGIN
		RAISERROR (N'Vượt số lượng hàng có trong kho.', 16, 1)
		ROLLBACK TRAN
	END
	UPDATE GIOHANG
	SET THANH_GIA = GIOHANG.SOLUONG * (SELECT GIA FROM SANPHAM WHERE SANPHAM.MA_SP = inserted.MA_SP)
	FROM inserted
	WHERE inserted.MA_SP = GIOHANG.MA_SP

	UPDATE BOME
	SET TONGTIEN = (SELECT SUM(THANH_GIA) FROM GIOHANG WHERE GIOHANG.SDT = inserted.SDT)
	FROM inserted
	WHERE BOME.SDT = inserted.SDT

	UPDATE BOME
	SET THANH_TIEN = TONGTIEN
	FROM inserted
	WHERE BOME.SDT = inserted.SDT AND MA_PHIEU IS NULL

	UPDATE BOME
	SET THANH_TIEN = TONGTIEN - TONGTIEN * (SELECT GIATRI_PHIEU FROM PHIEUGGQT WHERE MA_PHIEU = BOME.MA_PHIEU) 
	FROM inserted
	WHERE BOME.SDT = inserted.SDT AND BOME.MA_PHIEU IS NOT NULL AND (SELECT GIATRI_PHIEU FROM PHIEUGGQT WHERE MA_PHIEU = BOME.MA_PHIEU) < 1

	UPDATE BOME
	SET THANH_TIEN = TONGTIEN - TONGTIEN * (SELECT GIATRI_PHIEU FROM PHIEUGGQT WHERE MA_PHIEU = BOME.MA_PHIEU) 
	FROM inserted
	WHERE BOME.SDT = inserted.SDT AND BOME.MA_PHIEU IS NOT NULL AND (SELECT GIATRI_PHIEU FROM PHIEUGGQT WHERE MA_PHIEU = BOME.MA_PHIEU) >= 1
END
GO

CREATE TRIGGER TRG_DEL_GIOHANG ON GIOHANG AFTER DELETE AS
BEGIN
	IF NOT EXISTS (SELECT*FROM GIOHANG, deleted WHERE GIOHANG.SDT = deleted.SDT)
	BEGIN
		UPDATE BOME
		SET THANH_TIEN = 0, TONGTIEN = 0
		FROM deleted
		WHERE BOME.SDT = deleted.SDT
	END
END
GO
