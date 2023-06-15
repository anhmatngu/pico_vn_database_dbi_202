CREATE DATABASE DB_PICOVN

USE DB_PICOVN

CREATE TABLE TB_DanhMucSanPham
(
	DanhMucID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	TenDanhMuc NVARCHAR(100),
	STATUS BIT,
	ParentID int,
	CONSTRAINT PID FOREIGN KEY(ParentID) REFERENCES TB_DanhMucSanPham(DanhMucID)
)

CREATE TABLE TB_SanPham
(
	SKU NVARCHAR(100) NOT NULL PRIMARY KEY,
	MODEL NVARCHAR(200) NOT NULL,
	TenSP NVARCHAR(200) NOT NULL,
	STATUS BIT,
	GiaTien DECIMAL(18,0),
	GiaKhuyenMai DECIMAL(18,0),
	VAT DECIMAL(18,0),
	SoLuongCon int,
	HOT DATETIME,
	NguoiXem INT,
	DanhMucID int,
	CONSTRAINT FRK_CateID FOREIGN KEY(DanhMucID) REFERENCES TB_DanhMucSanPham(DanhMucID)
)


CREATE TABLE TB_XuatXu
(
	XuatXuID INT IDENTITY(1, 1) PRIMARY KEY,
	TenNuoc NVARCHAR(50) NOT NULL
)

CREATE TABLE TB_HangSanXuat
(
	HangSanXuatID INT IDENTITY(1, 1) PRIMARY KEY,
	TenHangSanXuat NVARCHAR(50) NOT NULL
)

CREATE TABLE TB_HeThongSieuThi
(
	SieuThiID int IDENTITY(1,1) PRIMARY KEY,
	TenST nvarchar(200),
	DiaChi nvarchar(200),
	Hotline int,
	DienThoai int,
	Email nvarchar(200),
)

CREATE TABLE TB_KhoHang
(
	SanPhamID INT IDENTITY(1,1) PRIMARY KEY,
	SKU NVARCHAR(100) NOT NULL,
	SieuThiID INT,
	CONSTRAINT FRK_SKU00 FOREIGN KEY (SKU) REFERENCES TB_SanPham(SKU),
	CONSTRAINT FRK_STID FOREIGN KEY (SieuThiID) REFERENCES TB_HeThongSieuThi(SieuThiID)
)
	

CREATE TABLE TB_SanPham_Tivi
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID INT not null,
	XuatXuID int not null,
	DoPhanGiai NVARCHAR(20),
	KichThuocManHinh NVARCHAR(20),
	KichThuoc NVARCHAR(100),
	KhoiLuong NVARCHAR(100),
	RefreshRate NVARCHAR(20),
    BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU1 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU),
	CONSTRAINT FRK_HangSanXuatID FOREIGN KEY(HangSanXuatID) REFERENCES TB_HangSanXuat(HangSanXuatID),
	CONSTRAINT FRK_XuatXuID FOREIGN KEY(XuatXuID) REFERENCES TB_XuatXu(XuatXuID)
)	
	                                  
CREATE TABLE TB_SanPham_Loa
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	XuatXuID int not null,
	CongSuat NVARCHAR(100),
	Channel NVARCHAR(100),
	CheDoKetNoi NVARCHAR(100),
	KichThuoc NVARCHAR(100),
    BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU2 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU),
	CONSTRAINT FRK_HangSanXuatID1 FOREIGN KEY(HangSanXuatID) REFERENCES TB_HangSanXuat(HangSanXuatID),
	CONSTRAINT FRK_XuatXuID1 FOREIGN KEY(XuatXuID) REFERENCES TB_XuatXu(XuatXuID)
)	
	                                  
CREATE TABLE TB_SanPham_TuLanh
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	XuatXuID int not null,
	KichThuoc NVARCHAR(100),
	KhoiLuong NVARCHAR(100),
	DienNangTieuThu NVARCHAR(100),
	SoCua INT,
	TongDungTich int,
	Inverter bit,
	CongNgheLamLanh NVARCHAR(200),
	KhangKhuan_KhuKhuan NVARCHAR(200),
    BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU3 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU),
	CONSTRAINT FRK_HangSanXuatID2 FOREIGN KEY(HangSanXuatID) REFERENCES TB_HangSanXuat(HangSanXuatID),
	CONSTRAINT FRK_XuatXuID2 FOREIGN KEY(XuatXuID) REFERENCES TB_XuatXu(XuatXuID)
)

