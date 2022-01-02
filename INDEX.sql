﻿use CONCUNG_INDEX_PARTITION
GO

CREATE NONCLUSTERED INDEX INDEX_MALOAI
ON SANPHAM(MA_LOAI)
GO

CREATE NONCLUSTERED INDEX INDEX_MATH
ON SANPHAM(MA_TH)
GO

CREATE NONCLUSTERED INDEX INDEX_LOAISP_CHA
ON LOAISP(LOAISP_CHA)
GO

CREATE NONCLUSTERED INDEX INDEX_GIA
ON SANPHAM(GIA)
GO

CREATE NONCLUSTERED INDEX INDEX_NGAYLAP
ON DONHANG(NGAYLAP)
GO

CREATE NONCLUSTERED INDEX INDEX_DIACHI
ON SIEUTHI(DIACHI_ST)
GO

CREATE NONCLUSTERED INDEX INDEX_NHANVIEN
ON DONHANG(NHANVIEN)
GO

CREATE NONCLUSTERED INDEX INDEX_NGAYNHAP
ON NHAPHANG(NGAYNHAP)
GO

CREATE NONCLUSTERED INDEX INDEX_NGAYDD
ON DIEM_DANH(NGAYDD)
GO

CREATE NONCLUSTERED INDEX INDEX_NHANVIEN_TINHTRANG
ON DONHANG(NHANVIEN,TINHTRANG)
GO


CREATE NONCLUSTERED INDEX INDEX_SIEUTHI_DIACHI
ON DONHANG(NHANVIEN,TINHTRANG)
GO