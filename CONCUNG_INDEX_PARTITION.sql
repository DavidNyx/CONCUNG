CREATE DATABASE CONCUNG_INDEX_PARTITION
GO

USE CONCUNG_INDEX_PARTITION
GO

CREATE PARTITION FUNCTION GIATIEN_FUNC(FLOAT)
AS RANGE LEFT FOR VALUES (200000,500000)
GO

ALTER DATABASE CONCUNG_INDEX_PARTITION
ADD FILEGROUP FG1
GO

ALTER DATABASE CONCUNG_INDEX_PARTITION
ADD FILEGROUP FG2
GO

ALTER DATABASE CONCUNG_INDEX_PARTITION
ADD FILEGROUP FG3
GO

ALTER DATABASE CONCUNG_INDEX_PARTITION
ADD FILE
(
  NAME = 'GiatienF1',
  FILENAME = 'C:\Users\hieue\Desktop\DATA\GiatienF1.ndf'
) TO FILEGROUP FG1
GO

ALTER DATABASE CONCUNG_INDEX_PARTITION
ADD FILE
(
  NAME = 'GiatienF2',
  FILENAME = 'C:\Users\hieue\Desktop\DATA\GiatienF2.ndf'
) TO FILEGROUP FG2
GO

ALTER DATABASE CONCUNG_INDEX_PARTITION
ADD FILE
(
  NAME = 'GiatienF3',
  FILENAME = 'C:\Users\hieue\Desktop\DATA\GiatienF3.ndf'
) TO FILEGROUP FG3
GO

CREATE PARTITION SCHEME GIATIEN_SCHEME
AS PARTITION GIATIEN_FUNC TO (FG1, FG2, FG3)
GO

CREATE TABLE NHANVIEN
(
	SDT CHAR(10),
	MATKHAU VARCHAR(50),
	TEN NVARCHAR(50),
	LUONG_NGAY FLOAT,
	CONSTRAINT PK_NV PRIMARY KEY(SDT)
)
GO

CREATE TABLE DIEM_DANH
(
	SDT CHAR(10),
	NGAYDD DATE,
	CONSTRAINT PK_DD PRIMARY KEY(SDT, NGAYDD)
)
GO

CREATE TABLE QUANLY
(
	SDT CHAR(10),
	MATKHAU VARCHAR(50),
	CONSTRAINT PK_QL PRIMARY KEY (SDT)
)
GO

CREATE TABLE BOME
(
	SDT CHAR(10) NOT NULL,
	HOTEN_BM NVARCHAR(30) NOT NULL,
	EMAIL VARCHAR(50),
	PHAI_BM NVARCHAR(3) NOT NULL,
	NGAYSINH_BM DATE NOT NULL,
	MATKHAU VARCHAR(30) NOT NULL,
	DIACHI_BM NVARCHAR(100) NOT NULL,
	MA_PHIEU CHAR(6),
	TONGTIEN FLOAT,
	THANH_TIEN FLOAT,
	CONSTRAINT PK_BM PRIMARY KEY(SDT),
	CONSTRAINT C_PHAI_BM CHECK (PHAI_BM in (N'Nam', N'Nữ'))
)
GO

CREATE TABLE CON
(
	SDT CHAR(10) NOT NULL,
	STT INT NOT NULL,
	HOTEN_CON NVARCHAR(30) NOT NULL,
	PHAI_CON NVARCHAR(3) NOT NULL,
	NGAYSINH_CON DATE NOT NULL,
	CONSTRAINT PK_CON PRIMARY KEY(SDT, STT),
	CONSTRAINT C_PHAI_CON CHECK (PHAI_CON in (N'Nam', N'Nữ'))
)
GO

