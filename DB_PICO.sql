CREATE DATABASE DB_PICOVN

USE DB_PICOVN

CREATE TABLE TB_DanhMucSanPham
(
	DanhMucID DECIMAL(20,0) NOT NULL PRIMARY KEY,
	TenDanhMuc NVARCHAR(100),
	STATUS BIT,
	ParentID DECIMAL(20,0),
	NhanVienTao DECIMAL(18,0),
	NgayTao DATETIME,
	NhanVienCapNhat DECIMAL(18,0),
	NgayCapNhat DATETIME,
	CONSTRAINT PID FOREIGN KEY(ParentID) REFERENCES TB_DanhMucSanPham(DanhMucID)
)

CREATE TABLE TB_SanPham
(
	SKU NVARCHAR(100) NOT NULL PRIMARY KEY,
	MODEL NVARCHAR(200) NOT NULL,
	STATUS BIT,
	GiaTien DECIMAL(18,0),
	GiaKhuyenMai DECIMAL(18,0),
	VAT DECIMAL(18,0),
	SoLuong DECIMAL(18,0),
	HOT DATETIME,
	NguoiXem INT,
	DanhMucID DECIMAL(20,0),
	CONSTRAINT FRK_CateID FOREIGN KEY(DanhMucID) REFERENCES TB_DanhMucSanPham(DanhMucID)
)

CREATE TABLE TB_SanPham_Tivi
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID INT,
	DoPhanGiai NVARCHAR(20),
	KichThuocManHinh NVARCHAR(20),
	KichThuoc NVARCHAR(100),
	KhoiLuong NVARCHAR(100),
	RefreshRate NVARCHAR(20),
	XuatXu NVARCHAR(50),
    BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU1 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU)
)	
	                                  
CREATE TABLE TB_SanPham_Loa
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	CongSuat NVARCHAR(100),
	Channel NVARCHAR(100),
	CheDoKetNoi NVARCHAR(100),
	KichThuoc NVARCHAR(100),
	XuatXu NVARCHAR(50),
    BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU2 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU)
)	
	                                  
CREATE TABLE TB_SanPham_TuLanh
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	KichThuoc NVARCHAR(100),
	KhoiLuong NVARCHAR(100),
	DienNangTieuThu NVARCHAR(100),
	SoCua INT,
	TongDungTich int,
	Inverter bit,
	CongNgheLamLanh NVARCHAR(200),
	KhangKhuan_KhuKhuan NVARCHAR(200),
	XuatXu NVARCHAR(50),
    BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU3 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU)
)

CREATE TABLE TB_SanPham_DieuHoa
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	Inverter bit,
	PhamViHieuQua nvarchar(100),
	LoaiGaSuDung nvarchar(100),
	DienNangTieuThu nvarchar(100),
	ChiSoEER_COP nvarchar(100),
	XuatXu NVARCHAR(50),
    BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU4 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU)
)

CREATE TABLE TB_SanPham_MayGiat
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	KichThuoc NVARCHAR(100),
	LongGiat Nvarchar(100),
	DienNangTieuThu nvarchar(100),
	KhoiLuongGiat nvarchar(100),
	Inverter bit,
	LuongNuocTieuThu nvarchar(200),
	TocDoQuayVat nvarchar(200),
	XuatXu NVARCHAR(50),
    BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU5 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU)
)

CREATE TABLE TB_SanPham_MaySay
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	KichThuoc NVARCHAR(100),
	LoaiSay NVARCHAR(200),
	KhoiLuongSay nvarchar(100),
	DienNangTieuThu nvarchar(100),
	XuatXu NVARCHAR(50),
    BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU6 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU)
)