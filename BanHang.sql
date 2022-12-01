create database BanHang

go

use BanHang

go

create table sanpham
(
	masp int identity(1,1) not null,
	tensp nvarchar(50),
	hinhsp char(50),
	mota ntext,
	kichco char(5),
	donvitinh nvarchar(5) default 'cái',
	dongia numeric,	
	maloai int not null,
	macn int,
	madl int,
	mancc int not null,
	mahsx int not null,
	ngaycapnhat datetime,
	soluong int,	
	solanxem int default 0,

	constraint pk_sanpham primary key(masp),
)

go

create table loai
(
	maloai int identity(1,1) not null,
	tenloai nvarchar(50) not null,
	
	constraint pk_loai primary key(maloai)
)

go

create table nhacungcap
(
	mancc int identity(1,1) not null,
	tenncc nvarchar(30),
	diachi ntext,
	dienthoai char(11),
	
	constraint pk_nhacungcap primary key(mancc),
)

go

create table congnghe
(
	macn int identity(1,1),
	loaicn nvarchar(50) not null,	

	constraint pk_congnghe primary key(macn),
)

go

create table dungluong
(
	madl int identity(1,1),
	loaidl nvarchar(50) not null,	

	constraint pk_dungluong primary key(madl),
)

go

create table hangsanxuat
(
	mahsx int identity(1,1),
	tenhsx nvarchar(50) not null,	

	constraint pk_hangsanxuat primary key(mahsx),
)

go

create table khachhang
(
	makh int identity(1,1) not null,	
	tenkh nvarchar(30) not null,
	phai nvarchar(3) not null,
	diachi nvarchar(50) not null,
	email char(50),
	dienthoai char(11) not null,
	tenDN ntext not null,
	matkhau ntext not null,

	constraint pk_khachhang primary key(makh),
)

go

create table nhanvien
(
	manv int identity(1,1) not null,
	tennv nvarchar(30) not null,
	phai nvarchar(3) not null,
	diachi nvarchar(50) not null,
	cmnd char(11) not null,
	dienthoai char(11) not null,
	email char(50),
	tenDN ntext,
	matkhau ntext not null,

	constraint pk_nhanvien primary key(manv),
)

go

create table donhang
(
	madh int identity(1,1) not null,
	tennguoinhan nvarchar(30),
	diachinhan nvarchar(50),
	dienthoainhan char(11),
	dagiao bit default 0,	

	constraint pk_donhang primary key(madh),
)

go

create table chitiet_donhang
(
	madh int not null,
	masp int not null,
	soluong int,
	thanhtien money,

	constraint pk_chitiet_donhang primary key(madh, masp),
)

go

create table hoadon
(
	mahd int identity(1,1) not null,
	makh int not null,
	ngaydathang datetime,
	ngaygiaohang datetime,
	tennguoinhan nvarchar(30),
	diachinhan nvarchar(50),
	dienthoainhan char(11),
	httt bit,
	htgh bit,
	manv int not null,

	constraint pk_hoadon primary key(mahd),
)

go

create table chitiet_hoadon
(	
	mahd int not null,
	masp int not null,
	soluong int,
	dongia money,	
	thanhtien as soluong*dongia,

	constraint pk_chitiet_hoadon primary key(mahd,masp),
)

go

create table quangcao
(
	stt int identity(1,1),
	tencty nvarchar(200) not null,
	hinhminhhoa varchar(20),
	href varchar(100),
	ngaybatdau smalldatetime,
	ngayhethan smalldatetime,
	
	constraint pk_quangcao primary key(stt)
)

go

alter table sanpham add constraint fk_sanpham_maloai foreign key(maloai) references loai(maloai)
alter table sanpham add constraint fk_sanpham_macn foreign key(macn) references congnghe(macn)
alter table sanpham add constraint fk_sanpham_madl foreign key(madl) references dungluong(madl)
alter table sanpham add constraint fk_sanpham_mancc foreign key(mancc) references nhacungcap(mancc)
alter table sanpham add constraint fk_sanpham_mahsx foreign key(mahsx) references hangsanxuat(mahsx)
alter table hoadon add constraint fk_hoadon_nhanvien foreign key(manv) references nhanvien(manv)
alter table hoadon add constraint fk_hoadon_khachhang foreign key(makh) references khachhang(makh)
alter table chitiet_donhang add constraint fk_ctdonhang_donhang foreign key(madh) references donhang(madh)
alter table chitiet_donhang add constraint fk_ctdonhang_sanpham foreign key(masp) references sanpham(masp)
alter table chitiet_hoadon add constraint fk_cthoadon_hoadon foreign key(mahd) references hoadon(mahd)
alter table chitiet_hoadon add constraint fk_cthoadon_sanpham foreign key(masp) references sanpham(masp)

go 

insert into loai values(N'Mainboard - Bo mạch chủ')
insert into loai values(N'CPU - Bộ vi xử lý')
insert into loai values(N'RAM - Bộ nhớ trong')
insert into loai values(N'HDD External - Ổ cứng di động')
insert into loai values(N'HDD Internal - Ổ cứng')
insert into loai values(N'USB')
insert into loai values(N'VGA ATI - Card ATI')
insert into loai values(N'VGA nVIDIA - Card nVIDIA')
insert into loai values(N'Case')
insert into loai values(N'Power - Bộ nguồn')
insert into loai values(N'Moniter - Màn hình')
insert into loai values(N'Keyboard - Bàn phím')
insert into loai values(N'Mouse - Chuột')
insert into loai values(N'Speaker - Loa')
insert into loai values(N'Headphone - Tai nghe')

go

insert into congnghe values('Socket AM3+')
insert into congnghe values('Socket FM1')
insert into congnghe values('Socket FM2')
insert into congnghe values('Dual Core')
insert into congnghe values('Core i3')
insert into congnghe values('Core i5')
insert into congnghe values('Core i7')
insert into congnghe values('DDR2')
insert into congnghe values('DDR3')
insert into congnghe values('Wireless - Không dây')
insert into congnghe values(' ')

go

insert into dungluong values('1GB')
insert into dungluong values('2GB')
insert into dungluong values('4GB')
insert into dungluong values('8GB')
insert into dungluong values('16GB')
insert into dungluong values('32GB')
insert into dungluong values('64GB')
insert into dungluong values('250GB')
insert into dungluong values('320GB')
insert into dungluong values('500GB')
insert into dungluong values('1TB')
insert into dungluong values(' ')

go

insert into nhacungcap values('Phong Vũ',N'353 Lạc Long Quân, Q.11, TP.HCM','0838684239')
insert into nhacungcap values('Mai Phương',N'129 Ngô Gia Tự, Q.10, TP.HCM','0839560213')
insert into nhacungcap values('SaiGonLab',N'351 Nguyễn Tri Phương, Q.10, TP.HCM','0839750143')
insert into nhacungcap values('Hoàn Long',N'264C Nguyễn Thị Minh Khai, Q.3, Tp HCM','0839330766')

go

insert into hangsanxuat values('ASRock')
insert into hangsanxuat values('Asus')
insert into hangsanxuat values('Gigabyte')
insert into hangsanxuat values('Intel')
insert into hangsanxuat values('AMD')
insert into hangsanxuat values('Kingmax')
insert into hangsanxuat values('Corsair')
insert into hangsanxuat values('Team Elite')
insert into hangsanxuat values('Kingston')
insert into hangsanxuat values('Transcend')
insert into hangsanxuat values('Apacer')
insert into hangsanxuat values('SanDisk')
insert into hangsanxuat values('Cooler master')
insert into hangsanxuat values('Thermaltake')
insert into hangsanxuat values('Acbel')
insert into hangsanxuat values('DELL')
insert into hangsanxuat values('Samsung')
insert into hangsanxuat values('Hp')
insert into hangsanxuat values('LG')
insert into hangsanxuat values('Genius')
insert into hangsanxuat values('Logitech')
insert into hangsanxuat values('Philips')
insert into hangsanxuat values('SoudMax')
insert into hangsanxuat values('Toshiba')
insert into hangsanxuat values('Hitachi')

go

set dateformat dmy

go