CREATE TABLE DIACHINHANHANG
(
	SDT CHAR(10) NOT NULL,
	STT INT NOT NULL,
	HOTEN_NHAN NVARCHAR(30) NOT NULL,
	SDT_NHAN CHAR(10) NOT NULL,
	DIACHI_NHAN NVARCHAR(100) NOT NULL,
	DIACHI_MACDINH BIT NOT NULL,
	DIACHI_CONGTY BIT NOT NULL,
	CONSTRAINT PK_DCNH PRIMARY KEY(SDT, STT)
)
GO

CREATE TABLE THUONGHIEU
(
	MA_TH CHAR(6) NOT NULL,
	TEN_TH NVARCHAR(30) NOT NULL,
	XUATXU_TH NVARCHAR(30),
	CONSTRAINT PK_TH PRIMARY KEY(MA_TH)
)
GO

CREATE TABLE LOAISP
(
	MA_LOAI CHAR(6) NOT NULL,
	TEN_LOAI NVARCHAR(30) NOT NULL,
	LOAISP_CHA CHAR(6),
	CONSTRAINT PK_LOAISP PRIMARY KEY(MA_LOAI)
)
GO

CREATE TABLE CHITIETLOAI
(
	MA_TH CHAR(6) NOT NULL,
	MA_LOAI CHAR(6) NOT NULL,
	CONSTRAINT PK_CTL PRIMARY KEY(MA_TH, MA_LOAI)
)
GO

CREATE TABLE SANPHAM
(
	MA_SP CHAR(10) NOT NULL,
	TEN_SP NVARCHAR(250) NOT NULL,
	MIEUTA NVARCHAR(MAX),
	MA_LOAI CHAR(6),
	MA_TH CHAR(6),
	COMBO BIT NOT NULL,
	MA_KM CHAR(10),
	GIA FLOAT,
	SOLUONGTON INT NOT NULL,
	IMAGE VARCHAR(50) NULL,
	CONSTRAINT PK_SP PRIMARY KEY NONCLUSTERED (MA_SP) ON [Primary]

) ON GIATIEN_SCHEME(GIA)
GO

CREATE TABLE CHITIETSP
(
	MA_SP CHAR(10) NOT NULL,
	STT INT NOT NULL,
	TEN_CT NVARCHAR(50) NOT NULL,
	THONGTIN_CT NVARCHAR(MAX),
	CONSTRAINT PK_CTSP PRIMARY KEY(MA_SP, STT)
)
GO

CREATE TABLE PHIEUGGQT
(
	MA_PHIEU CHAR(6) NOT NULL,
	TEN_PHIEU NVARCHAR(50) NOT NULL,
	GIATRI_PHIEU FLOAT NOT NULL,
	CONSTRAINT PK_PHIEU PRIMARY KEY(MA_PHIEU)
)
GO

CREATE TABLE DONHANG
(
	MA_DH CHAR(10) NOT NULL,
	SDT CHAR(10),
	TINHTRANG NVARCHAR(20),
	MA_PHIEU CHAR(6),
	TIENHANG FLOAT,
	THANHTIEN FLOAT,
	NGAYLAP DATE,
	CONSTRAINT PK_DH PRIMARY KEY(MA_DH)
)
GO

CREATE TABLE CHITIETDH
(
	MA_DH CHAR(10) NOT NULL,
	MA_SP CHAR(10) NOT NULL,
	SO_LUONG INT NOT NULL,
	THANHGIA FLOAT,
	CONSTRAINT PK_CTDH PRIMARY KEY(MA_DH, MA_SP)
)
GO

CREATE TABLE SIEUTHI
(
	MA_ST CHAR(6) NOT NULL,
	TEN_ST NVARCHAR(50) NOT NULL,
	DIACHI_ST NVARCHAR(100) NOT NULL,
	TGMOCUA CHAR(11),
	CONSTRAINT PK_ST PRIMARY KEY(MA_ST)
)
GO

CREATE TABLE KHO
(
	MA_ST CHAR(6) NOT NULL,
	MA_SP CHAR(10) NOT NULL,
	CONSTRAINT PK_KHO PRIMARY KEY(MA_ST, MA_SP)
)
GO


