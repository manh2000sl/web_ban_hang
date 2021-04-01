CREATE DATABASE TNTTSHOP
GO
USE TNTTSHOP
GO
CREATE TABLE NhaSanXuat(
	TenNSX varchar(50) primary key not null,
	Logo varchar(50) not null,
	Website nvarchar(50) not null,
	SDT varchar(50) not null,
	Email varchar(50) not null,
	DiaChi nvarchar(MAX) not null
)
GO
CREATE TABLE ThongTinSP(
	TenSP nvarchar(450) Primary Key NOT NULL,
	GiaSP int NOT NULL,
	AnhSP varchar(MAX) NOT NULL,
	NSX varchar(50) CONSTRAINT FK_TenNSX FOREIGN KEY REFERENCES NhaSanXuat(TenNSX) NOT NULL,
	LoaiSP varchar(50) NOT NULL,
	ManHinh	nvarchar(50),
	HDH	nvarchar(50),
	CameraChinh	nvarchar(50),
	CameraPhu nvarchar(50),
	CPU	nvarchar(MAX),
	RAM	nvarchar(50),
	ROM	nvarchar(50),
	KetNoi nvarchar(MAX),
	Sim	nvarchar(50),
	TheNho nvarchar(50),
	Pin	nvarchar(50),
	KM nvarchar(MAX),
	TTThem nvarchar(MAX),
	ThoiGianThem varchar(20)
)
GO	
CREATE TABLE Kho(
	MaLoHang int IDENTITY(1,1) Primary Key NOT NULL,
	TenSP nvarchar(450) NOT NULL,
	TGNhapKho varchar(20) NOT NULL,
	SLNhap int NOT NULL,
	GiaNhap int NOT NULL,
	GiaBan int NOT NULL,
	TGCNCuoi varchar(20) NOT NULL,
	SLHienCo int NOT NULL
)
GO
CREATE TABLE ThanhVien(
	TenDangNhap varchar(100) Primary Key NOT NULL,
	MatKhau	varchar(MAX) NOT NULL,
	HoVaTen	nvarchar(MAX) NOT NULL,
	Email varchar(MAX) NOT NULL,
	SDT varchar(20) NOT NULL,
	NgaySinh varchar(10) NOT NULL,
	GT nvarchar(5) NOT NULL,
	TGDangKy varchar(20) NOT NULL,
	DiaChi nvarchar(MAX) NOT NULL,
	HoatDong varchar(5) NOT NULL
)
GO
CREATE TABLE PhanHoiTV(
	MaPH int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ThanhVien varchar(100) NOT NULL,
	ChuDe nvarchar(50) NOT NULL,
	ThoiGianPH varchar(20),
	NDPhanHoi nvarchar(MAX),
	ThoiGianTL varchar(20),
	NDTraLoi nvarchar(MAX),
	TrangThai varchar(10) NOT NULL
)
GO
CREATE TABLE PhanHoiKVL(
	MaKVL int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Email varchar(MAX),
	SDT varchar(20),
	TGPhanHoi varchar(20),
	NoiDung nvarchar(MAX),
	TrangThai varchar(20)
)
GO
--Thêm giá trị demo
	--Thông tin nhà sản xuất.
		Insert into NhaSanXuat VALUES('CHINA','update.png',N'www.china.com.vn',1800588889,'china@gmail.com',N'Trung Quốc')
		Insert into NhaSanXuat VALUES('SamSung','SamSung.png',N'www.samsung.com.vn',1800588889,'samsungvietnam@gmail.com',N'Samsung Town, Seoul, Hàn Quốc')
		Insert into NhaSanXuat VALUES('Apple','apple.png',N'www.trungtambaohanhapple.com',0838442008,'applevietnam@gmail.com',N'178-180 Hoàng Vãn Thụ, Phường 9, Q. Phú Nhuận')
		Insert into NhaSanXuat VALUES('Nokia','Nokia.jpg',N'www.nokia.com',0838442008,'nokiavietnam@gmail.com',N'178-180 Hoàng Vãn Thụ, Phườngng 9, Q. Phú Nhuận')
	--Sản phẩm điện thoại.
		insert into ThongTinSP values (N'Apple Iphone 7 Plus',20110000,'IP7.png','Apple','DT',N'5.5 inches',N'IOS 10',N'12MP',N'7MP',N'6 lõi',N'2GB',N'32GB',N'3G-WiFi-Bluetooth',N'Nano','',N'2900mAh',N'',N'Chống vô nước', CONVERT(VARCHAR(20), GETDATE(), 113))
		insert into ThongTinSP values (N'Apple Iphone 6 Plus',15260000,'IP6.png','Apple','DT',N'5.5 inches',N'IOS 10',N'12MP',N'5MP',N'6 lõi',N'2GB',N'32GB',N'3G-WiFi-Bluetooth',N'Nano','',N'2915mAh',N'',N'', CONVERT(VARCHAR(20), GETDATE(), 113))
		insert into ThongTinSP values (N'Samsung Galaxy S7 Edge',18490000,'SSS7.png','SamSung','DT',N'5.5 inches',N'Android 6.0',N'12MP',N'5MP',N'Quad-core 2.3 GHz Cortex-A53 + quad-core 1.6 GHz Cortex-A53',N'4GB',N'32GB',N'3G-WiFi-Bluetooth',N'Nano-2Sim',N'200GB',N'3600mAh',N'',N'', CONVERT(VARCHAR(20), GETDATE(), 113))
		insert into ThongTinSP values (N'Samsung Galaxy A9 Pro',11990000,'SSA9.png','SamSung','DT',N'6.0 inches',N'Android 6.0.1',N'16MP',N'8MP',N'Quad-core 1.8 GHz Cortex-A72 & quad-core 1.2 GHz Cortex-A53',N'4GB',N'32GB',N'3G-WiFi-Bluetooth',N'Nano-2Sim',N'256GB',N'5000mAh',N'',N'', CONVERT(VARCHAR(20), GETDATE(), 113))
		insert into ThongTinSP values (N'Nokia XL',1199000,'NXL.png','Nokia','DT',N'5.0 inches',N'Nokia X',N'5MP',N'2MP',N'Dual-core 1 GHz Cortex-A5',N'768 MB',N'4GB',N'3G-WiFi-Bluetooth',N'Micro-2Sim',N'32GB',N'2000mAh',N'',N'', CONVERT(VARCHAR(20), GETDATE(), 113))
	--Sản phẩm máy tính bảng.
		Insert into ThongTinSP VALUES(N'Samsung Tab S2 9.7 inch',11990000,'SStabs.jpg','SamSung','MTB',N'9.7 inch (2048 x 1536 pixel)',N'Android 6.0','8.0 MP',N'2.1 MP',N'Octa (Quad 1.9GHz + Quad 1.3GHz) Exynos 5433',N'3GB',N'32GB',N'3G/4G/Wifi/GPS/Bluetooth',N'NanoSim',N'Khong',N'5870 mAh',N'',N'', CONVERT(VARCHAR(20), GETDATE(), 113))
		Insert into ThongTinSP VALUES(N'Samsung Galaxy Tab A6 10.1 (2016) - Spen', 8990000,'SStabA62016.jpg','SamSung','MTB',N'10.1 inch, Full HD, 1920 x 1200 pixels',N'Android 6.0','8.0 MP',' 2.0 MP','1.6GHz Octa-Core','3GB','16GB','3G/4G/Wifi/GPS/Bluetooth','NanoSim',N'Khong','7300 mAh',N'',N'', CONVERT(VARCHAR(20), GETDATE(), 113))
		Insert into ThongTinSP VALUES(N'iPad Pro 12.9 inch Wi-Fi 32GB', 19999000,'IPadPro.jpg','Apple','MTB',N'12.9 inch(2732 x 2048 pixels)',N'iOS 10.1.1',N'8.0 MP',N'1.2 MP',N'A9X',N'1GB',N'32GB',N'Wifi/GPS/Bluetooth',N'NanoSim',N'Không',N'10H',N'',N'', CONVERT(VARCHAR(20), GETDATE(), 113))
		Insert into ThongTinSP VALUES(N'iPad Air 2 Wi-Fi 32GB', 9999000,'IpadAir2.jpg','Apple','MTB',N'9.7 inch (2048 x 1536 pixel)',N'iOS 10.1.1',N'8.0 MP',N'1.2 MP',N'3 nhân, 1.5 GHz',N'2GB',N'32GB',N'Wifi/GPS/Bluetooth',N'NanoSim',N'Khong',N'10H',N'',N'', CONVERT(VARCHAR(20), GETDATE(), 113))
		Insert into ThongTinSP VALUES(N'iPad Mini 4 Wi-Fi 4G 128GB', 17999000,'IpadMini.jpg','Apple','MTB',N'7.9 inch (2048 x 1536 pixels)',N'iOS 10.1.1',N'8.0 MP',N'1.2 MP',N'Apple A8',N'2GB DDR3',N'128GB',N'3G/4G/Wifi/GPS/Bluetooth',N'NanoSim',N'Khong',N'9H',N'',N'', CONVERT(VARCHAR(20), GETDATE(), 113))
	--Sản phẩm phụ kiện.
		insert into ThongTinSP values (N'Ốp lưng Iphone 6', '50000', 'oplungiphone6.jpg','CHINA', N'PK','','','','','','','','','','','',N'',N'',CONVERT(VARCHAR(20), GETDATE(), 113))
		insert into ThongTinSP values (N'Pin sạc dự phòng 5000 Mah', '285000', 'Pinsacduphong.jpg','CHINA', N'PK','','','','','','','','','','','',N'',N'',CONVERT(VARCHAR(20), GETDATE(), 113))
		insert into ThongTinSP values (N'Cáp micro usb 20cm', '40000', 'capmicrousb20cm.jpg','CHINA', N'PK','','','','','','','','','','','',N'',N'',CONVERT(VARCHAR(20), GETDATE(), 113))
		insert into ThongTinSP values (N'Nhẻ nhớ micro 8gb', '125000', 'thenhomicro8gb.jpg','CHINA', N'PK','','','','','','','','','','','',N'',N'',CONVERT(VARCHAR(20), GETDATE(), 113))
		insert into ThongTinSP values (N'Tai nghe trắng', '90000', 'tainghetrangtrang.jpg','CHINA', N'PK','','','','','','','','','','','',N'',N'',CONVERT(VARCHAR(20), GETDATE(), 113))
	--Thành viên.
		insert into ThanhVien values ('nguyenngan123','123456',N'Nguyễn Ngân','saynamepls@gmail.com','0123456789','1996-02-15',N'Nam',CONVERT(VARCHAR(20), GETDATE(), 113),N'Việt Nam','YES')
		insert into ThanhVien values ('vutung123','123456',N'Vũ Văn Tùng','tungtim96@gmail.com','0123456789','1996-08-15',N'Nam',CONVERT(VARCHAR(20), GETDATE(), 113),N'Việt Nam','YES')
		insert into ThanhVien values ('nguyentung123','123456',N'Nguyễn Huỳnh Thanh Tùng','Huynhthanhtung.nguyen94@gmail.com','0123456789','1994-01-01',N'Nam',CONVERT(VARCHAR(20), GETDATE(), 113),N'Việt Nam','NO')
		insert into ThanhVien values ('nguyenthoai123','123456',N'Nguyễn Hữu Thoại','quoctoansnsd@gmail.com','0123456789','1997-01-01',N'Nam',CONVERT(VARCHAR(20), GETDATE(), 113),N'Việt Nam','NO')
	--Kho hàng.
		INSERT INTO Kho VALUES(N'Apple Iphone 7 Plus',CONVERT(VARCHAR(20), GETDATE(), 113),'100',10110000,'0', CONVERT(VARCHAR(20), GETDATE(), 113),'100')
		INSERT INTO Kho VALUES(N'Apple Iphone 6 Plus',CONVERT(VARCHAR(20), GETDATE(), 113),'0',10110000,'0', CONVERT(VARCHAR(20), GETDATE(), 113),'0')
		INSERT INTO Kho VALUES(N'iPad Air 2 Wi-Fi 32GB',CONVERT(VARCHAR(20), GETDATE(), 113),'1000',7790000,'0', CONVERT(VARCHAR(20), GETDATE(), 113),'1000')
		INSERT INTO Kho VALUES(N'Ốp lưng Iphone 6',CONVERT(VARCHAR(20), GETDATE(), 113),'1000',10000,'0', CONVERT(VARCHAR(20), GETDATE(), 113),'1000')
		INSERT INTO Kho VALUES(N'Nhẻ nhớ micro 8gb',CONVERT(VARCHAR(20), GETDATE(), 113),'5000',10000,'0', CONVERT(VARCHAR(20), GETDATE(), 113),'5000')