CREATE TABLE TB_SanPham_DieuHoa
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	XuatXuID int not null,
	Inverter bit,
	PhamViHieuQua nvarchar(100),
	LoaiGaSuDung nvarchar(100),
	DienNangTieuThu nvarchar(100),
	ChiSoEER_COP nvarchar(100),
    BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU4 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU),
	CONSTRAINT FRK_HangSanXuatID3 FOREIGN KEY(HangSanXuatID) REFERENCES TB_HangSanXuat(HangSanXuatID),
	CONSTRAINT FRK_XuatXuID3  FOREIGN KEY(XuatXuID) REFERENCES TB_XuatXu(XuatXuID),

)

CREATE TABLE TB_SanPham_MayGiat
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	XuatXuID int not null,
	KichThuoc NVARCHAR(100),
	LongGiat Nvarchar(100),
	DienNangTieuThu nvarchar(100),
	KhoiLuongGiat nvarchar(100),
	Inverter bit,
	LuongNuocTieuThu nvarchar(200),
	TocDoQuayVat nvarchar(200),
    BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU5 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU),
	CONSTRAINT FRK_HangSanXuatID4 FOREIGN KEY(HangSanXuatID) REFERENCES TB_HangSanXuat(HangSanXuatID),
	CONSTRAINT FRK_XuatXuID4  FOREIGN KEY(XuatXuID) REFERENCES TB_XuatXu(XuatXuID),
)

CREATE TABLE TB_SanPham_MaySay
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	XuatXuID int not null,
	KichThuoc NVARCHAR(100),
	LoaiSay NVARCHAR(200),
	KhoiLuongSay nvarchar(100),
	DienNangTieuThu nvarchar(100),
    BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU6 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU),
	CONSTRAINT FRK_HangSanXuatID5 FOREIGN KEY(HangSanXuatID) REFERENCES TB_HangSanXuat(HangSanXuatID),
	CONSTRAINT FRK_XuatXuID5  FOREIGN KEY(XuatXuID) REFERENCES TB_XuatXu(XuatXuID),
)

CREATE TABLE TB_SanPham_TuRuou
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	XuatXuID int not null,
	KichThuoc NVARCHAR(100),
	KhoiLuong NVARCHAR(100),
	DienNangTieuThu NVARCHAR(100),
	SucChua nvarchar(100),
	NhietDo nvarchar(100),
	GaSuDung nvarchar(100),
    BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU7 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU),
	CONSTRAINT FRK_HangSanXuatID6 FOREIGN KEY(HangSanXuatID) REFERENCES TB_HangSanXuat(HangSanXuatID),
	CONSTRAINT FRK_XuatXuID6  FOREIGN KEY(XuatXuID) REFERENCES TB_XuatXu(XuatXuID),
)

CREATE TABLE TB_SanPham_TuChamSocQuanAo
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int not null,
	XuatXuID int not null,
	KichThuoc NVARCHAR(100),
	KhoiLuongSay NVARCHAR(100),
	DienNangTieuThu NVARCHAR(100),
    BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU8 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU),
	CONSTRAINT FRK_HangSanXuatID7 FOREIGN KEY(HangSanXuatID) REFERENCES TB_HangSanXuat(HangSanXuatID),
	CONSTRAINT FRK_XuatXuID7 FOREIGN KEY(XuatXuID) REFERENCES TB_XuatXu(XuatXuID),
)

CREATE TABLE TB_SanPham_NoiCom
( 
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int not null,
	XuatXuID int not null,
	SoNguoiAn nvarchar(100),
	TheTichChua nvarchar(100),
	LongNoi nvarchar(100),
	SoManNhiet int,
	CheDoNau nvarchar(100),
	NapThoatHoiThongMinh nvarchar(100),
	KhayHapThucPham bit,
	MuongXoiCom bit,
	LyDongGao bit,
	NutDieuKhien nvarchar(100),
	LoaiDayDien nvarchar(100),
	BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU9 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU),
	CONSTRAINT FRK_HangSanXuatID8 FOREIGN KEY(HangSanXuatID) REFERENCES TB_HangSanXuat(HangSanXuatID),
	CONSTRAINT FRK_XuatXuID8  FOREIGN KEY(XuatXuID) REFERENCES TB_XuatXu(XuatXuID),
)

