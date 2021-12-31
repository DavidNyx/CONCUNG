USE CONCUNG
GO

CREATE TRIGGER TRG_INS_CHITIETDH ON CHITIETDH AFTER INSERT AS
BEGIN
	IF EXISTS (SELECT* FROM SANPHAM, inserted WHERE SANPHAM.MA_SP = inserted.MA_SP AND SOLUONGTON - SO_LUONG < 0)
		ROLLBACK TRAN

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

DROP TRIGGER TRG_INS_CHITIETDH