CREATE TABLE GIOHANG
(
	SDT CHAR(10),
	MA_SP CHAR(10),
	SOLUONG INT,
	THANH_GIA FLOAT,
	CONSTRAINT PK_GH PRIMARY KEY(SDT,MA_SP)
)

ALTER TABLE GIOHANG
ADD CONSTRAINT FK_CTGH_BM
FOREIGN KEY(SDT)
REFERENCES BOME
GO

ALTER TABLE BOME
ADD CONSTRAINT FK_BM_PGG
FOREIGN KEY(MA_PHIEU)
REFERENCES PHIEUGGQT
GO

ALTER TABLE GIOHANG
ADD CONSTRAINT FK_GH_SP
FOREIGN KEY(MA_SP)
REFERENCES SANPHAM
GO

ALTER TABLE CON
ADD CONSTRAINT FK_CON_BM
FOREIGN KEY(SDT)
REFERENCES BOME
GO

ALTER TABLE DIACHINHANHANG
ADD CONSTRAINT FK_DCDH_BM
FOREIGN KEY(SDT)
REFERENCES BOME
GO

ALTER TABLE DONHANG
ADD CONSTRAINT FK_DH_BM
FOREIGN KEY(SDT)
REFERENCES BOME
GO

ALTER TABLE CHITIETLOAI
ADD CONSTRAINT FK_CTL_TH
FOREIGN KEY(MA_TH)
REFERENCES THUONGHIEU
GO

ALTER TABLE SANPHAM
ADD CONSTRAINT FK_SP_TH
FOREIGN KEY(MA_TH)
REFERENCES THUONGHIEU
GO

ALTER TABLE LOAISP
ADD CONSTRAINT FK_LSPCHA_LSP
FOREIGN KEY(LOAISP_CHA)
REFERENCES LOAISP
GO

ALTER TABLE CHITIETLOAI
ADD CONSTRAINT FK_CTL_LSP
FOREIGN KEY(MA_LOAI)
REFERENCES LOAISP
GO

ALTER TABLE SANPHAM
ADD CONSTRAINT FK_SP_LSP
FOREIGN KEY(MA_LOAI)
REFERENCES LOAISP
GO

ALTER TABLE CHITIETSP
ADD CONSTRAINT FK_CTSP_SP
FOREIGN KEY(MA_SP)
REFERENCES SANPHAM
GO

ALTER TABLE CHITIETDH
ADD CONSTRAINT FK_CTDH_SP
FOREIGN KEY(MA_SP)
REFERENCES SANPHAM
GO

ALTER TABLE SANPHAM
ADD CONSTRAINT FK_KM_SP
FOREIGN KEY(MA_KM)
REFERENCES SANPHAM
GO

ALTER TABLE KHO
ADD CONSTRAINT FK_KHO_SP
FOREIGN KEY(MA_SP)
REFERENCES SANPHAM
GO

ALTER TABLE DONHANG
ADD CONSTRAINT FK_DH_PHIEU
FOREIGN KEY(MA_PHIEU)
REFERENCES PHIEUGGQT
GO

ALTER TABLE CHITIETDH
ADD CONSTRAINT FK_CTDH_DH
FOREIGN KEY(MA_DH)
REFERENCES DONHANG
GO

ALTER TABLE KHO
ADD CONSTRAINT FK_KHO_ST
FOREIGN KEY(MA_ST)
REFERENCES SIEUTHI
GO

ALTER TABLE GIOHANG
ADD CONSTRAINT DF_THANH_GIA
DEFAULT 0 FOR THANH_GIA
GO

ALTER TABLE DONHANG
ADD CONSTRAINT DF_THANHTIEN
DEFAULT 0 FOR THANHTIEN
GO

ALTER TABLE DIEM_DANH
ADD CONSTRAINT FK_DD_NV
FOREIGN KEY(SDT)
REFERENCES NHANVIEN
GO