CREATE TABLE TB_SanPham_LoViSong
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	XuatXuID int not null,
	DungTich nvarchar(100),
	TrongLuong nvarchar(100),
	KichThuoc nvarchar(100),
	CongSuat nvarchar(100),
	ChucNangChinh nvarchar(100),
	DenChieuSang bit,
	BangDieuKhien nvarchar(100),
	HenGio nvarchar(100),
	ChuongBao bit,
	ManHinhHienThi bit,
	BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU10 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU),
	CONSTRAINT FRK_HangSanXuatID9 FOREIGN KEY(HangSanXuatID) REFERENCES TB_HangSanXuat(HangSanXuatID),
	CONSTRAINT FRK_XuatXuID9  FOREIGN KEY(XuatXuID) REFERENCES TB_XuatXu(XuatXuID),
)

CREATE TABLE TB_SanPham_QuatMat
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	XuatXuID int not null,
	LoaiQuat int not null, -- Bang ID trong CategoryID
	CongSuat nvarchar(100),
	SoCanhQuat nvarchar(100),
	DieuKhienTuXa bit,
	KichThuoc nvarchar(100),
	GioMatTuNhien bit,
	BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU11 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU),
	CONSTRAINT FRK_HangSanXuatID10 FOREIGN KEY(HangSanXuatID) REFERENCES TB_HangSanXuat(HangSanXuatID),
	CONSTRAINT FRK_XuatXuID10  FOREIGN KEY(XuatXuID) REFERENCES TB_XuatXu(XuatXuID),
	CONSTRAINT FRK_LoaiQuat  FOREIGN KEY(LoaiQuat) REFERENCES TB_DanhMucSanPham(DanhMucID)
)

CREATE TABLE TB_SanPham_QuatDieuHoa
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	XuatXuID int not null,
	LoaiQuat int not null, -- Bang ID trong CategoryID
	CongSuat nvarchar(100),
	BaoHanh NVARCHAR(50),
	CONSTRAINT FRK_SKU12 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU),
	CONSTRAINT FRK_HangSanXuatID11 FOREIGN KEY(HangSanXuatID) REFERENCES TB_HangSanXuat(HangSanXuatID),
	CONSTRAINT FRK_XuatXuID11  FOREIGN KEY(LoaiQuat) REFERENCES TB_DanhMucSanPham(DanhMucID),
)

CREATE TABLE TB_SanPham_MayEp
(
	SKU NVARCHAR(100) NOT NULL,
	HangSanXuatID int,
	XuatXuID int not null,
	LoaiMay int not null,
	DungTich nvarchar(100),
	CongSuat nvarchar(100),
	ChatLieuLuoiDao nvarchar(100),
	ChatLieuVoMay nvarchar(100),
	NutChinhTocDo bit,
	TuDongNgatAnToan bit,
	ChanDeChongTruot bit,
	CONSTRAINT FRK_SKU13 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU),
	CONSTRAINT FRK_HangSanXuatID12 FOREIGN KEY(HangSanXuatID) REFERENCES TB_HangSanXuat(HangSanXuatID),
	CONSTRAINT FRK_XuatXuID12  FOREIGN KEY(LoaiMay) REFERENCES TB_DanhMucSanPham(DanhMucID),
)

--========================== THONG TIN KHACH HANG VA ORDER =============================
CREATE TABLE TB_TaiKhoanKhachHang
(
	IDKhachHang int primary key,
	TenKH nvarchar(100),
	SoDienThoai int,
	Email nvarchar(100),
	DIACHI NVARCHAR(100),
	GIOITINH NVARCHAR(5),
	NGAYSINH DATETIME,
	NgayTaoID DATETIME,
)

CREATE TABLE TB_DonDatHang
(
	DonHangID int primary key,
	NgayDatDon datetime not null,
	Status bit,
	DaGiaoHang bit,
	NgayGiaoHang datetime,
	IDKhachHang int not null,
	GiamGia int,
	CONSTRAINT frk_idkh FOREIGN KEY(IDKhachHang) REFERENCES TB_TaiKhoanKhachHang(IDKhachHang)
)

CREATE TABLE TB_ChiTietDonDatHang
(
	DonHangID int primary key,
	SKU NVARCHAR(100) NOT NULL,
	TenSP NVARCHAR(200) NOT NULL,
	SoLuong int,
	TongCong decimal(18,0),
	CONSTRAINT frk_dhid FOREIGN KEY(DonHangID) REFERENCES TB_DonDatHang(DonHangID),
	CONSTRAINT FRK_SKU14 FOREIGN KEY(SKU) REFERENCES TB_SanPham(SKU),
)