--Mainboard ASRock
insert into sanpham values(N'ASRock H61M-VS', 'Mainboard ASRock (1).jpg', N'Solid Capacitor for CPU Power
Supports Intel® K-Series CPU
Supports Dual Channel DDR3 1333
Supports Intel® HD Graphics 2000/3000
Supports ASRock XFast RAM, XFast LAN, XFast USB Technologies
Supports AXTU, Graphical UEFI, Instant Boot, Instant Flash, APP Charger, SmartView
Combo Cooler Option (C.C.O.)', ' ', N'Cái', '950000', '1', '11', '12', '1', '1', '01/06/2014', '100', '0')
insert into sanpham values(N'ASROCK H71M-DGS', 'Mainboard ASRock (2).jpg', N'Solid Capacitor for CPU Power
Supports Intel® K-Series CPU
Supports Dual Channel DDR3 1600 PCIE Gigabit LAN
Supports Intel® HD Graphics with Built-in Visuals
Dual VGA Output options : DVI-D and D-Sub
Combo Cooler Option (C.C.O.)
5.1 CH HD Audio (Realtek ALC662 Audio Codec)
Supports ASRock XFast RAM, XFast LAN, XFast USB Technologies
Supports Intel® Smart Connect, Intel® Rapid Start, 
ASRock Graphical UEFI, AXTU, APP Charger, SmartView', ' ', N'Cái', '980000', '1', '11', '12', '1', '1', '01/06/2014', '100', '0')
insert into sanpham values(N'ASRock H61M/U3S3', 'Mainboard ASRock (3).jpg', N'ASRock DuraCap (2.5 x longer life time)
100% Japan-made high-quality Conductive Polymer Capacitors
Supports Intel® K-Series CPU
Supports Dual Channel DDR3 1333
Supports Intel® HD Graphics 2000/3000
Multi VGA Output options: D-Sub, DVI-D and HDMI
2 x USB 3.0, 2 x SATA3
Supports ASRock XFast RAM, XFast LAN, XFast USB Technologies
Supports AXTU, Graphical UEFI, Instant Boot, Instant Flash, APP Charger, SmartView
Combo Cooler Option (C.C.O.)', ' ', N'Cái', '1430000', '1', '11', '12', '1', '1', '01/06/2014', '100', '0')
insert into sanpham values(N'ASRock X79 Extreme4', 'Mainboard ASRock (4).jpg', N'Premium Gold Caps (2.5 x longer life time)
100% Japan-made high-quality Conductive Polymer Capacitors
Intel® Core™ i7 processor family for the LGA 2011 Socket
Supports Quad Channel DDR3 2400+(OC)
Digi Power, Advanced 6 + 2 Power Phase Design
3 x PCIe 3.0 x16 Slots, Supports AMD 3-Way CrossFireX™ and NVIDIA® 3-Way SLI™
Dr. Debug, Smart Switch Design: Power/Reset/Clear CMOS Switch with LED
Supports ASRock XFast RAM, XFast LAN, XFast USB, XFast Charger Technologies
Supports graphical UEFI, AXTU, SmartView, APP Charger
7.1 CH HD Audio with Content Protection (Realtek ALC898 Audio Codec), Supports THX TruStudio™', ' ', N'Cái', '5600000', '1', '11', '12', '1', '1', '01/06/2014', '100', '0')

--Mainboard Asus
insert into sanpham values(N'ASUS P8H61-MX R2.0', 'Mainboard Asus (1).jpg', N'Cost attractive model for H61 uATX motherboard
PCIe 3.0 – Improve your graphic performance with incredible data speed.
GPU BOOST - Go to the Limit with iGPU Level Up !
UEFI BIOS (EZ Mode) - Flexible & Easy BIOS Interface
Anti Surge - Full-time Power Guardian-Make System Free From Ris', ' ', N'Cái', '1113000', '1', '11', '12', '2', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'ASUS H61M-E', 'Mainboard Asus (2).jpg', N'Intuitive UEFI BIOS and easy network controls on H61 platform
UEFI BIOS - Flexible & Easy BIOS Interface
Network iControl - Regulate Network Bandwidth Real-time
Anti-Surge - Full-time Power Guardian-Make System Free From Risk
ESD Protection - Protect Your Computer with ESD Guards
AI Suite II - One-stop Access to Innovative ASUS Features', ' ', N'Cái', '1220000', '1', '11', '12', '2', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'ASUS P8B75-MA', 'Mainboard Asus (3).jpg', N'Socket LGA1155 S/p Intel 3rd/2nd (Ivy or  Sandy Bridge ) 
Turbo Boost (2.0)Intel B75 Express Chipset- 2x 
DDR3- 2200/2133../1600//1066  S/p
Intel (XMP) VGA output as HDMI/DVI/VGA Port, 
LucidLogix Virtu MVP (60% Hybrid GPU boost)  1x PCIe (3.0) (x16), 
2x PCIe (2.0) (x1), 1x PCI slots, 1x SATA(6Gb/s), 5x SATA(3Gb/s) 
Gigabit LAN, Sound 8CH, 4x USB (3.0) Boost UASP, 8x USB (2.0), 
UEFI BIOS   TurboV, AI Suite II, 
Network iControl, Solid Capacitors, AI Charger, Anti-Surge', ' ', N'Cái', '1541000', '1', '11', '12', '2', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'ASUS P8Q67-M DO/USB3/TPM/SI', 'Mainboard Asus (4).jpg', N'REV 3.0 - New Q67 B3 Revision
Flexible and safe Vpro brings new-gen Q67 enjoyment 
TPM IC Onboard – Protect Your Important Data
GPU Boost – Go to the Limit with iGPU Level Up!
EFI BIOS – Flexible and Easy BIOS Interface
SATA 6Gb/s Support – Let you experience the latest transfer technology!s', ' ', N'Cái', '1900000', '1', '11', '12', '2', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'ASUS Rampage IV GENE', 'Mainboard Asus (5).jpg', N'The most powerful X79 gaming mATX board 
2nd Generation Intel Core i7 processor family for the LGA 2011 Socket
Quad DDR3 2400 (O.C.)
SLI/CrossFireX – with x16/x16 (Gen 3.0) speed on a compact platform
Extreme Engine Digi+ II - Optimum power efficiency with premium components and intelligent digital design
SupremeFX III – Supreme sound
GameFirst with Intel Ethernet - The speed you need to pwn
USB BIOS Flashback - Easy, worry-free USB BIOS Flashback', ' ', N'Cái', '5564000', '1', '11', '12', '2', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'ASUS Maximus V Formula', 'Mainboard Asus (6).jpg', N'Mixes air and water cooling with superior graphics power
LGA1155 socket for Intel® 3rd/2nd Generation Core™ i7/ i5/ i3/ Pentium® / Celeron® Processors
Intel® Z77 Express Chipset
SupremeFX IV – AMPed For Perfect Audio
GameFirst II/Intel Gb LAN – Put Your Frags First
mPCIe Combo + dual-band Wi-Fi/Bluetooth 4.0
Fusion Thermo Solution - World’s first hybrid air and water cooling thermal design
Windows 8 Ready – Assured Compatibility', ' ', N'Cái', '5671000', '1', '11', '12', '2', '2', '01/06/2014', '100', '0')

--Mainboard Gigabyte
insert into sanpham values(N'Gigabyte Z87X-UD3H', 'Mainboard Gigabyte (1).jpg', N'Supports 4th Generation Intel® Core™ processors
GIGABYTE Ultra Durable™ 5 Plus Technology
All IR Digital Power design
GIGABYTE UEFI DualBIOS™
15µ gold plated CPU socket
Multi-GPU Support
Durable black solid capacitors
GIGABYTE On/Off Charge™ 2 for USB devices
Intel® LAN with high ESD Protection
New Heatsink design for better cooling
Realtek ALC898 with High Quality 110dB SNR HD audio
Onboard Quick Buttons
Supports CFOS speed Internet Accelerator Software
10 USB 3.0 ports', ' ', N'Cái', '4590000', '1', '11', '12', '3', '3', '01/06/2014', '100', '0')
insert into sanpham values(N'Gigabyte GA-Z77X-D3H', 'Mainboard Gigabyte (2).jpg', N'Supports 3rd Gen. Intel® 22nm CPUs and 2nd Gen
Intel® Core™ CPUs (LGA1155 socket)
GIGABYTE Digital Power Engine with GIGABYTE 3D Power
GIGABYTE 3D BIOS (Dual UEFI)
Onboard mSATA slot for mSATA SSDs
PCI Express Gen 3.0 support
2-way SLI™ and 2-way CrossFireX™ multi-GPU support
Lucid Virtu™ Universal® MVP GPU virtualization support
HDMI, DVI, RGB
High quality 108dB SNR HD audio
GIGABYTE 333™ Onboard Acceleration (USB 3.0, SATA 3.0 & 3x USB Power)
GIGABYTE On/Off Charge™ for USB devices', ' ', N'Cái', '3590000', '1', '11', '12', '3', '3', '01/06/2014', '100', '0')
insert into sanpham values(N'Gigabyte GA-X79-UD3', 'Mainboard Gigabyte (3).jpg', N'High Performance Intel LGA 2011® Core™ i7 processors
4 Channel Memory Architecture
PCI Express Gen. 3 Support
All New Digital Power Control for the CPU and Memory
UEFI DualBIOS™ Technology
8 phase overclockable VRM design featuring All Japanese solid capacitor and PowerPAK MOSFET design.
333 Onboard Acceleration features USB 3.0, SATA 3.0 and an unprecedented 3x USB power boost
Unique On/Off charge technology
GIGABYTE Ultra Durable™ 3 technology
Dolby Home Theater® support
High quality 110dB SNR HD audio', ' ', N'Cái', '5650000', '1', '11', '12', '3', '3', '01/06/2014', '100', '0')
insert into sanpham values(N'Gigabyte H87-D3H', 'Mainboard Gigabyte (4).jpg', N'Supports 4th Generation Intel® Core™ processors
GIGABYTE Ultra Durable™ 5 Plus Technology
IR digital power design
GIGABYTE UEFI DualBIOS™
15µ gold plated CPU Socket
Multi-GPU Support
GIGABYTE 333™ Onboard Acceleration (USB 3.0, SATA 3.0 & 3x USB Power)
GIGABYTE On/Off Charge™ for USB devices
Intel® LAN with high ESD Protection
Supports CFOS Speed Internet Accelerator Software
HDMI 1.4, DVI, D-SUB
Intel® Small Business Advantage', ' ', N'Cái', '2950000', '1', '11', '12', '3', '3', '01/06/2014', '100', '0')
insert into sanpham values(N'Gigabyte GA-B75M-D3H', 'Mainboard Gigabyte (5).jpg', N'All new design of Ultra Durable 4 classic
Supports 3rd Gen. Intel® 22nm CPUs and 2nd Gen. Intel® Core™ CPUs (LGA1155 socket)
Dual UEFI BIOS protection with 3TB+ HDD boot up capability
PCI Express Gen 3.0 support
Industry is Leading All Japanese Solid Capacitor Design
GIGABYTE 333™ Onboard Acceleration (USB 3.0, SATA 3.0 & 3x USB Power)
2-way CrossFireX™ multi-GPU support
HDMI/ DVI interface for smoother HD video playback
GIGABYTE On/Off Charge™ for USB devices', ' ', N'Cái', '1700000', '1', '11', '12', '3', '3', '01/06/2014', '100', '0')

--Mainboard Intel
insert into sanpham values(N'Intel BLKD B85FL', 'Mainboard Intel (1).jpg', N'sk LGA1150 S/p  Core i7 + i5, Intel B85 Express, 
S/p Turbo Boost, 4x DDR3-1600/1333 (D.C),  1x PCIe 3.0/2.0 (16x), 
2x PCIe(1x), VGA Onboard D-Sub, DVI, HDMI port, Intel Pro Gigabit LAN,
4x SATA 6Gb/s, 2x Sata 3Gb/s, Micro ATX ', ' ', N'Cái', '2250000', '1', '11', '12', '4', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel BLKDH61WWB3', 'Mainboard Intel (2).jpg', '
Intel H61 Express LGA1155 S/p Intel Core i7 + i5 + i3 (SNB) 
S/p Turbo Boost, 2x DDR3- 1333/1066 (D.C),
VGA S/p D-sub ( GPU Inside CPU), 1x PCIe (16x),1x PCIe(1x), 
1x PCI, Sound 6CH , Intel Pro Gigabit LAN, 6 USB(2), 4x SATA 3Gb/s, 
1-Year License * Antivirus * Antispyware * Firewall * Antispam * SMART Security', ' ', N'Cái', '1290000', '1', '11', '12', '4', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel BLKD H87MC', 'Mainboard Intel (3).jpg', N'sk LGA1150 S/p  Core i7 + i5, Intel H87 Express 
S/p Turbo Boost, 4x DDR3-1600/1333 (D.C),  
1x PCIe 3.0/2.0 (16x), 1x PCIe (4x), 2x PCIe(1x), 
3x PCI, VGA Onboard Display Port, DVI, HDMI port, 
Intel Pro Gigabit LAN, 5x SATA 6Gb/s (Raid 0, 1, 5, 10), 
4 USB 3.0, 10 USB 2.0, Sound 10ch., Form ATX', ' ', N'Cái', '3000000', '1', '11', '12', '4', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel BOXDH61HO', 'Mainboard Intel (4).jpg', N'Intel H61 Express  LGA1155 S/p Intel Core i7 + i5 + i3 (SNB)
S/p Turbo Boost; 2x DDR3-1333/1066 (D.C), 
VGA  S/p D-sub,  1x PCIe (16x), 2x PCIe(1x); 
Intel Gigabit LAN, Sound  6CH,  8 USB(2.0), 2x Sata (3Gb/s)', ' ', N'Cái', '1100000', '1', '11', '12', '4', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel Box DB85FL', 'Mainboard Intel (5).jpg', N'sk LGA1150 S/p  Core i7 + i5, Intel B85 Express 
S/p Turbo Boost, 4x DDR3-1600/1333 (D.C),  
1x PCIe 3.0/2.0 (16x), 2x PCIe(1x), VGA Onboard D-Sub, 
DVI, HDMI port, Intel Pro Gigabit LAN, 
4x SATA 6Gb/s, 2x Sata 3Gb/s, Micro ATX ', ' ', N'Cái', '2280000', '1', '11', '12', '4', '4', '01/06/2014', '100', '0')

--CPU AMD socket AM3+
insert into sanpham values(N'AMD Vishera FX-8350 4.0GHz', 'AMD Socket AM3 (1).jpg', N'sk AM3+ L2 8M, L3 8M, 8 Cores', ' ', N'Cái', '4900000', '2', '1', '12', '1', '5', '01/06/2014', '100', '0')
insert into sanpham values(N'AMD FX-4100', 'AMD Socket AM3 (2).jpg', 'AMD FX Processor
-Socket AM3+
- Model Number : 4100
- Frequency : 3.1GHz
- Total L2 Cache : 4MB
- L3 Cache : 8MB
- Cores/Threads : 4/4
- Thermal Design Power : 95W
- CMOS Technology : 32nm', ' ', N'Cái', '2350000', '2', '1', '12', '1', '5', '01/06/2014', '100', '0')
insert into sanpham values(N'AMD Vishera FX-6300 3.5GHz', 'AMD Socket AM3 (3).jpg', N'sk AM3+ L2 6M, L3 8M, 6 Cores', ' ', N'Cái', '3320000', '2', '1', '12', '1', '5', '01/06/2014', '100', '0')
insert into sanpham values(N'AMD Vishera FX-8320 3.5GHz', 'AMD Socket AM3 (4).jpg', N'sk AM3+ L2 8M, L3 8M, 8 Cores', ' ', N'Cái', '4000000', '2', '1', '12', '1', '5', '01/06/2014', '100', '0')

--CPU AMD socket FM1
insert into sanpham values(N'AMD APU A6 X4-3670', 'AMD Socket FM1 (1).jpg', N'AMD APU A6 Processor
-Socket FM1
- Model Number : X4-3670
- Frequency : 2.7GHz
- Total L2 Cache : 4MB
- Thermal Design Power : 100W
- CMOS Technology : 32nm
- GPU HD6530D/444MHz
- Bảo hành 36 tháng ', ' ', N'Cái', '2050000', '2', '2', '12', '2', '5', '01/06/2014', '100', '0')
insert into sanpham values(N'AMD Liano APU A6-3670K 3.0GHz', 'AMD Socket FM1 (2).jpg', N'sk FM1 L2 4M, 4 Cores (AMD Radeon HD 6530D)', ' ', N'Cái', '1930000', '2', '2', '12', '2', '5', '01/06/2014', '100', '0')

--CPU AMD socket FM2
insert into sanpham values(N'AMD Athlon X4-740 3.2GHz', 'AMD Socket FM2 (1).jpg', N'sk FM2 L2 4M, 4 Cores (Không tích hợp GPU)', ' ', N'Cái', '1680000', '2', '3', '12', '3', '5', '01/06/2014', '100', '0')
insert into sanpham values(N'AMD Athlon X4-750K 3.4GHz', 'AMD Socket FM2 (2).jpg', N'sk FM2 L2 4M, 4 Cores (Không tích hợp GPU)', ' ', N'Cái', '1870000', '2', '3', '12', '3', '5', '01/06/2014', '100', '0')
insert into sanpham values(N'AMD Trinity A4-5300 3.4GHz', 'AMD Socket FM2 (3).jpg', N'sk FM2 L2 1M, 2 Cores (AMD Radeon HD 7480D)', ' ', N'Cái', '1155000', '2', '3', '12', '3', '5', '01/06/2014', '100', '0')
insert into sanpham values(N'AMD Trinity A6-5400K 3.8GHz', 'AMD Socket FM2 (4).jpg', N'sk FM2 L2 1M, 2 Cores (AMD Radeon HD 7540D)', ' ', N'Cái', '1550000', '2', '3', '12', '3', '5', '01/06/2014', '100', '0')
insert into sanpham values(N'AMD Trinity A8-5600K 3.9GHz', 'AMD Socket FM2 (5).jpg', N'sk FM2 L2 4M, 4 Cores (AMD Radeon HD 7560D)', ' ', N'Cái', '2360000', '2', '3', '12', '3', '5', '01/06/2014', '100', '0')

--CPU Intel Dual Core
insert into sanpham values(N'Intel Dual Core G860 (3.0GHz)', 'Intel Dual Core (1).jpg', N'Socket 1155 - 3M Cache - 2 core - 2 threads
Intel HD Graphics - 32nm
Bảo hành 36 tháng', ' ', N'Cái', '1500000', '2', '4', '12', '1', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel Dual Core G2010 (2.8GHz)', 'Intel Dual Core (2).jpg', N'sk 1155 - 3rd - 3M - 2 cores - 2 threads
Intel HD Graphics - 55W', ' ', N'Cái', '1270000', '2', '4', '12', '1', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel Dual Core G630 (2.7GHz)', 'Intel Dual Core (3).jpg', N'- Model Number - G630
- Frequency - 2.7 GHz
- L3 Cache - 3 MB
- TDP - 65W
- GPU 850/1100MHz
- Socket - LGA 1155
- Manufacturing Technology : 32nm
- Bảo hành 36 tháng', ' ', N'Cái', '1290000', '2', '4', '12', '1', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel Dual Core G640 (2.8GHz)', 'Intel Dual Core (4).jpg', N'- Model Number - G640
- Frequency - 2.8 GHz
- L3 Cache - 3 MB
- TDP - 65W
- GPU 850/1100MHz
- Socket - LGA 1155
- Manufacturing Technology : 32nm
- Manufacturer Warranty - 3 Years', ' ', N'Cái', '1310000', '2', '4', '12', '1', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel Dual Core G2020 (2.9GHz)', 'Intel Dual Core (5).jpg', N'- Model Number - G2020
- Frequency - 2.9 GHz
- L3 Cache - 3 MB
- TDP - 55W
- Socket - LGA 1155
- GPU 650/1050MHz
- Manufacturing Technology : 22nm
- Manufacturer Warranty - 3 Years', ' ', N'Cái', '1340000', '2', '4', '12', '1', '4', '01/06/2014', '100', '0')

--CPU Intel Core i3
insert into sanpham values(N'Intel Core i3-3240 (3.4GHz)', 'Intel Core i3 (1).jpg', N'- Model Number - Core i3-3240
- Frequency - 3.4GHz
- L3 Cache - 3MB
- TDP - 55W
- 2 cores, 4 threads
- GPU 650/1050MHz
- Socket - LGA 1155
- Bảo hành 36 tháng', ' ', N'Cái', '3320000', '2', '5', '12', '2', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel Core i3-3210 (3.2GHz)', 'Intel Core i3 (2).jpg', N'- Model Number - Core i3-3210
- Frequency - 3.2GHz
- L2 Cache - 3MB
- TDP - 55W
- 2 cores, 4 threads
- GPU : Intel HD 2500
- Socket - LGA 1155
- Manufacturer Warranty - 3 Years', ' ', N'Cái', '2620000', '2', '5', '12', '2', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel Core i3-3220 (3.3GHz)', 'Intel Core i3 (3).jpg', N'- Model Number - Core i3-3220
- Frequency - 3.3GHz
- L3 Cache - 3MB
- TDP - 55W
- 2 cores, 4 threads
- GPU 650/1050MHz
- Socket - LGA 1155
- Bảo hành 36 tháng', ' ', N'Cái', '2740000', '2', '5', '12', '2', '4', '01/06/2014', '100', '0')

--CPU Intel Core i5
insert into sanpham values(N'Intel Core i5-3330 (3.0GHz)', 'Intel Core i5 (1).jpg', N'- Model Number - Core i5-3330 Ivy Bridge
- Frequency - 3.0GHz
- L2 Cache - 6MB
- TDP - 77W
- 4 cores, 4 threads
- GPU : Intel HD 2500 (650Mhz upto 1050Mhz in turbo mode)
- Socket - LGA 1155
- Lithography : 22nm
- Bảo hành 36 tháng', ' ', N'Cái', '4220000', '2', '6', '12', '3', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel Core i5-3450 (3.1GHz)', 'Intel Core i5 (2).jpg', N'- Model Number - Core i5-3450 Ivy Bridge
- Frequency - 3.1GHz
- L2 Cache - 6MB
- TDP - 77W
- 4 cores, 4 threads
- GPU : Intel HD 2500 (650Mhz upto 1100Mhz in turbo mode)
- Socket - LGA 1155
- Bảo hành 36 tháng', ' ', N'Cái', '4350000', '2', '6', '12', '3', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel Core i5-3470 (3.2GHz)', 'Intel Core i5 (3).jpg', N'- Model Number - Core i5-3470 Ivy Bridge
- Frequency - 3.2GHz
- L2 Cache - 6MB
- TDP - 77W
- 4 cores, 4 threads
- GPU : Intel HD 2500 (650Mhz upto 1100Mhz in turbo mode)
- Socket - LGA 1155
- Bảo hành 36 tháng', ' ', N'Cái', '4400000', '2', '6', '12', '3', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel Core i5-3570 (3.4GHz)', 'Intel Core i5 (4).jpg', N'- Model Number - Core i5-3570 Ivy Bridge
- Frequency - 3.4GHz
- L2 Cache - 6MB
- TDP - 77W
- 4 cores, 4 threads
- GPU : Intel HD 2500 (650Mhz upto 1150Mhz)
- Socket - LGA 1155
- Bảo hành 36 tháng', ' ', N'Cái', '4800000', '2', '6', '12', '3', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel Core I5-4670K (3.4GHz)', 'Intel Core i5 (5).jpg', N'Socket 1150, 6MB Cache, 4 Core, 4 Threads
GPU Intel HD 4600', ' ', N'Cái', '5850000', '2', '6', '12', '3', '4', '01/06/2014', '100', '0')

--CPU Intel Core i7
insert into sanpham values(N'Intel Core i7-3770 (3.4GHz)', 'Intel Core i7 (1).jpg', N'- Model Number - Core i7-3770 Ivy Bridge
- Frequency - 3.4GHz
- L2 Cache - 8MB
- TDP - 77W
- 4 cores, 8 threads
- GPU : Intel HD 4000 (650Mhz upto 1150Mhz)
- Socket - LGA 1155
- Bảo hành 36 tháng', ' ', N'Cái', '6810000', '2', '7', '12', '4', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel Core i7-3820 (3.6GHz)', 'Intel Core i7 (2).jpg', N'- Model Number - Core i7-3820
- Frequency - 3.6GHz
- L2 Cache - 10MB
- TDP - 130W
- 4 cores, 8 threads
- Socket - LGA 2011
- Bảo hành 36 tháng', ' ', N'Cái', '6900000', '2', '7', '12', '4', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel Core i7-3930K (3.2GHz)', 'Intel Core i7 (3).jpg', N'- Model Number - Core i7-3930K
- Frequency - 3.2GHz
- Intel Smart Cache 12MB
- TDP - 130W
- 6 cores, 12 threads
- Socket - LGA 2011
- No FAN
- Bảo hành 36 tháng', ' ', N'Cái', '13400000', '2', '7', '12', '4', '4', '01/06/2014', '100', '0')
insert into sanpham values(N'Intel Core I7-4770K (3.5GHz)', 'Intel Core i7 (4).jpg', N'Socket 1150, 8MB Cache, 4 Core, 8 Threads
GPU Intel HD 4600', ' ', N'Cái', '8400000', '2', '7', '12', '4', '4', '01/06/2014', '100', '0')

--RAM Corsair DDR2 2GB
insert into sanpham values(N'DDR2 2GB (800) Corsair VS2GB800D2', 'Corsair DDR2 2GB (1).jpg', N'Ram PC DDR2 Corsair 2GB bus 800 - PC6400 - VS2GB800D2', ' ', N'Cái', '790000', '3', '8', '2', '1', '7', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR2 2GB (800) Corsair CM2X20486400C5', 'Corsair DDR2 2GB (2).jpg', N'Ram PC DDR2 Corsair 2GB bus 800 - PC6400 - CM2X220486400C5', ' ', N'Cái', '830000', '3', '8', '2', '1', '7', '01/06/2014', '100', '0')

--RAM Corsair DDR3 2GB
insert into sanpham values(N'DDR3 2GB (1333) Corsair VS2GV1333D3', 'Corsair DDR3 2GB (1).jpg', N'Ram PC DDR3 Corsair 2GB bus 1333 - PC10600 - VS2GV1333D3', ' ', N'Cái', '480000', '3', '9', '2', '2', '7', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 2GB (1333) Corsair C9 CMX2GX3M1A', 'Corsair DDR3 2GB (2).jpg', N'Ram PC DDR3 Corsair C9 2GB bus 1333 - PC10600 - CMX2GX3M1A', ' ', N'Cái', '520000', '3', '9', '2', '2', '7', '01/06/2014', '100', '0')

--RAM Corsair DDR3 4GB
insert into sanpham values(N'DDR3 4GB (1333) Corsair C9 CMX4GX3M1A', 'Corsair DDR3 4GB (1).jpg', N'Ram PC DDR3 Corsair C9 4GB bus 1333 - PC10600 - CMX4GX3M1A', ' ', N'Cái', '860000', '3', '9', '3', '3', '7', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 4GB (1600) Corsair C9 CMZ4GX3M1A', 'Corsair DDR3 4GB (2).jpg', N'RRam PC DDR3 Corsair C9 4GB bus 1600 - PC12800 - CMZ4GX3M1A', ' ', N'Cái', '920000', '3', '9', '3', '3', '7', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 4GB (1600) Corsair C9B CMZ4GX3M2A', 'Corsair DDR3 4GB (3).jpg', N'Ram PC DDR3 Corsair C9 4GB bus 1600 - PC12800 - Kit (2x2GB) - CMZ4GX3M2A', ' ', N'Cái', '990000', '3', '9', '2', '3', '7', '01/06/2014', '100', '0')

--RAM Corsair DDR3 8GB
insert into sanpham values(N'DDR3 8GB (1333) Corsair C9 CMX8GX3M1A', 'Corsair DDR3 8GB (1).jpg', N'Ram PC DDR3 Corsair C9 8GB bus 1333 - PC10600 - CMX8GX3M1A', ' ', N'Cái', '1500000', '3', '9', '3', '4', '7', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 8GB (1600) Corsair C9R CMZ8GX3M2A', 'Corsair DDR3 8GB (2).jpg', N'Ram PC DDR3 Corsair C9R 8GB bus 1600 - PC12800 - Kit (2x4GB) - CMZ8GX3M2A', ' ', N'Cái', '1740000', '3', '9', '3', '4', '7', '01/06/2014', '100', '0')

--RAM KingMax DDR2 1GB
insert into sanpham values(N'DDR2 1GB (800) Kingmax', 'KingMax DDR2 1GB.jpg', N'Ram PC DDR2 Kingmax 1GB bus 800 - PC6400', ' ', N'Cái', '430000', '3', '8', '1', '1', '6', '01/06/2014', '100', '0')

--RAM KingMax DDR2 2GB
insert into sanpham values(N'DDR2 2GB (800) Kingmax', 'KingMax DDR2 2GB.jpg', N'Ram PC DDR2 Kingmax 2GB bus 800 - PC6400', ' ', N'Cái', '805000', '3', '8', '2', '1', '6', '01/06/2014', '100', '0')

--RAM KingMax DDR3 2GB
insert into sanpham values(N'DDR3 2GB (1333) Kingmax', 'KingMax DDR3 2GB (1).jpg', N'Ram PC DDR3 Kingmax 2GB bus 1333 - PC10600', ' ', N'Cái', '449000', '3', '9', '2', '2', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 2GB (1600) Kingmax', 'KingMax DDR3 2GB (2).jpg', N'RAM PC DDR3 Kingmax 2GB bus 1600 - PC12800', ' ', N'Cái', '449000', '3', '9', '2', '2', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 2GB (1600) Kingmax Nano', 'KingMax DDR3 2GB (3).jpg', N'Ram PC DDR3 Kingmax 2GB bus 1600 - PC12800 - Nano', ' ', N'Cái', '524000', '3', '9', '2', '2', '6', '01/06/2014', '100', '0')

--RAM KingMax DDR3 4GB
insert into sanpham values(N'DDR3 4GB (1333) Kingmax (512MB x 8)', 'KingMax DDR3 4GB (1).jpg', N'Ram PC DDR3 Kingmax 4GB bus 1333 -PC12800', ' ', N'Cái', '840000', '3', '9', '3', '3', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 4GB (1600) Kingmax', 'KingMax DDR3 4GB (2).jpg', N'Ram PC DDR3 Kingmax 4GB bus 1600 -PC12800', ' ', N'Cái', '840000', '3', '9', '3', '3', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 4GB (1600) Kingmax Nano', 'KingMax DDR3 4GB (2).jpg', N'Ram PC DDR3 Kingmax 4GB bus 1600 -PC12800 - Nano', ' ', N'Cái', '865000', '3', '9', '3', '3', '6', '01/06/2014', '100', '0')

--RAM KingMax DDR3 8GB
insert into sanpham values(N'DDR3 8GB (1333) Kingmax', 'KingMax DDR3 8GB (1).jpg', N'Ram PC DDR3 Kingmax 8GB bus 1333 -PC10600', ' ', N'Cái', '1625000', '3', '9', '4', '4', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 8GB (1600) Kingmax', 'KingMax DDR3 8GB (2).jpg', N'Ram PC DDR3 Kingmax 8GB bus 1600 -PC12800', ' ', N'Cái', '1635000', '3', '9', '4', '4', '6', '01/06/2014', '100', '0')

--RAM Kingston DDR3 2GB
insert into sanpham values(N'DDR3 2GB (1333) Kingston (8 chip)', 'Kingston DDR3 2GB (1).jpg', N'Ram PC DDR3 Kingston 2GB bus 1333 - PC10600 - 8 Chip', ' ', N'Cái', '470000', '3', '9', '2', '1', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 2GB (1333) Kingston HyperX', 'Kingston DDR3 2GB (2).jpg', N'Ram PC DDR3 Kingston 2GB bus 1333 - PC10600 - Hyper X', ' ', N'Cái', '529000', '3', '9', '2', '1', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 2GB (1600) Kingston HyperX', 'Kingston DDR3 2GB (3).jpg', N'Ram PC DDR3 Kingston 2GB bus 1600 - PC12800 - Hyper X', ' ', N'Cái', '540000', '3', '9', '2', '1', '9', '01/06/2014', '100', '0')

--RAM Kingston DDR3 4GB
insert into sanpham values(N'DDR3 4GB (1600) Kingston', 'Kingston DDR3 4GB (1).jpg', N'Ram PC DDR3 Kingston 4GB bus 1600 - PC12800', ' ', N'Cái', '749000', '3', '9', '3', '2', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 4GB (1866) Kingston HyperX', 'Kingston DDR3 4GB (2).jpg', N'Ram PC DDR3 Kingston 4GB bus 1866 - PC14900', ' ', N'Cái', '770000', '3', '9', '3', '2', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 4GB (1600) Kingston HyperX', 'Kingston DDR3 4GB (4).jpg', N'Ram PC DDR3 Kingston 4GB bus 1600 - PC12800', ' ', N'Cái', '820000', '3', '9', '3', '2', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 4GB (1333) Kingston HyperX', 'Kingston DDR3 4GB (5).jpg', N'Ram PC DDR3 Kingston 4GB bus 1333 - PC10600 - HyperX Xanh', ' ', N'Cái', '864000', '3', '9', '3', '2', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 4GB (1333) Kingston HyperX', 'Kingston DDR3 4GB (6).jpg', N'Ram PC DDR3 Kingston 4GB bus 1333 - PC10600 - HyperX Đỏ', ' ', N'Cái', '864000', '3', '9', '3', '2', '9', '01/06/2014', '100', '0')

--RAM Kingston DDR3 8GB
insert into sanpham values(N'DDR3 8GB(1600) Kingston HyperX 8G Xanh', 'Kingston DDR3 8GB (1).jpg', N'Ram PC DDR3 Kingston 8GB bus 1600 - PC12800 - HyperX Xanh', ' ', N'Cái', '1577000', '3', '9', '4', '3', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 8GB(1600) Kingston HyperX 8G Đen', 'Kingston DDR3 8GB (2).jpg', N'Ram PC DDR3 Kingston 8GB bus 1600 - PC12800 - HyperX Đen', ' ', N'Cái', '1577000', '3', '9', '4', '3', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 8GB(1600) Kingston HyperX 8G Đỏ', 'Kingston DDR3 8GB (3).jpg', N'Ram PC DDR3 Kingston 8GB bus 1600 - PC12800 - HyperX Đỏ', ' ', N'Cái', '1577000', '3', '9', '4', '3', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 8GB(1600) Kingston HyperX (Kit2x4G) Đỏ', 'Kingston DDR3 8GB (4).jpg', N'Ram PC DDR3 Kingston 8GB bus 1600 - PC12800 - Kit (2x4GB) - HyperX Đỏ', ' ', N'Cái', '1663000', '3', '9', '4', '3', '9', '01/06/2014', '100', '0')

--RAM Team DDR2 1GB
insert into sanpham values(N'DDR2 1GB (800) Team', 'Team DDR2 1GB (1).jpg', N'Ram PC DDR2 Team 1GB bus 800 - PC6400', ' ', N'Cái', '385000', '3', '8', '1', '4', '8', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR2 1GB (800) Team Elite', 'Team DDR2 1GB (2).jpg', N'Ram PC DDR2 Team Elite 1GB bus 800 - PC6400 (Giải nhiệt bằng đồng)', ' ', N'Cái', '395000', '3', '8', '1', '4', '8', '01/06/2014', '100', '0')

--RAM Team DDR2 2GB
insert into sanpham values(N'DDR2 2GB (800) Team Elite', 'Team DDR2 2GB.jpg', N'Ram PC DDR2 Team Elite 2GB bus 800 - PC6400 (Giải nhiệt bằng đồng)', ' ', N'Cái', '730000', '3', '8', '2', '4', '8', '01/06/2014', '100', '0')

--RAM Team DDR3 2GB
insert into sanpham values(N'DDR3 2GB (1333) Team Elite', 'Team DDR3 2GB (1).jpg', N'Ram PC DDR3 Team Elite 2GB bus 1333 - PC10600 (Giải nhiệt bằng đồng)', ' ', N'Cái', '465000', '3', '9', '2', '4', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 2GB (1600) Team Elite', 'Team DDR3 2GB (2).jpg', N'Ram PC DDR3 Team Elite 2GB bus 1600 - PC12800 (Giải nhiệt bằng đồng)', ' ', N'Cái', '465000', '3', '9', '2', '4', '9', '01/06/2014', '100', '0')

--RAM Team DDR3 4GB
insert into sanpham values(N'DDR3 4GB (1333) Team Elite', 'Team DDR3 4GB (1).jpg', N'Ram PC DDR3 Team Elite 4GB bus 1333 - PC10600 (Giải nhiệt bằng đồng)', ' ', N'Cái', '750000', '3', '9', '3', '4', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 4GB (1600) Team Elite', 'Team DDR3 4GB (2).jpg', N'Ram PC DDR3 Team Elite 2GB bus 1333 - PC12800 (Giải nhiệt bằng đồng)', ' ', N'Cái', '770000', '3', '9', '3', '4', '9', '01/06/2014', '100', '0')

--RAM Team DDR3 8GB
insert into sanpham values(N'DDR3 8GB (1333) Team Elite', 'Team DDR3 8GB (1).jpg', N'Ram PC DDR3 Team Elite 8GB bus 1333 - PC10600 (Giải nhiệt bằng đồng)', ' ', N'Cái', '1470000', '3', '9', '4', '4', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'DDR3 8GB (1600) Team Elite', 'Team DDR3 8GB (2).jpg', N'Ram PC DDR3 Team Elite 2GB bus 1333 - PC12800 (Giải nhiệt bằng đồng)', ' ', N'Cái', '1490000', '3', '9', '4', '4', '9', '01/06/2014', '100', '0')

--HDD External Apacer 500GB
insert into sanpham values(N'HDD 500GB Apacer AC231 (Đen)', 'Apacer 500GB (1).jpg', N'HDD External 2.5" SATA, USB 3.0', ' ', N'Cái', '1320000', '4', '11', '10', '1', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'HDD 500GB Apacer AC232 (Trắng)', 'Apacer 500GB (2).jpg', N'HDD External 2.5" SATA, USB 3.0', ' ', N'Cái', '1320000', '4', '11', '10', '1', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'HDD 500GB Apacer AC233', 'Apacer 500GB (3).jpg', N'- HDD External USB 3.0 
- Tốc độ ghi/ đọc cao, tối đa lên đến 85MB/ 92MB nhanh gấp 3 lần so với USB 2.0
- Tiết kiệm điện ở trạng thái sleep khi không truyền dữ liệu trong khoảng thời gian 10 phút', ' ', N'Cái', '1340000', '4', '11', '10', '1', '11', '01/06/2014', '100', '0')

--HDD External Apacer 1TB
insert into sanpham values(N'HDD 1TB Apacer AC233', 'Apacer 1TB (1).jpg', N'- HDD External USB 3.0 
- Tốc độ ghi/ đọc cao, tối đa lên đến 85MB/ 92MB nhanh gấp 3 lần so với USB 2.0
- Tiết kiệm điện ở trạng thái sleep khi không truyền dữ liệu trong khoảng thời gian 10 phút', ' ', N'Cái', '1880000', '4', '11', '11', '2', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'HDD 1TB Apacer AC232 (Trắng)', 'Apacer 1TB (2).jpg', N'HDD External 2.5" SATA, USB 3.0', ' ', N'Cái', '1880000', '4', '11', '11', '2', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'HDD 1TB Apacer AC231', 'Apacer 1TB (3).jpg', N'HDD External 2.5" SATA, USB 3.0', ' ', N'Cái', '1880000', '4', '11', '11', '2', '11', '01/06/2014', '100', '0')

--HDD External Transcend 500GB
insert into sanpham values(N'HDD 500GB Transcend M3 + Box 2.5"', 'Transcend 500GB (1).jpg', N'USB 3.0; Box 2.5", chống sốc; one touch backup', ' ', N'Cái', '1275000', '4', '11', '10', '3', '10', '01/06/2014', '100', '0')
insert into sanpham values(N'HDD 500GB Transcend StoreJet H2 + Box 2.5"', 'Transcend 500GB (2).jpg', N'USB 2.0, Box 2.5"; 3 lớp chống sốc, one touch backup', ' ', N'Cái', '1280000', '4', '11', '10', '3', '10', '01/06/2014', '100', '0')
insert into sanpham values(N'HDD 500GB Transcend A2 + Box 2.5"', 'Transcend 500GB (3).jpg', N'USB 2.0, Box 2.5"', ' ', N'Cái', '1280000', '4', '11', '10', '3', '10', '01/06/2014', '100', '0')

--HDD External Transcend 1TB
insert into sanpham values(N'HDD 1TB Transcend 25H3 + Box 2.5"', 'Transcend 1TB (1).jpg', N'USB 3.0, Box 2.5"; 3 lớp chống sốc, one touch backup', ' ', N'Cái', '1820000', '4', '11', '11', '4', '10', '01/06/2014', '100', '0')
insert into sanpham values(N'HDD 1TB Transcend StoreJet H2 + Box 2.5"', 'Transcend 1TB (2).jpg', N'USB 2.0, Box 2.5"; 3 lớp chống sốc, one touch backup', ' ', N'Cái', '1830000', '4', '11', '11', '4', '10', '01/06/2014', '100', '0')
insert into sanpham values(N'HDD 1TB Transcend M3 + Box 2.5"', 'Transcend 1TB (3).jpg', N'USB 3.0; Box 2.5", chống sốc; one touch backup', ' ', N'Cái', '1790000', '4', '11', '11', '4', '10', '01/06/2014', '100', '0')
insert into sanpham values(N'HDD 1TB Transcend Mobil + Box 2.5"', 'Transcend 1TB (4).jpg', N'USB 2.0, Box 2.5"  Chống sốc, one touch backup', ' ', N'Cái', '1810000', '4', '11', '11', '4', '10', '01/06/2014', '100', '0')

--HDD Internal Hitachi 320GB
insert into sanpham values(N'HDD 320GB Hitachi 2.5"', 'Internal Hitachi 320GB.jpg', N'ổ cứng gắn trong dành cho Notebook - Sata 2 - 5400rpm - 8MB Cache - 2.5"', ' ', N'Cái', '1000000', '5', '11', '9', '1', '25', '01/06/2014', '100', '0')

--HDD Internal Hitachi 500GB
insert into sanpham values(N'HDD 500GB Hitachi 2.5"', 'Internal Hitachi 500GB.jpg', N'ổ cứng gắn trong dành cho Notebook - Sata 2 - 5400rpm - 8MB Cache - 2.5"', ' ', N'Cái', '1210000', '5', '11', '10', '1', '25', '01/06/2014', '100', '0')

--HDD Internal Toshiba 320GB
insert into sanpham values(N'HDD 320GB Toshiba 2.5"', 'Internal Toshiba 320GB.jpg', N'ổ cứng gắn trong dành cho Notebook - Sata 3 - 5400rpm - 8MB Cache - 2.5"', ' ', N'Cái', '1050000', '5', '11', '9', '2', '24', '01/06/2014', '100', '0')

--HDD Internal Toshiba 500GB
insert into sanpham values(N'HDD 500GB Toshiba 2.5"', 'Internal Toshiba 500GB.jpg', N'ổ cứng gắn trong dành cho Notebook - Sata 3 - 5400rpm - 8MB Cache - 2.5"', ' ', N'Cái', '1270000', '5', '11', '10', '2', '24', '01/06/2014', '100', '0')

--USB Apacer 4GB
insert into sanpham values(N'4GB Apacer AH322', 'USB Apacer 4GB (1).jpg', N'USB 2.0 APACER AH322', ' ', N'Cái', '123000', '6', '11', '3', '3', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'4GB Apacer AH223', 'USB Apacer 4GB (2).jpg', N'USB 2.0 APACER AH223', ' ', N'Cái', '123000', '6', '11', '3', '3', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'4GB Apacer AH162', 'USB Apacer 4GB (3).jpg', N'USB 2.0 APACER AH162', ' ', N'Cái', '249000', '6', '11', '3', '3', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'4GB Apacer AH132', 'USB Apacer 4GB (4).jpg', N'USB 2.0 APACER AH132', ' ', N'Cái', '105000', '6', '11', '3', '3', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'4GB Apacer AH129', 'USB Apacer 4GB (5).jpg', N'USB 2.0 Apacer AH129', ' ', N'Cái', '180000', '6', '11', '3', '3', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'4GB Apacer AH326', 'USB Apacer 4GB (6).jpg', N'USB 2.0 APACER AH326', ' ', N'Cái', '123000', '6', '11', '3', '3', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'4GB Apacer AH321', 'USB Apacer 4GB (7).jpg', N'USB 2.0 APACER AH321', ' ', N'Cái', '123000', '6', '11', '3', '3', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'4GB Apacer AH131', 'USB Apacer 4GB (8).jpg', N'USB 2.0 APACER AH131', ' ', N'Cái', '135000', '6', '11', '3', '3', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'4GB Apacer AH332', 'USB Apacer 4GB (9).jpg', N'USB 2.0 Apacer AH332', ' ', N'Cái', '123000', '6', '11', '3', '3', '11', '01/06/2014', '100', '0')

--USB HP 4GB
insert into sanpham values(N'4GB HP V175W', 'USB HP 4GB.jpg', N'USB 2.0 HP V175W', ' ', N'Cái', '299000', '6', '11', '3', '4', '18', '01/06/2014', '100', '0')

--USB KingMax 4GB
insert into sanpham values(N'4GB Kingmax UD-02', 'USB KingMax 4GB (1).jpg', N'USB 2.0 KINGMAX UD-02', ' ', N'Cái', '229000', '6', '11', '3', '1', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'4GB Kingmax PD-01', 'USB KingMax 4GB (2).jpg', N'USB 2.0 KINGMAX PD-01', ' ', N'Cái', '120000', '6', '11', '3', '1', '6', '01/06/2014', '100', '0')

--USB Kingston 4GB
insert into sanpham values(N'4GB Kingston DT101 G2', 'USB Kingston 4GB.jpg', N'USB 2.0 Kingston DataTraveler DT101 G2', ' ', N'Cái', '120000', '6', '11', '3', '2', '9', '01/06/2014', '100', '0')

--USB SanDisk 4GB
insert into sanpham values(N'4GB SanDisk SDCZ52', 'USB SanDisk 4GB (1).jpg', N'USB 2.0 SanDisk SDCZ52', ' ', N'Cái', '103000', '6', '11', '3', '3', '12', '01/06/2014', '100', '0')
insert into sanpham values(N'4GB SanDisk SDCZ53', 'USB SanDisk 4GB (2).jpg', N'USB 2.0 SanDisk SDCZ53', ' ', N'Cái', '98000', '6', '11', '3', '3', '12', '01/06/2014', '100', '0')
insert into sanpham values(N'4GB Sandisk SDCZ33', 'USB SanDisk 4GB (3).jpg', N'USB 2.0 Sandisk SDCZ33', ' ', N'Cái', '118000', '6', '11', '3', '3', '12', '01/06/2014', '100', '0')

--USB Transcend 4GB
insert into sanpham values(N'4GB Transcend JF300', 'USB Transcend 4GB (1).jpg', N'USB 2.0 Transcend JF300', ' ', N'Cái', '112000', '6', '11', '3', '4', '10', '01/06/2014', '100', '0')
insert into sanpham values(N'4GB Transcend JF200', 'USB Transcend 4GB (2).jpg', N'USB 2.0 Transcend JF200', ' ', N'Cái', '225000', '6', '11', '3', '4', '10', '01/06/2014', '100', '0')
insert into sanpham values(N'4GB Transcend JF500', 'USB Transcend 4GB (3).jpg', N'USB 2.0 Transcend JF500', ' ', N'Cái', '112000', '6', '11', '3', '4', '10', '01/06/2014', '100', '0')

--USB Apacer 8GB
insert into sanpham values(N'8GB APACER AH223', 'USB Apacer 8GB.jpg', N'USB2.0 APACER AH223', ' ', N'Cái', '150000', '6', '11', '4', '1', '11', '01/06/2014', '100', '0')

--USB HP 8GB
insert into sanpham values(N'8GB HP V210W', 'USB HP 8GB (1).jpg', N'USB 2.0 HP V210W', ' ', N'Cái', '185000', '6', '11', '4', '2', '18', '01/06/2014', '100', '0')
insert into sanpham values(N'8GB HP V112B', 'USB HP 8GB (2).jpg', N'USB 2.0 HP V112B', ' ', N'Cái', '172000', '6', '11', '4', '2', '18', '01/06/2014', '100', '0')

--USB KingMax 8GB
insert into sanpham values(N'8GB Kingmax UI-05', 'USB KingMax 8GB (1).jpg', N'USB 2.0 KINGMAX UI-05', ' ', N'Cái', '195000', '6', '11', '4', '3', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'8GB Kingmax PD-71', 'USB KingMax 8GB (2).jpg', N'USB 2.0 KINGMAX PD-71', ' ', N'Cái', '150000', '6', '11', '4', '3', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'8GB Kingmax UI-01', 'USB KingMax 8GB (3).jpg', N'USB 2.0 KINGMAX UI-01', ' ', N'Cái', '195000', '6', '11', '4', '3', '6', '01/06/2014', '100', '0')

--USB Kingston 8GB
insert into sanpham values(N'8GB Kingston DT101 G2', 'USB Kingston 8GB (1).jpg', N'USB 2.0 Kingston DataTraveler DT101 G2', ' ', N'Cái', '140000', '6', '11', '4', '4', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'8GB Kingston DTCNY13', 'USB Kingston 8GB (2).jpg', N'USB 2.0 Kingston DTCNY13', ' ', N'Cái', '175000', '6', '11', '4', '4', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'8GB Kingston Micro', 'USB Kingston 8GB (3).jpg', N'USB 2.0 Kingston Data Traveler Micro', ' ', N'Cái', '185000', '6', '11', '4', '4', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'8GB Kingston DT111', 'USB Kingston 8GB (4).jpg', N'USB 3.0 Kingston DataTraveler 111', ' ', N'Cái', '190000', '6', '11', '4', '4', '9', '01/06/2014', '100', '0')

--USB SanDisk 8GB
insert into sanpham values(N'8GB SanDisk SDCZ37', 'USB SanDisk 8GB (1).jpg', N'USB 2.0 SanDisk SDCZ37', ' ', N'Cái', '150000', '6', '11', '4', '1', '12', '01/06/2014', '100', '0')
insert into sanpham values(N'8GB SanDisk SDCZ51', 'USB SanDisk 8GB (2).jpg', N'USB 2.0 SanDisk SDCZ51', ' ', N'Cái', '145000', '6', '11', '4', '1', '12', '01/06/2014', '100', '0')
insert into sanpham values(N'8GB SanDisk SDCZ52', 'USB SanDisk 8GB (3).jpg', N'USB 2.0 SanDisk SDCZ52', ' ', N'Cái', '140000', '6', '11', '4', '1', '12', '01/06/2014', '100', '0')
insert into sanpham values(N'8GB SanDisk SDZ36', 'USB SanDisk 8GB (4).jpg', N'USB 2.0 SanDisk SDZ36', ' ', N'Cái', '138000', '6', '11', '4', '1', '12', '01/06/2014', '100', '0')
insert into sanpham values(N'8GB SanDisk SDCZ60', 'USB SanDisk 8GB (5).jpg', N'USB 2.0 SanDisk SDCZ60', ' ', N'Cái', '150000', '6', '11', '4', '1', '12', '01/06/2014', '100', '0')
insert into sanpham values(N'8GB SanDisk SDCZ36', 'USB SanDisk 8GB (6).jpg', N'USB 2.0 SanDisk SDCZ36', ' ', N'Cái', '145000', '6', '11', '4', '1', '12', '01/06/2014', '100', '0')

--USB Transcend 8GB
insert into sanpham values(N'8GB Transcend JF500', 'USB Transcend 8GB.jpg', N'USB 2.0 Transcend JF500', ' ', N'Cái', '135000', '6', '11', '4', '2', '10', '01/06/2014', '100', '0')

--USB Apacer 16GB
insert into sanpham values(N'16GB Apacer AH322', 'USB Apacer 16GB (1).jpg', N'USB 2.0 APACER AH322 ', ' ', N'Cái', '260000', '6', '11', '5', '3', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'16GB Apacer AH321', 'USB Apacer 16GB (2).jpg', N'USB 2.0 APACER AH321', ' ', N'Cái', '260000', '6', '11', '5', '3', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'16GB Apacer AH223', 'USB Apacer 16GB (3).jpg', N'USB 2.0 APACER AH223', ' ', N'Cái', '260000', '6', '11', '5', '3', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'16GB Apacer AH332', 'USB Apacer 16GB (4).jpg', N'USB 2.0 APACER AH332', ' ', N'Cái', '260000', '6', '11', '5', '3', '11', '01/06/2014', '100', '0')

--USB HP 16GB
insert into sanpham values(N'16GB HP V165w', 'USB HP 16GB.jpg', N'USB 2.0 HP V165W', ' ', N'Cái', '235000', '6', '11', '5', '4', '18', '01/06/2014', '100', '0')

--USB KingMax 16GB
insert into sanpham values(N'16GB KingMax PD-01', 'USB KingMax 16GB (1).jpg', N'USB 2.0 KINGMAX PD-01', ' ', N'Cái', '245000', '6', '11', '5', '1', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'16GB KingMax U-Driver PD-07', 'USB KingMax 16GB (2).jpg', N'USB 2.0 KINGMAX U-Driver PD-07', ' ', N'Cái', '261000', '6', '11', '5', '1', '6', '01/06/2014', '100', '0')

--USB Kingston 16GB
insert into sanpham values(N'16GB Kingston DT101 G2', 'USB Kingston 16GB (1).jpg', N'USB 2.0 Kingston DataTraveler DT101 G2', ' ', N'Cái', '240000', '6', '11', '5', '2', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'16GB Kingston DT111', 'USB Kingston 16GB (2).jpg', N'USB 3.0 Kingston Data Traveler DT111', ' ', N'Cái', '287000', '6', '11', '5', '2', '9', '01/06/2014', '100', '0')
insert into sanpham values(N'16GB Kingston Micro', 'USB Kingston 16GB (3).jpg', N'USB 2.0 Kingston Data Traveler Micro', ' ', N'Cái', '285000', '6', '11', '5', '2', '9', '01/06/2014', '100', '0')

--USB SanDisk 16GB
insert into sanpham values(N'16GB SanDisk SDCZ36', 'USB SanDisk 16GB (1).jpg', N'USB 2.0 SanDisk SDZ36', ' ', N'Cái', '250000', '6', '11', '5', '3', '12', '01/06/2014', '100', '0')
insert into sanpham values(N'16GB SanDisk SDCZ60', 'USB SanDisk 16GB (2).jpg', N'USB 2.0 SanDisk SDCZ60', ' ', N'Cái', '255000', '6', '11', '5', '3', '12', '01/06/2014', '100', '0')
insert into sanpham values(N'16GB SanDisk SDCZ51', 'USB SanDisk 16GB (3).jpg', N'USB 2.0 SanDisk SDCZ51', ' ', N'Cái', '230000', '6', '11', '5', '3', '12', '01/06/2014', '100', '0')
insert into sanpham values(N'16GB Sandisk SDCZ33', 'USB SanDisk 16GB (4).jpg', N'USB 2.0 Sandisk SDCZ33', ' ', N'Cái', '265000', '6', '11', '5', '3', '12', '01/06/2014', '100', '0')

--USB Transcend 16GB
insert into sanpham values(N'16GB Transcend JF300', 'USB Transcend 16GB (1).jpg', N'USB 2.0 Transcend JF300', ' ', N'Cái', '235000', '6', '11', '5', '4', '10', '01/06/2014', '100', '0')
insert into sanpham values(N'16GB Transcend JF500', 'USB Transcend 16GB (2).jpg', N'USB 2.0 Transcend JF500', ' ', N'Cái', '235000', '6', '11', '5', '4', '10', '01/06/2014', '100', '0')

--USB Apacer 32GB
insert into sanpham values(N'32GB APACER AH223', 'USB Apacer 32GB (1).jpg', N'USB 2.0 Apacer AH223', ' ', N'Cái', '490000', '6', '11', '6', '1', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'32GB Apacer AH326', 'USB Apacer 32GB (2).jpg', N'USB 2.0 Apacer AH326', ' ', N'Cái', '490000', '6', '11', '6', '1', '11', '01/06/2014', '100', '0')
insert into sanpham values(N'32GB Apacer AH350', 'USB Apacer 32GB (3).jpg', N'USB 3.0 Apacer AH350', ' ', N'Cái', '600000', '6', '11', '6', '1', '11', '01/06/2014', '100', '0')

--USB HP 32GB
insert into sanpham values(N'32GB HP V225W', 'USB HP 32GB.jpg', N'USB 2.0 HP V225W', ' ', N'Cái', '604000', '6', '11', '6', '1', '11', '01/06/2014', '100', '0')

--USB KingMax 32GB
insert into sanpham values(N'32GB KingMax PD-09', 'USB KingMax 32GB (2).jpg', N'USB 3.0 Kingmax PD-09', ' ', N'Cái', '570000', '6', '11', '6', '2', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'32GB KingMax PI-01', 'USB KingMax 32GB (3).jpg', N'USB 2.0 Kingmax PI-01', ' ', N'Cái', '570000', '6', '11', '6', '2', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'32GB KingMax UD-03', 'USB KingMax 32GB (4).jpg', N'USB 2.0 Kingmax UD-03', ' ', N'Cái', '490000', '6', '11', '6', '2', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'32GB KingMax UI-01', 'USB KingMax 32GB (5).jpg', N'USB 2.0 Kingmax UI-01', ' ', N'Cái', '540000', '6', '11', '6', '2', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'32GB KingMax PD-06', 'USB KingMax 32GB (6).jpg', N'USB 2.0 Kingmax PD-06', ' ', N'Cái', '490000', '6', '11', '6', '2', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'32GB KingMax U-Driver', 'USB KingMax 32GB (7).jpg', N'USB 2.0 KingMax U-Driver', ' ', N'Cái', '1300000', '6', '11', '6', '2', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'32GB Kingmax PD-03', 'USB KingMax 32GB (8).jpg', N'USB 2.0 Kingmax PD-03', ' ', N'Cái', '490000', '6', '11', '6', '2', '6', '01/06/2014', '100', '0')
insert into sanpham values(N'32GB Kingmax UI-03', 'USB KingMax 32GB (9).jpg', N'USB 2.0 Kingmax UI-03', ' ', N'Cái', '490000', '6', '11', '6', '2', '6', '01/06/2014', '100', '0')

--USB Kingston 32GB
insert into sanpham values(N'32GB Kingston DT101 G2', 'USB Kingston 32GB.jpg', N'USB 2.0 Kingston DataTraveler G2', ' ', N'Cái', '490000', '6', '11', '6', '3', '9', '01/06/2014', '100', '0')

--USB Transcend 32GB
insert into sanpham values(N'32GB Transcend JF350', 'USB Transcend 32GB (1).jpg', N'USB 2.0 Transcend JF350', ' ', N'Cái', '470000', '6', '11', '6', '4', '10', '01/06/2014', '100', '0')
insert into sanpham values(N'32GB Transcend JF500', 'USB Transcend 32GB (2).jpg', N'USB 2.0 Transcend JF500', ' ', N'Cái', '480000', '6', '11', '6', '4', '10', '01/06/2014', '100', '0')
insert into sanpham values(N'32GB Transcend JF760', 'USB Transcend 32GB (3).jpg', N'USB 3.0 Transcend JF760', ' ', N'Cái', '550000', '6', '11', '6', '4', '10', '01/06/2014', '100', '0')

--VGA ATI
insert into sanpham values(N'ASUS HD7750-1GD5-V2', 'VGA ATI (1).jpg', N'Sleek 28nm card with GPU Tweak 
GPU Tweak utility helps you modify and tune clock speeds,
voltages, and fan performance via an intuitive interface.
AMD Eyefinity™ technology extends your viewing landscape
across multiple monitors.
New PCIe 3.0 delivers double the bandwidth per lane of 
PCIe 2.0 for faster GPU–CPU communication.', ' ', N'Cái', '2504000', '7', '11', '12', '1', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'ASUS HD7770-DC-1GD5-V2', 'VGA ATI (2).jpg', N'Combining 28nm AMD GPU technology with DirectCU
cooling and overclocking 
DirectCU utilizes direct-contact GPU heatpipes for 20%
cooler and significantly quieter performance than reference.
GPU Tweak utility helps you modify and tune clock speeds,
voltages, and fan performance via an intuitive interface.
AMD Eyefinity™ technology extends your viewing landscape
across multiple monitors.
New PCIe 3.0 delivers double the bandwidth per lane of
PCIe 2.0 for faster GPU–CPU communication.', ' ', N'Cái', '3338000', '7', '11', '12', '1', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'ASUS HD7790-DC2OC-1GD5', 'VGA ATI (3).jpg', N'ASUS HD 7790 DirectCU II cards offer cool gaming graphics
OC-selected 1075MHz core, 75MHz higher than
reference for smoother gaming
DirectCU II achieves 20% lower temps and
vastly quieter performance than reference
with direct-contact copper heatpipes and dual fans
GPU Tweak helps you modify clock speeds, voltages,
fan performance and more, all via an intuitive interface', ' ', N'Cái', '3766000', '7', '11', '12', '1', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'ASUS EAH6950 DCII/2DI4S/2GD5', 'VGA ATI (4).jpg', N'ASUS HD 6950 Series graphics cards with dual-fan cooling performance 
Speed up heat dissipation with 600% more airflow via
exclusive DirectCU with dual fan design
Expand your visual horizon across six monitors with
four native DisplayPort outputs
Super Alloy Power technology delivers 15% Performance boost,
2.5 longer lifespan, 35C cooler operation
Crank up 50% faster clock speed with exclusive Voltage Tweak', ' ', N'Cái', '6120000', '7', '11', '12', '1', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'Gigabyte GV-R545-1GI', 'VGA ATI (5).jpg', N'Powered by AMD Radeon HD 5450 GPU
Integrated with the first 1GB DDR3 memory and 64-bit memory interface
Features Dual-link DVI-I / D-sub / HDMI
Support CrossFireX™ and Avivo™HD
System power supply requirement: 400W', ' ', N'Cái', '840000', '7', '11', '12', '1', '3', '01/06/2014', '100', '0')
insert into sanpham values(N'Gigabyte GV-R557D3-2GI', 'VGA ATI (6).jpg', N'Powered by AMD Radeon HD 5570 GPU
Integrated with the first 2GB DDR3 memory and 128-bit memory interface
Features Dual-link DVI-D / D-sub / HDMI
Support Avivo™HD
System power supply requirement: 400W', ' ', N'Cái', '1420000', '7', '11', '12', '1', '3', '01/06/2014', '100', '0')
insert into sanpham values(N'Gigabyte GV-R667D3-2GI', 'VGA ATI (7).jpg', N'Powered by AMD Radeon HD 6670 GPU
Integrated with the first 2GB DDR3 memory and 128-bit memory interface
Features Dual-link DVI-D / D-sub / HDMI
Support CrossFireX™ and Avivo™HD
System power supply requirement: 400W', ' ', N'Cái', '1730000', '7', '11', '11', '2', '3', '01/06/2014', '100', '0')
insert into sanpham values(N'Gigabyte GV-R775OC-1GI', 'VGA ATI (8).jpg', N'Powered by AMD Radeon HD 7750 GPU
Integrated with the first 1GB GDDR5 memory and 128-bit memory interface
Features Dual-link DVI-D / HDMI / D-Sub
Overclock to 880 MHz
Support AMD Avivo™HD
System power supply requirement: 400W', ' ', N'Cái', '2470000', '7', '11', '12', '1', '3', '01/06/2014', '100', '0')
insert into sanpham values(N'Gigabyte GV-R787OC-2GD', 'VGA ATI (9).jpg', N'Powered by AMD Radeon HD 7870 GHz Edition GPU
Integrated with the first 2GB GDDR5 memory and 256-bit memory interface
Features Dual-link DVI-I / HDMI / mini DisplayPort * 2
Overclock to 1100 MHz
Support AMD Eyefinity Technology and Avivo™HD
System power supply requirement: 500W', ' ', N'Cái', '6240000', '7', '11', '12', '1', '3', '01/06/2014', '100', '0')

--VGA nVIDIA
insert into sanpham values(N'ASUS ENGTS450 DC SL/DI/1GD3', 'VGA nVIDIA (1).jpg', N'ASUS GTS450 is 0dB silent, perfect for HTPC and Full HD entertainment 
Effective and quiet DirectCU Silent 0dB thermal design
Unplugged GTS450 graphics that does not need extra power
supply – making it the best upgrade choice
Crank up 50% faster clock speed with exclusive Voltage Tweak', ' ', N'Cái', '2375000', '8', '11', '12', '2', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'ASUS ENGTX650-DCG-1GD5', 'VGA nVIDIA (2).jpg', N'GF GTX650 - DDR5-1024MB -  128bit - Dual DVI (HDCP) / VGA/ HDMI (1.4),
Display Port GPU  PhysX -  S/p SLI ,  4 HD displays', ' ', N'Cái', '3082000', '8', '11', '11', '3', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'Gigabyte GV-N650OC-2GI', 'VGA nVIDIA (3).jpg', N'Powered by NVIDIA GeForce GTX 650 GPU
Integrated with the first 2048MB GDDR5 memory and 128-bit memory interface
Features Dual-link DVI-D*2 / HDMI / D-Sub
Core Clock: 1110 MHz
Support PCI Express 3.0 x16 bus interface
Support NVIDIA 3D Vision™ Surround technology
Support NVIDIA® CUDA™ Technology
Support NVIDIA® PhysX™ Technology
Support NVIDIA® FXAA / TXAA Technology
Support NVIDIA® Adaptive Vertical Sync Technology
System power supply requirement: 400W', ' ', N'Cái', '3570000', '8', '11', '12', '2', '3', '01/06/2014', '100', '0')
insert into sanpham values(N'ASUS GT640-1GD3-L', 'VGA nVIDIA (4).jpg', N'Great value graphics with superior stability and 3D gaming
Premium alloys inside power delivery components defeat the
heat for cards that run better, cooler, and longer than reference.
GPU Tweak utility helps you modify and tune clock speeds,
voltages, and fan performance via an intuitive interface.
Drive up to four HD displays (up to three with NVIDIA Surround® technology),
or connect to a 3D-enabled TV for a true cinematic 3D experience', ' ', N'Cái', '2311000', '8', '11', '12', '2', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'ASUS HD7750-DCSL-1GD5', 'VGA nVIDIA (5).jpg', N'Sleek 28nm card with GPU Tweak
DirectCU Silent thermal utilizes direct contact copper
heatpipes and a large dissipation area to speed up heat
removal with no noise emissions - achieving 16% cooler
performance than conventional passive cards.
Premium alloys inside power delivery components defeat the
heat for cards that run better, cooler, and longer than reference.
GPU Tweak utility helps you modify and tune clock speeds,
voltages, and fan performance via an intuitive interface', ' ', N'Cái', '2482000', '8', '11', '12', '2', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'Gigabyte GV-N210D3-1GI', 'VGA nVIDIA (6).jpg', N'-Powered by NVIDIA GeForce 210 GPU
-Supports PCI Express 2.0
-Microsoft DirectX 10.1 and OpenGL 3.1 support
-Integrated with industry is best 1GB DDR3 memory
and 64-bit memory interface
-Supports NVIDIA PureVideo® HD technology
-Features Dual link DVI-I / D-sub / HDMI with HDCP protection', ' ', N'Cái', '840000', '8', '11', '12', '2', '3', '01/06/2014', '100', '0')
insert into sanpham values(N'Gigabyte GV-N550OC-1GI', 'VGA nVIDIA (7).jpg', N'Powered by NVIDIA GeForce GTX 550 Ti GPU
Integrated with industry is best 1 GB GDDR5
memory and 192-bit memory interface
Features Dual link DVI-I*2 / mini HDMI with HDCP protection
GIGABYTE latest 10cm Fan cooling design
Support NVIDIA 3D VisionTM and SLI technologies
Minimum 400W or greater system power supply with
one 6-pin external power connector', ' ', N'Cái', '3700000', '8', '11', '12', '2', '3', '01/06/2014', '100', '0')

--Case Cooler master
insert into sanpham values(N'CoolerMaster RC 430', 'Case Cooler master (1).jpg', N'2 Fan 12cm, nhôm và thép cao cấp', ' ', N'Cái', '980000', '9', '11', '12', '3', '13', '01/06/2014', '100', '0')
insert into sanpham values(N'CoolerMaster K380', 'Case Cooler master (2).jpg', N'USB 3.0, chết liệu SECC- nhựa, 3x ODD 5.25", 6x HDD,
trang bị sẵn 1 Fan 120 LED phía trước', ' ', N'Cái', '1020000', '9', '11', '12', '3', '13', '01/06/2014', '100', '0')
insert into sanpham values(N'CoolerMaster USP 100', 'Case Cooler master (3).jpg', N'1 FAN 12cm, nhôm và thép cao cấp', ' ', N'Cái', '1320000', '9', '11', '12', '3', '13', '01/06/2014', '100', '0')
insert into sanpham values(N'CoolerMaster RC 431', 'Case Cooler master (4).jpg', N'Có 1 fan 12cm màu xanh phía trước, nhôm và thép cao cấp,
Hỗ trợ gắn đc 6 fan, USB 3.0, X-Dock', ' ', N'Cái', '1110000', '9', '11', '12', '3', '13', '01/06/2014', '100', '0')
insert into sanpham values(N'CoolerMaster HAF 922 Red', 'Case Cooler master (5).jpg', N'2 FAN 20cm, nhôm và thép cao cấp,
hỗ trợ gắn tản nhiệt bằng dung dịch', ' ', N'Cái', '2840000', '9', '11', '12', '3', '13', '01/06/2014', '100', '0')

--Power Acbel
insert into sanpham values(N'Acbel 450W CE2', 'Power Acbel (1).jpg', N'Fan 12cm, 3x ATA, 3x SATA,
1x PCI-Ex, 4+4p CPU, 20+4 pins', ' ', N'Cái', '650000', '10', '11', '12', '4', '15', '01/06/2014', '100', '0')
insert into sanpham values(N'Acbel 500W I-power G550', 'Power Acbel (2).jpg', N'ATX 2.3, hiệu suất 81%, 4Sata,
2IDE,PCI_E (6+2) Pin, Single Rail', ' ', N'Cái', '1200000', '10', '11', '12', '4', '15', '01/06/2014', '100', '0')
insert into sanpham values(N'Acbel 470W E2 Plus', 'Power Acbel (3).jpg', N'FAN 12cm, nguồn đen, 3 đầu cắm, 4x SATA, ver 2.3ATX,
4+4 pins (For Dual CPU), 1x 6+2 pins (for PCI-Express)', ' ', N'Cái', '780000', '10', '11', '12', '4', '15', '01/06/2014', '100', '0')
insert into sanpham values(N'Acbel 550W I-Power G600', 'Power Acbel (4).jpg', N'ATX 2.3, hiệu suất 81%, 4 Sata, 4 IDE,4 PCI_E (6+2) Pin, Single Rail', ' ', N'Cái', '1300000', '10', '11', '12', '4', '15', '01/06/2014', '100', '0')
insert into sanpham values(N'Acbel 600W R8II', 'Power Acbel (5).jpg', N'Hiệu năng 88%, Fan màu 12cm, 3x ATA, 6x SATA, 4+4p CPU, 2x PCI-Ex, PFC', ' ', N'Cái', '1500000', '10', '11', '12', '4', '15', '01/06/2014', '100', '0')
insert into sanpham values(N'Acbel 750W iPower 85H', 'Power Acbel (6).jpg', N'Fan 12cm, 2x ATA, 6x SATA, 4+4p CPU, 4PCI-Ex, Hiệu suất 80%', ' ', N'Cái', '1680000', '10', '11', '12', '4', '15', '01/06/2014', '100', '0')

--Power Cooler master
insert into sanpham values(N'Cooler Master Silent Pro Gold 1000W V2.3', 'Power Cooler master (1).jpg', N'Fan 13cm, 6x IDE, 9x SATA, 1x 12V, 2x 8Pin,
2x PCI-Ex, Active PFC, Hiệu suất 85%', ' ', N'Cái', '4900000', '10', '11', '12', '1', '13', '01/06/2014', '100', '0')
insert into sanpham values(N'Cooler Master V1000W', 'Power Cooler master (2).jpg', N'Fan 13.5cm, 9 Sata, 4 ATA, 1x12V (4+4pin) CPU,
8 PCI-Exp 6+2pin, chuẩn RoHS, Active PFC, hiệu suất 80%, cáp rời ', ' ', N'Cái', '4700000', '10', '11', '12', '1', '13', '01/06/2014', '100', '0')
insert into sanpham values(N'Cooler Master V 850W', 'Power Cooler master (3).jpg', N'Fan 13.5cm, 9 Sata, 4 ATA, 2x12V (4+4pin) CPU,
6 PCI-Exp 6+2pin, chuẩn RoHS, Active PFC, hiệu suất 80%, cáp rời', ' ', N'Cái', '4000000', '10', '11', '12', '1', '13', '01/06/2014', '100', '0')
insert into sanpham values(N'Cooler Master Silent Pro M2 720W', 'Power Cooler master (4).jpg', N'Fan 13.5cm, 1 đường 12v 58A, (4+4pin) CPU, 9 Sata,
5 đầu cắm, 4 PCI Express 6 + 2pin, chuẩn RoHS,
Active PFC, hiệu suất 80% PLUS, cáp rời', ' ', N'Cái', '2700000', '10', '11', '12', '1', '13', '01/06/2014', '100', '0')
insert into sanpham values(N'Cooler Master M620W Real M', 'Power Cooler master (5).jpg', N'Fan 13.5cm, 9x SATA, 5x ATA, 1x 12V,
2x PCI-Ex, Active PFC, 80 Plus', ' ', N'Cái', '1680000', '10', '11', '12', '1', '13', '01/06/2014', '100', '0')
insert into sanpham values(N'Cooler Master 550W GX II', 'Power Cooler master (6).jpg', N'Fan 12cm, 6 Sata, 3 ATA, 2x12V (4+4pin) CPU,
4 PCI-Exp 6 + 2 pin, Chuẩn ROHS, Hiệu suất 80%', ' ', N'Cái', '1620000', '10', '11', '12', '1', '13', '01/06/2014', '100', '0')

--Moniter 17"
insert into sanpham values(N'DELL E1713s', 'Moniter 17 (1).jpg', N'1280x1024, Độ tương phản 1000:1, thời gian đáp ứng 5ms, D-Sub', '17"', N'Cái', '2250000', '11', '11', '12', '2', '16', '01/06/2014', '100', '0')
insert into sanpham values(N'HP LE1711', 'Moniter 17 (2).jpg', N'1280 x 1024. Độ tương phản 1.000:1, thời gian đáp ứng 5ms', '17"', N'Cái', '2320000', '11', '11', '12', '2', '18', '01/06/2014', '100', '0')
insert into sanpham values(N'Samsung E1720NRX', 'Moniter 17 (3).jpg', N'1280 x 1024 - Vuông. D-SUB, Độ tương phản 50.000:1, thời gian đáp ứng 5ms', '17"', N'Cái', '2350000', '11', '11', '12', '2', '17', '01/06/2014', '100', '0')

--Moniter 19"
insert into sanpham values(N'DELL E1913S LED', 'Moniter 19 (1).jpg', N'1280 x 1024, Độ tương phản 1.000:1, Thời gian đáp ứng 2ms, D-Sub', '19"', N'Cái', '2850000', '11', '11', '12', '3', '16', '01/06/2014', '100', '0')
insert into sanpham values(N'Samsung S19B370B', 'Moniter 19 (2).jpg', N'1366x768,DVI, LED độ tương phản 1000:1, thời gian đáp ứng 5ms, D-Sub', '19"', N'Cái', '2330000', '11', '11', '12', '3', '17', '01/06/2014', '100', '0')
insert into sanpham values(N'Samsung S19C300BS', 'Moniter 19 (3).jpg', N'1366x768, DVI, D-Sub, Độ tương phản 1000:1, thời gian đáp ứng 5ms, Led', '19"', N'Cái', '2290000', '11', '11', '12', '3', '17', '01/06/2014', '100', '0')
insert into sanpham values(N'LG 19EN43S LED', 'Moniter 19 (4).jpg', N'1366x768, D-Sub, Độ tương phản 5000000:1, thời gian đáp ứng 5ms, độ sáng 250 nits', '19"', N'Cái', '2140000', '11', '11', '12', '3', '19', '01/06/2014', '100', '0')
insert into sanpham values(N'HP W1972a LED', 'Moniter 19 (5).jpg', N'LED, VGA, DVI, Độ phân giải 1366 x 768, Độ tương phản 600:1, Thời gian đáp ứng 5ms.', '19"', N'Cái', '1860000', '11', '11', '12', '3', '18', '01/06/2014', '100', '0')
insert into sanpham values(N'ASUS 18.5 VS197DE', 'Moniter 19 (6).jpg', N'LED 1366x768 - Smart Contrast Ratio 50.000.000 : 1 - Response Time 5(ms) - S/p D-sub', '19"', N'Cái', '1944000', '11', '11', '12', '3', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'DELL IN1930', 'Moniter 19 (7).jpg', N'1366 x 768, VGA, Độ tương phản 1.000:1, thời gian đáp ứng 5ms', '19"', N'Cái', '2070000', '11', '11', '12', '3', '16', '01/06/2014', '100', '0')
insert into sanpham values(N'Samsung S19B150B LED', 'Moniter 19 (8).jpg', N'1366 x 768, D-SUB, DVI, LED độ tương phản 1.000:1, thời gian đáp ứng 5ms', '19"', N'Cái', '2230000', '11', '11', '12', '3', '17', '01/06/2014', '100', '0')

--Moniter 20"
insert into sanpham values(N'DELL Pro P2011Ht', 'Moniter 20 (1).jpg', N'1600 x 900, D-sub, DVI-D. Độ tương phản 1.000:1, thời gian đáp ứng 5ms', '20"', N'Cái', '3140000', '11', '11', '12', '4', '16', '01/06/2014', '100', '0')
insert into sanpham values(N'LG 20EN33SS', 'Moniter 20 (2).jpg', N'1600x900, D-Sub, Độ tương phản 5.000.000:1, thời gian đáp ứng 5ms, độ sáng 200 nits', '20"', N'Cái', '2330000', '11', '11', '12', '4', '19', '01/06/2014', '100', '0')
insert into sanpham values(N'Samsung LED S20B370B', 'Moniter 20 (3).jpg', N'1600 x 900 D-SUB, DVI. Độ tương phản 1.000:1, Thời gian đáp ứng 5ms', '20"', N'Cái', '3150000', '11', '11', '12', '4', '17', '01/06/2014', '100', '0')
insert into sanpham values(N'ASUS VH203D', 'Moniter 20 (4).jpg', N'1600 x 900, D-SUB, Độ tương phản 10.000:1, Thời gian đáp ứng 5ms', '20"', N'Cái', '2300000', '11', '11', '12', '3', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'DELL Pro P2012H', 'Moniter 20 (5).jpg', N'1600 x 900, D-SUB + DVI-D, USB upstream, Độ tương phản 1.000:1, thời gian đáp ứng 5ms', '20"', N'Cái', '2800000', '11', '11', '12', '4', '16', '01/06/2014', '100', '0')

--Moniter 22"
insert into sanpham values(N'LG 22EA53V', 'Moniter 22 (1).jpg', N'1920x1080 (Full HD), DVI-D, D-Sub, HDMI, Độ tương phản 5.000.000:1, thời gian đáp ứng 5ms, độ sáng 250 nits', '22"', N'Cái', '3790000', '11', '11', '12', '1', '19', '01/06/2014', '100', '0')
insert into sanpham values(N'LG 22EN43T', 'Moniter 22 (2).jpg', N'1920x1080 (Full HD), DVI-D, D-Sub, Độ tương phản 5.000.000:1, thời gian đáp ứng 5ms, độ sáng 250 nits', '22"', N'Cái', '3300000', '11', '11', '12', '1', '19', '01/06/2014', '100', '0')
insert into sanpham values(N'Samsung S22C300', 'Moniter 22 (3).jpg', N'1600x900, độ tương phản 1.000:1, thời gian đáp ứng 5ms, D-Sub, DVI, Led', '22"', N'Cái', '3400000', '11', '11', '12', '1', '17', '01/06/2014', '100', '0')
insert into sanpham values(N'DELL S2340L LED', 'Moniter 22 (4).jpg', N'Full HD 1920 x 1080, VGA + HDMI, Độ tương phản 8.000.000:1, Thời gian đáp ứng 7ms', '22"', N'Cái', '4150000', '11', '11', '12', '1', '16', '01/06/2014', '100', '0')
insert into sanpham values(N'Asus 23 VS 239HR IPS Led', 'Moniter 22 (5).jpg', N'Full HD 1920x1080 - Contrast Ratio 80.000.000 : 1 - Response Time 5(ms) - S/p D-Sub/DVI-D/HDMI', '22"', N'Cái', '3959000', '11', '11', '12', '1', '2', '01/06/2014', '100', '0')
insert into sanpham values(N'DELL Pro P2312HT', 'Moniter 22 (6).jpg', N'1920 x 1080, D-Sub + DVI-D, USB upstream, Độ tương phản 1.000:1, thời gian đáp ứng 5ms', '22"', N'Cái', '3730000', '11', '11', '12', '1', '16', '01/06/2014', '100', '0')
insert into sanpham values(N'LG LED IPS224V', 'Moniter 22 (7).jpg', N'Full HD 1920x1080, D-SUB + DVI-D, HDMI, Độ tương phản 5.000.000:1, thời gian đáp ứng 5ms, độ sáng 250 nits', '22"', N'Cái', '3750000', '11', '11', '12', '1', '19', '01/06/2014', '100', '0')

--Keyboard Genius
insert into sanpham values(N'Genius Luxemate i220', 'Keyboard Genius (1).jpg', N'USB  Multimedia, mỏng', ' ', N'Cái', '200000', '12', '11', '12', '2', '20', '01/06/2014', '100', '0')
insert into sanpham values(N'Genius KB-M220', 'Keyboard Genius (2).jpg', N'- Bàn phím multimedia dạng mỏng
- 12 phím nóng / 7 phím media
- Giao tiếp USB', ' ', N'Cái', '190000', '12', '11', '12', '2', '20', '01/06/2014', '100', '0')
insert into sanpham values(N'Genius Slimstar i8150', 'Keyboard Genius (3).jpg', N'Bộ chuột và bàn phím không dây 2.4Ghz.
Bàn phím cực mỏng, phong cách Apple like.
Chuột quang 1600 dpi Pico receiver, 12 nút ứng dụng', ' ', N'Cái', '620000', '12', '11', '12', '2', '20', '01/06/2014', '100', '0')
insert into sanpham values(N'Genius SlimStar 801', 'Keyboard Genius (4).jpg', N'Wireless   2 phím nóng, chống thấm nước', ' ', N'Cái', '4240000', '12', '11', '12', '2', '20', '01/06/2014', '100', '0')
insert into sanpham values(N'Genius KB 110X USB', 'Keyboard Genius (5).jpg', N'Bàn phím cổng USB', ' ', N'Cái', '105000', '12', '11', '12', '2', '20', '01/06/2014', '100', '0')
insert into sanpham values(N'Genius Slimstar 8000X', 'Keyboard Genius (6).jpg', N'Bộ chuột và bàn phím không dây 2.4Ghz,
Pico receiver, 2 nút chỉnh âm', ' ', N'Cái', '370000', '12', '11', '12', '2', '20', '01/06/2014', '100', '0')

--Keyboard Logitech
insert into sanpham values(N'Logitech K750 Solar', 'Keyboard Logitech (1).jpg', N'Wireless - Sử dụng năng lượng mặt trời', ' ', N'Cái', '1480000', '12', '11', '12', '3', '21', '01/06/2014', '100', '0')
insert into sanpham values(N'Logitech MK200', 'Keyboard Logitech (2).jpg', N'Bàn phím cổng USB, chống thấm nước', ' ', N'Cái', '306000', '12', '11', '12', '3', '21', '01/06/2014', '100', '0')
insert into sanpham values(N'Logitech K800 Illuminate', 'Keyboard Logitech (3).jpg', N'Wireless, Receiver siêu nhỏ, siêu mỏng, đèn nền cảm ứng', ' ', N'Cái', '1900000', '12', '11', '12', '3', '21', '01/06/2014', '100', '0')
insert into sanpham values(N'Logitech Classic Keyboard K100', 'Keyboard Logitech (4).jpg', N'Bàn phím cổng PS/2', ' ', N'Cái', '130000', '12', '11', '12', '3', '21', '01/06/2014', '100', '0')
insert into sanpham values(N'Logitech Cordless MX5500', 'Keyboard Logitech (5).jpg', N'Logitech Cordless Desktop MX 5500 Revolution
Bluetooth, Mouse Laser, Media, LCD hiển thị thông số hệ thống', ' ', N'Cái', '2850000', '12', '11', '12', '3', '21', '01/06/2014', '100', '0')

--Mouse Genius
insert into sanpham values(N'Genius DX-7020', 'Mouse Genius (1).jpg', N'- Mouse Blue-eye tracking wireless 2.4GHz
- Độ phân giải 1200dpi
- Chức năng Stick-N-Go
- Receiver hạt đậu', ' ', N'Cái', '315000', '13', '10', '12', '4', '20', '01/06/2014', '100', '0')
insert into sanpham values(N'Genius NS - 6500Z', 'Mouse Genius (2).jpg', N'Công nghệ hồng ngoại không dây 2.4 Ghz, Pico receiver
Chất liệu cao su tạo cảm giác êm ái & thoải mái khi cầm', ' ', N'Cái', '280000', '13', '10', '12', '4', '20', '01/06/2014', '100', '0')
insert into sanpham values(N'Genius NS-6000', 'Mouse Genius (3).jpg', N'Mouse Optical wireless, 1000dpi
2.4GHz, Receiver hạt đậu', ' ', N'Cái', '180000', '13', '10', '12', '4', '20', '01/06/2014', '100', '0')
insert into sanpham values(N'Genius DX-220', 'Mouse Genius (4).jpg', N'USB 2.0 - Mouse Optical - 1200dpi
Công nghê BlueEye Tracking chạy tốt trên đá, kính', ' ', N'Cái', '159000', '13', '11', '12', '4', '20', '01/06/2014', '100', '0')
insert into sanpham values(N'Genius Wireless Traveler 6000', 'Mouse Genius (5).jpg', N'Mouse quang không dây, 1200dpi
2.4GHz, Receiver hạt đậu', ' ', N'Cái', '190000', '13', '10', '12', '4', '20', '01/06/2014', '100', '0')
insert into sanpham values(N'Genius Wireless Traveler 9000', 'Mouse Genius (6).jpg', N'Wireless OPTICAL Blue-eye tracking 1200DPI', ' ', N'Cái', '276000', '13', '10', '12', '4', '20', '01/06/2014', '100', '0')
insert into sanpham values(N'Genius NetScroll NS120', 'Mouse Genius (7).jpg', N'USB - Optical', ' ', N'Cái', '75000', '13', '11', '12', '4', '20', '01/06/2014', '100', '0')
insert into sanpham values(N'Genius Traveler 6000X', 'Mouse Genius (8).jpg', N'Wireless Optical, 1200dpi, Pin AAA', ' ', N'Cái', '190000', '13', '10', '12', '4', '20', '01/06/2014', '100', '0')
insert into sanpham values(N'Genius NS 110X', 'Mouse Genius (9).jpg', N'USB - Optical', ' ', N'Cái', '85000', '13', '10', '12', '4', '20', '01/06/2014', '100', '0')

--Mouse Logitech
insert into sanpham values(N'Logitech Touch Mouse M600', 'Mouse Logitech (1).jpg', N'- Chuột Laser không dây 2.4Ghz
- Cuộn cảm ứng trên chuột, không dùng bánh xe cuộn
- Bộ phận phát sóng siêu nhỏ
- 2 Pin AA', ' ', N'Cái', '1129000', '13', '10', '12', '1', '21', '01/06/2014', '100', '0')
insert into sanpham values(N'Logitech M105', 'Mouse Logitech (2).jpg', N'USB - Optical 1000dpi', ' ', N'Cái', '196000', '13', '11', '12', '1', '21', '01/06/2014', '100', '0')
insert into sanpham values(N'Logitech Wireless Mouse M505', 'Mouse Logitech (3).jpg', N'Wireless Optical, 1000dpi, Pin AAA', ' ', N'Cái', '665000', '13', '10', '12', '1', '21', '01/06/2014', '100', '0')
insert into sanpham values(N'Logitech Marathon Mouse M705', 'Mouse Logitech (4).jpg', N'Wireless Optical, 1200dpi, Pin AAA', ' ', N'Cái', '953000', '13', '10', '12', '1', '21', '01/06/2014', '100', '0')
insert into sanpham values(N'Logitech M325', 'Mouse Logitech (5).jpg', N'Wireless OPTICAL, 1200dpi, Receiver siêu nhỏ', ' ', N'Cái', '447000', '13', '10', '12', '1', '21', '01/06/2014', '100', '0')
insert into sanpham values(N'Logitech M515 Cordless', 'Mouse Logitech (6).jpg', N'- Kiểu giao tiếp: USB, Không dây - (Wireless)
- Số nút: 3 nút 
- Nút cuộn: Dọc
- Bề mặt thiết kế đặc biệt có thẻ di chuyển dễ dàng trên bề mặt mềm như : vải, ghế sofa ...
- Cảm biến nhận diện tay người dùng
- Chức năng Hyper fast Scrolling - Duyệt tài liệu nhanh', ' ', N'Cái', '753000', '13', '10', '12', '1', '21', '01/06/2014', '100', '0')
insert into sanpham values(N'Logitech B100', 'Mouse Logitech (7).jpg', N'USB - Optical', ' ', N'Cái', '80000', '13', '11', '12', '1', '21', '01/06/2014', '100', '0')
insert into sanpham values(N'Logitech M187 Cordless Optical Mini', 'Mouse Logitech (8).jpg', N'- Mouse wireless optical 2.4Ghz khoảng cách 10m
- Sử dụng pin AAA
- Công nghệ quang học không ánh sáng (Invisible Optic)
- Nano Receive cất giữ trong thân mouse
- Kích cỡ nhỏ gọn trong lòng bàn tay', ' ', N'Cái', '253000', '13', '10', '12', '1', '21', '01/06/2014', '100', '0')

--Speaker SoundMax
insert into sanpham values(N'SoundMax C-11', 'Speaker SoundMax (1).jpg', N'Volume Control, 2 Speakers Stereo, 18W RMS', ' ', N'Cái', '380000', '14', '11', '12', '2', '23', '01/06/2014', '100', '0')
insert into sanpham values(N'SoundMax V-10', 'Speaker SoundMax (2).jpg', N'Loa di động, Support USB, SD Card, FM, Ghi âm FM,
Pin sạc 850mAh, 3W RMS, Màu xanh', ' ', N'Cái', '448000', '14', '11', '12', '2', '23', '01/06/2014', '100', '0')
insert into sanpham values(N'SoundMax V-11', 'Speaker SoundMax (3).jpg', N'Loa di động, Support USB, SD Card, FM, Ghi âm FM,
Pin sạc 1000mAh, 6W RMS, Màu đỏ ', ' ', N'Cái', '520000', '14', '11', '12', '2', '23', '01/06/2014', '100', '0')
insert into sanpham values(N'SoundMax A2250', 'Speaker SoundMax (4).jpg', N'3D, Bass, Treble, 1 Sub, 2 Speakers, 40 RMS', ' ', N'Cái', '700000', '14', '11', '12', '2', '23', '01/06/2014', '100', '0')
insert into sanpham values(N'SoundMax B30 5.1', 'Speaker SoundMax (5).jpg', N'3D, Bass, Treble, 1 Sub, 5 Speakers, REMOTE, 105W RMS', ' ', N'Cái', '1626000', '14', '11', '12', '2', '23', '01/06/2014', '100', '0')
insert into sanpham values(N'SoundMax - A8800', 'Speaker SoundMax (6).jpg', N'3D, Bass, Treble, 1 Sub, 4 Speakers, 90W RMS Karaoke', ' ', N'Cái', '1087000', '14', '11', '12', '2', '23', '01/06/2014', '100', '0')
insert into sanpham values(N'SoundMax - A5000', 'Speaker SoundMax (7).jpg', N'3D, Bass, Treble, 1 Sub, 4 Speakers, 60W RMS', ' ', N'Cái', '898000', '14', '11', '12', '2', '23', '01/06/2014', '100', '0')
insert into sanpham values(N'SoundMax A820', 'Speaker SoundMax (8).jpg', N'3D, Bass, Treble, 1 Sub, 2 Speakers, 25W RMS', ' ', N'Cái', '500000', '14', '11', '12', '2', '23', '01/06/2014', '100', '0')
insert into sanpham values(N'SoundMax A860 2.1', 'Speaker SoundMax (9).jpg', N'3D, Bass, Treble, 1 Sub, 2 Speakers, 35W RMS', ' ', N'Cái', '645000', '14', '11', '12', '2', '23', '01/06/2014', '100', '0')
insert into sanpham values(N'SoundMAX -A2700', 'Speaker SoundMax (10).jpg', N'3D, Bass, Treble, 1 Sub, 2 Speakers, 60W RMS', ' ', N'Cái', '1000000', '14', '11', '12', '2', '23', '01/06/2014', '100', '0')
insert into sanpham values(N'SoundMax AK600', 'Speaker SoundMax (11).jpg', N'3D, Bass, Treble, 2 Speakers, 90W RMS', ' ', N'Cái', '1560000', '14', '11', '12', '2', '23', '01/06/2014', '100', '0')
insert into sanpham values(N'SoundMAX B50 5.1', 'Speaker SoundMax (12).jpg', N'3D, Bass, Treble, 1 Sub, 5 Speakers, REMOTE, 125W RMS', ' ', N'Cái', '1680000', '14', '11', '12', '2', '23', '01/06/2014', '100', '0')
insert into sanpham values(N'SoundMax A830 2.1', 'Speaker SoundMax (13).jpg', N'3D,  Bass,  Treble,  1 Sub,  2 Speakers,  30W RMS', ' ', N'Cái', '600000', '14', '11', '12', '2', '23', '01/06/2014', '100', '0')

--Headphone Philips
insert into sanpham values(N'Philips SHE8000', 'Headphone Philips (1).jpg', N'Tai nghe nhét tai', ' ', N'Cái', '468000', '15', '11', '12', '3', '22', '01/06/2014', '100', '0')
insert into sanpham values(N'Philips SHM-1900', 'Headphone Philips (2).jpg', N'Tai nghe chụp đầu', ' ', N'Cái', '348000', '15', '11', '12', '3', '22', '01/06/2014', '100', '0')
insert into sanpham values(N'Philips SHS4700', 'Headphone Philips (3).jpg', N'Tai nghe móc tai', ' ', N'Cái', '398000', '15', '11', '12', '3', '22', '01/06/2014', '100', '0')
insert into sanpham values(N'Philips SHP3000', 'Headphone Philips (4).jpg', N'Tai nghe chụp đầu', ' ', N'Cái', '698000', '15', '11', '12', '3', '22', '01/06/2014', '100', '0')
insert into sanpham values(N'Philips SHL8800', 'Headphone Philips (5).jpg', N'Tai nghe chụp đầu', ' ', N'Cái', '998000', '15', '11', '12', '3', '22', '01/06/2014', '100', '0')
insert into sanpham values(N'Philips SHL9300', 'Headphone Philips (6).jpg', N'Tai nghe chụp đầu', ' ', N'Cái', '1268000', '15', '11', '12', '3', '22', '01/06/2014', '100', '0')
insert into sanpham values(N'Philips SHE2861', 'Headphone Philips (7).jpg', N'Tai nghe nhét tai', ' ', N'Cái', '278000', '15', '11', '12', '3', '22', '01/06/2014', '100', '0')
insert into sanpham values(N'Philips SHE2860', 'Headphone Philips (8).jpg', N'Tai nghe nhét tai', ' ', N'Cái', '278000', '15', '11', '12', '3', '22', '01/06/2014', '100', '0')
insert into sanpham values(N'Philips SHE3575BW', 'Headphone Philips (9).jpg', N'Tai nghe nhét tai, có mic', ' ', N'Cái', '538000', '15', '11', '12', '3', '22', '01/06/2014', '100', '0')
insert into sanpham values(N'Philips SHN5500', 'Headphone Philips (10).jpg', N'Tai nghe chụp đầu', ' ', N'Cái', '1248000', '15', '11', '12', '3', '22', '01/06/2014', '100', '0')
insert into sanpham values(N'Philips SHP2500', 'Headphone Philips (11).jpg', N'Tai nghe chụp đầu', ' ', N'Cái', '478000', '15', '11', '12', '3', '22', '01/06/2014', '100', '0')
insert into sanpham values(N'Philips SHN2500', 'Headphone Philips (12).jpg', N'Tai nghe nhét tai', ' ', N'Cái', '998000', '15', '11', '12', '3', '22', '01/06/2014', '100', '0')
insert into sanpham values(N'Philips SHE3583', 'Headphone Philips (13).jpg', N'Tai nghe nhét tai', ' ', N'Cái', '258000', '15', '11', '12', '3', '22', '01/06/2014', '100', '0')

insert into nhanvien values(N'Phạm Ngọc Tuấn', N'Nam', N'119/5 Trần Quang Cơ, Q.Tân Phú, TP.HCM', '194410968', '01674399211', 'ngoctuanqb9x@gmail.com', 'phamngoctuan', '900150983cd24fb0d6963f7d28e17f72')